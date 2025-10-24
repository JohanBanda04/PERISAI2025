<?php

namespace App\Http\Controllers;

use Illuminate\Http\Request;
use Illuminate\Support\Facades\DB;
use Illuminate\Support\Facades\Storage;
use PhpOffice\PhpWord\PhpWord;
use PhpOffice\PhpWord\IOFactory;
use Illuminate\Support\Str;

class LaporanWhatsappController extends Controller
{
    public function apiGenerate(Request $request)
    {
        try {
            $dari = $request->input('start');
            $sampai = $request->input('end');
            $kodeSatker = $request->input('satker');
            $kodeDivisi = $request->input('divisi');
            $idPrioritas = $request->input('prioritas');
            $idKonfig = $request->input('konfig');

            $dtKonfig = DB::table('konfigurasi_berita')->where('id_konfig', $idKonfig)->first();
            if (!$dtKonfig) {
                return response()->json(['success' => false, 'message' => 'Konfigurasi tidak ditemukan']);
            }

            // 🔹 Query berita
            $query = DB::table('berita')->whereBetween('tgl_input', [$dari, $sampai]);
            if ($kodeSatker && $kodeSatker != 'all') $query->where('kode_satker', $kodeSatker);
            if ($kodeDivisi && $kodeDivisi != 'all_berita') $query->where('kode_divisi', $kodeDivisi);
            if ($idPrioritas && $idPrioritas != 'all_priors') $query->where('prioritas_id', $idPrioritas);
            $dtBerita = $query->orderBy('prioritas_id', 'asc')->get();

            if ($dtBerita->isEmpty()) {
                return response()->json(['success' => false, 'message' => 'Tidak ada data berita']);
            }

            // Setup data tanggal
            $hari = [
                'Sun' => 'Minggu', 'Mon' => 'Senin', 'Tue' => 'Selasa', 'Wed' => 'Rabu',
                'Thu' => 'Kamis', 'Fri' => "Jum'at", 'Sat' => 'Sabtu'
            ];
            $bulan = [
                "", "Januari", "Februari", "Maret", "April", "Mei", "Juni", "Juli",
                "Agustus", "September", "Oktober", "November", "Desember"
            ];
            $tgl = now();
            $tanggalLengkap = $hari[$tgl->format('D')] . ', ' . $tgl->format('d') . ' ' .
                $bulan[intval($tgl->format('m'))] . ' ' . $tgl->format('Y');

            $tembusan = json_decode($dtKonfig->jumlah_tembusan_yth ?? '[]', true);
            $slugKonfig = Str::slug($dtKonfig->name_config, '_');
            $namaSatker = $kodeSatker ?: 'KANWIL_NTB';
            $time = date('Y-m-d');

            Storage::makeDirectory('public/laporan');

            // ======================= FILE 1: MEDIA SOSIAL =======================
            $phpWord1 = new PhpWord();
            $phpWord1->addFontStyle('bold', ['name' => 'Arial', 'size' => 12, 'bold' => true]);
            $phpWord1->addFontStyle('normal', ['name' => 'Arial', 'size' => 12]);
            $section1 = $phpWord1->addSection();

            $section1->addText($dtKonfig->salam_pembuka, 'bold');
            $section1->addText('');
            $section1->addText($dtKonfig->yth, 'normal');
            $section1->addText('Dari : ' . $dtKonfig->dari_pengirim, 'normal');
            $section1->addText('');
            $section1->addText('Tembusan Yth:', 'bold');
            foreach ($tembusan as $i => $t) $section1->addText(($i + 1) . '. ' . $t, 'normal');
            $section1->addText('');
            $section1->addText($dtKonfig->pengantar . ', ' . $tanggalLengkap . ':', 'normal');
            $section1->addText('');

            $no = 1;
            foreach ($dtBerita as $news) {
                $section1->addText("$no. " . $news->nama_berita, 'bold');
                $this->addMediaField($section1, 'WEBSITE', $news->website);
                $this->addMediaField($section1, 'X', $news->twitter);
                $this->addMediaField($section1, 'FACEBOOK', $news->facebook);
                $this->addMediaField($section1, 'INSTAGRAM', $news->instagram);
                $this->addMediaField($section1, 'TIKTOK', $news->tiktok);
                $this->addMediaField($section1, 'YOUTUBE', $news->youtube);
                $section1->addText('');
                $no++;
            }

            $section1->addText($dtKonfig->salam_penutup, 'normal');
            $section1->addText('Hormat Kami :', 'normal');
            $section1->addText($dtKonfig->ttd_kakanwil, 'normal');
            $section1->addText($dtKonfig->nama_kakanwil, 'normal');

            $fileName1 = "LaporanWhatssapRekap_{$namaSatker}_{$slugKonfig}_media_sosial_{$time}.docx";
            $path1 = storage_path("app/public/laporan/$fileName1");
            IOFactory::createWriter($phpWord1, 'Word2007')->save($path1);

            // ======================= FILE 2: MEDIA ONLINE =======================
            $phpWord2 = new PhpWord();
            $phpWord2->addFontStyle('bold', ['name' => 'Arial', 'size' => 12, 'bold' => true]);
            $phpWord2->addFontStyle('normal', ['name' => 'Arial', 'size' => 12]);
            $section2 = $phpWord2->addSection();

            $section2->addText($dtKonfig->salam_pembuka, 'bold');
            $section2->addText('');
            $section2->addText($dtKonfig->yth, 'normal');
            $section2->addText('Dari : ' . $dtKonfig->dari_pengirim, 'normal');
            $section2->addText('');
            $section2->addText('Tembusan Yth:', 'bold');
            foreach ($tembusan as $i => $t) $section2->addText(($i + 1) . '. ' . $t, 'normal');
            $section2->addText('');
            $section2->addText($dtKonfig->pengantar . ', ' . $tanggalLengkap . ':', 'normal');
            $section2->addText('');

            $counter = 1;
            foreach ($dtBerita as $b) {
                foreach (json_decode($b->media_lokal ?? '[]') as $lok) {
                    $parts = explode('|||', $lok);
                    if (isset($parts[2]) && trim($parts[2]) != '-') {
                        $section2->addText($counter . '. ' . $parts[1], 'bold');
                        $section2->addText($parts[2], 'normal');
                        $section2->addText('');
                        $counter++;
                    }
                }
            }
            foreach ($dtBerita as $b) {
                foreach (json_decode($b->media_nasional ?? '[]') as $nas) {
                    $parts = explode('|||', $nas);
                    if (isset($parts[2]) && trim($parts[2]) != '-') {
                        $section2->addText($counter . '. ' . $parts[1], 'bold');
                        $section2->addText($parts[2], 'normal');
                        $section2->addText('');
                        $counter++;
                    }
                }
            }

            $section2->addText($dtKonfig->salam_penutup, 'normal');
            $section2->addText('Hormat Kami :', 'normal');
            $section2->addText($dtKonfig->ttd_kakanwil, 'normal');
            $section2->addText($dtKonfig->nama_kakanwil, 'normal');

            $fileName2 = "LaporanWhatssapRekap_{$namaSatker}_{$slugKonfig}_media_online_{$time}.docx";
            $path2 = storage_path("app/public/laporan/$fileName2");
            IOFactory::createWriter($phpWord2, 'Word2007')->save($path2);

            // 🔹 Return dua URL file
            return response()->json([
                'success' => true,
                'message' => 'Laporan berhasil dibuat',
                'file_urls' => [
                    'media_sosial' => asset("storage/laporan/$fileName1"),
                    'media_online' => asset("storage/laporan/$fileName2"),
                ]
            ]);

        } catch (\Exception $e) {
            return response()->json(['success' => false, 'message' => $e->getMessage()], 500);
        }
    }

    private function addMediaField($section, $label, $value)
    {
        if ($value && trim($value) != '-') {
            $section->addText('');
            $section->addText($label, 'bold');
            $section->addText($value, 'normal');
        }
    }
}
