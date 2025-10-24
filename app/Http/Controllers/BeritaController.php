<?php

namespace App\Http\Controllers;

use App\Models\Berita;
use App\Models\Prioritas;
use Illuminate\Validation\ValidationException;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\DB;

class BeritaController extends Controller
{
    public function apiLaporanWhatsappPreview(Request $request)
    {
        $start = $request->input('start');
        $end = $request->input('end');
        $satker = $request->input('satker', 'all');
        $divisi = $request->input('divisi', 'all_berita');
        $prioritas = $request->input('prioritas', 'all_priors');
        $konfig = $request->input('konfig');

        // Ambil konfigurasi laporan
        $config = DB::table('konfigurasi_berita')->where('id_konfig', $konfig)->first();
        if (!$config) {
            return response()->json(['success' => false, 'message' => 'Konfigurasi tidak ditemukan'], 404);
        }

        // Query berita
        $query = DB::table('berita')
            ->join('tbl_prioritas', 'berita.prioritas_id', '=', 'tbl_prioritas.id_prioritas')
            ->select('berita.*', 'tbl_prioritas.nama_prioritas_lengkap', 'tbl_prioritas.skala_prioritas')
            ->whereBetween('berita.tgl_input', [$start, $end])
            ->orderBy('tbl_prioritas.skala_prioritas', 'asc');

        if ($satker !== 'all') {
            $query->where('berita.kode_satker', $satker);
        }
        if ($divisi !== 'all_berita') {
            $query->where('berita.kode_divisi', $divisi);
        }
        if ($prioritas !== 'all_priors') {
            $query->where('berita.prioritas_id', $prioritas);
        }

        $beritaList = $query->get();
        if ($beritaList->isEmpty()) {
            return response()->json(['success' => false, 'message' => 'Tidak ada data berita untuk periode ini']);
        }

        // ------------------------
        // 🧾 LAPORAN SOSIAL MEDIA (part1)
        // ------------------------
        $laporanSosmed = "{$config->salam_pembuka}\n\n";
        $laporanSosmed .= "{$config->yth}\n";
        $laporanSosmed .= "Dari : {$config->dari_pengirim}\n\n";
        $laporanSosmed .= "Tembusan Yth:\n";
        foreach (json_decode($config->jumlah_tembusan_yth ?? '[]') as $i => $t) {
            $laporanSosmed .= ($i + 1) . ". $t\n";
        }

        $laporanSosmed .= "\n{$config->pengantar}\n\n";

        $no = 1;
        foreach ($beritaList as $b) {
            $laporanSosmed .= "{$no}. {$b->nama_berita}\n\n";

            if (!empty($b->website) && trim($b->website) != '-') {
                $laporanSosmed .= "WEBSITE\n{$b->website}\n\n";
            }

            if (!empty($b->twitter) && trim($b->twitter) != '-') {
                $laporanSosmed .= "X\n{$b->twitter}\n\n";
            }

            if (!empty($b->facebook) && trim($b->facebook) != '-') {
                $laporanSosmed .= "FACEBOOK\n{$b->facebook}\n\n";
            }

            if (!empty($b->instagram) && trim($b->instagram) != '-') {
                $laporanSosmed .= "INSTAGRAM\n{$b->instagram}\n\n";
            }

            if (!empty($b->tiktok) && trim($b->tiktok) != '-') {
                $laporanSosmed .= "TIKTOK\n{$b->tiktok}\n\n";
            }

            if (!empty($b->youtube) && trim($b->youtube) != '-') {
                $laporanSosmed .= "YOUTUBE\n{$b->youtube}\n\n";
            }

            $no++;
        }

        $laporanSosmed .= "Terimakasih, {$config->salam_penutup}\n";
        $laporanSosmed .= "Hormat Kami :\n{$config->dari_pengirim}\n{$config->nama_kakanwil}\n";

        // ------------------------
        // 📰 LAPORAN MEDIA LOKAL / NASIONAL (part2)
        // ------------------------
        $tanggalLaporan = \Carbon\Carbon::parse($end)->translatedFormat('l, d F Y');

        $laporanMedia = "{$config->salam_pembuka}\n\n";
        $laporanMedia .= "Yth. SEKRETARIS JENDERAL KEMENTERIAN HUKUM.\n";
        $laporanMedia .= "Dari : {$config->dari_pengirim}.\n\n";
        $laporanMedia .= "Tembusan Yth:\n";
        $laporanMedia .= "1 .MENTERI HUKUM RI\n";
        $laporanMedia .= "2 .WAKIL MENTERI KEMENTERIAN HUKUM RI\n";
        $laporanMedia .= "3 .IRJEN KEMENTERIAN HUKUM RI\n\n";
        $laporanMedia .= "Bersama ini kami laporkan kepada SEKRETARIS JENDERAL KEMENTERIAN HUKUM hasil rilis dan publikasi Media Eksternal giat {$config->dari_pengirim}, {$tanggalLaporan} :\n\n";

        $no = 1;
        foreach ($beritaList as $b) {
            // Hanya ambil jika ada data media lokal atau nasional
            $hasMedia = (!empty($b->media_lokal) && $b->media_lokal != '[]') ||
                (!empty($b->media_nasional) && $b->media_nasional != '[]');

            if (!$hasMedia) continue;

            $laporanMedia .= "{$no}. {$b->nama_berita}\n";

            // Ambil link dari media lokal
            $mediaLokal = json_decode($b->media_lokal ?? '[]');
            if (!empty($mediaLokal)) {
                foreach ($mediaLokal as $item) {
                    $split = explode('|||', $item);
                    if (count($split) >= 3 && trim($split[2]) != '-') {
                        $laporanMedia .= "{$split[2]}\n\n";
                    }
                }
            }

            // Ambil link dari media nasional
            $mediaNasional = json_decode($b->media_nasional ?? '[]');
            if (!empty($mediaNasional)) {
                foreach ($mediaNasional as $item) {
                    $split = explode('|||', $item);
                    if (count($split) >= 3 && trim($split[2]) != '-') {
                        $laporanMedia .= "{$split[2]}\n\n";
                    }
                }
            }

            $no++;
        }

        $laporanMedia .= "Terima kasih, {$config->salam_penutup}\n";
        $laporanMedia .= "Hormat Kami : \n";
        $laporanMedia .= "{$config->dari_pengirim}\n\n";
        $laporanMedia .= strtoupper($config->nama_kakanwil ?? 'NAMA KAKANWIL');

        return response()->json([
            'success' => true,
            'part1' => $laporanSosmed,
            'part2' => $laporanMedia,
        ]);
    }





    public function apiIndex(Request $request)
    {
        /**
         * API: Ambil data berita per satker dengan filter & role access
         */
        try {
            $user = auth()->user();
            if (!$user) {
                return response()->json([
                    'success' => false,
                    'message' => 'User tidak terautentikasi',
                ], 401);
            }

            $query = Berita::query();

            /** 🔒 Batasi data sesuai role */
            if ($user->roles === 'superadmin') {
                // superadmin bisa lihat semua
            } elseif (in_array($user->roles, ['humas_satker', 'humas_kanwil'])) {
                $query->where('kode_satker', $user->kode_satker);
            } else {
                return response()->json([
                    'success' => false,
                    'message' => 'Akses ditolak',
                ], 403);
            }

            /** 🔍 Filter berdasarkan parameter request */
            if ($request->filled('nama_berita')) {
                $query->where('nama_berita', 'LIKE', '%' . $request->nama_berita . '%');
            }

            if ($request->filled('kode_divisi') && $request->kode_divisi !== 'all_berita') {
                $query->where('kode_divisi', $request->kode_divisi);
            }

            if ($request->filled('dari') && $request->filled('sampai')) {
                $query->whereBetween('tgl_input', [$request->dari, $request->sampai]);
            }

            /** Urutkan & paginasi */
            $query->orderBy('id_berita', 'desc');
            $berita = $query->paginate(10);

            /** 🔗 Ambil data referensi */
            $dataPrioritas = Prioritas::orderBy('skala_prioritas', 'asc')->get();
            $getMedia = DB::table('mediapartner')
                ->where('kode_satker_penjalin', $user->kode_satker)
                ->get();
            $getDivisi = DB::table('divisi')->get();

            /** Kembalikan response */
            return response()->json([
                'success' => true,
                'message' => 'Data berita berhasil diperoleh',
                'filters' => [
                    'nama_berita' => $request->nama_berita,
                    'kode_divisi' => $request->kode_divisi,
                    'periode' => [$request->dari, $request->sampai],
                ],
                'data' => $berita->items(),
                'pagination' => [
                    'current_page' => $berita->currentPage(),
                    'last_page' => $berita->lastPage(),
                    'total' => $berita->total(),
                ],
                'media_partner' => $getMedia,
                'divisi' => $getDivisi,
                'prioritas' => $dataPrioritas,
            ], 200);

        } catch (\Exception $e) {
            return response()->json([
                'success' => false,
                'message' => 'Terjadi kesalahan: ' . $e->getMessage(),
            ], 500);
        }
    }

    /**
     * API: Simpan berita baru
     */
    public function apiStore(Request $request)
    {
        try {
            $validated = $request->validate([
                'nama_berita' => 'required|string',
                'kode_satker' => 'required|string',
                'kode_divisi' => 'required|string',
                'prioritas_id' => 'required|integer',
            ]);

            $berita = new Berita();
            $berita->nama_berita = $request->nama_berita;
            $berita->kode_satker = $request->kode_satker;
            $berita->kode_divisi = $request->kode_divisi;
            $berita->prioritas_id = $request->prioritas_id;
            $berita->facebook = $request->facebook ?? '-';
            $berita->website = $request->website ?? '-';
            $berita->instagram = $request->instagram ?? '-';
            $berita->twitter = $request->twitter ?? '-';
            $berita->tiktok = $request->tiktok ?? '-';
            $berita->sippn = $request->sippn ?? '-';
            $berita->youtube = $request->youtube ?? '-';

            // Simpan media_lokal & media_nasional TANPA json_encode manual
            // biarkan Laravel casts otomatis menyimpan sebagai JSON
            $berita->media_lokal = $this->normalizeMediaInput($request->media_lokal);
            $berita->media_nasional = $this->normalizeMediaInput($request->media_nasional);

            $berita->tgl_input = now();
            $berita->tgl_update = now();
            //return "hey bro";
            $berita->save();



            return response()->json([
                'success' => true,
                'message' => 'Data berita berhasil disimpan',
                'data' => $berita,
            ], 201);

        } catch (ValidationException $e) {
            return response()->json([
                'success' => false,
                'message' => 'Validasi gagal',
                'errors' => $e->errors(),
            ], 422);
        } catch (\Exception $e) {
            return response()->json([
                'success' => false,
                'message' => 'Terjadi kesalahan: ' . $e->getMessage(),
            ], 500);
        }
    }

    /**
     * Fungsi bantu agar input media fleksibel (array/string)
     */
    private function normalizeMediaInput($value)
    {
        if (empty($value)) {
            return [];
        }

        // Kalau string JSON → decode
        if (is_string($value)) {
            $decoded = json_decode($value, true);
            if (json_last_error() === JSON_ERROR_NONE && is_array($decoded)) {
                return $decoded;
            }
            // Kalau cuma string biasa → jadikan array tunggal
            return [$value];
        }

        // Kalau array langsung → kembalikan saja
        if (is_array($value)) {
            return $value;
        }

        return [];
    }


    /**
     * API: Update berita
     */
    public function apiUpdate(Request $request, $id)
    {
        try {
            $berita = Berita::find($id);

            if (!$berita) {
                return response()->json([
                    'success' => false,
                    'message' => 'Data berita tidak ditemukan',
                ], 404);
            }

            // ✅ Validasi dinamis hanya untuk field yang dikirim
            $rules = [
                'nama_berita'   => 'string',
                'kode_divisi'   => 'string',
                'prioritas_id'  => 'integer',
                'facebook'      => 'nullable|string',
                'website'       => 'nullable|string',
                'instagram'     => 'nullable|string',
                'twitter'       => 'nullable|string',
                'tiktok'        => 'nullable|string',
                'sippn'         => 'nullable|string',
                'youtube'       => 'nullable|string',
            ];

            $validated = $request->validate(
                collect($rules)
                    ->only(array_keys($request->all())) // hanya validasi field yang dikirim
                    ->toArray()
            );

            // 🚀 Update otomatis semua field valid
            $berita->fill($validated);

            // 🧩 Tangani media lokal & nasional
            foreach (['media_lokal', 'media_nasional'] as $field) {
                if ($request->has($field)) {
                    $berita->$field = $this->normalizeMediaInput($request->$field);
                }
            }

            $berita->tgl_update = now();
            $berita->save();
            $berita->refresh(); // ✅ tambahkan ini

            return response()->json([
                'success' => true,
                'message' => 'Data berita berhasil diperbarui',
                'data' => $berita,
            ]);


        } catch (ValidationException $e) {
            return response()->json([
                'success' => false,
                'message' => 'Validasi gagal',
                'errors' => $e->errors(),
            ], 422);
        } catch (\Throwable $e) {
            return response()->json([
                'success' => false,
                'message' => 'Terjadi kesalahan: ' . $e->getMessage(),
            ], 500);
        }
    }



    /**
     * API: Hapus berita
     */
    public function apiDestroy($id)
    {
        try {
            $berita = Berita::find($id);
            if (!$berita) {
                return response()->json([
                    'success' => false,
                    'message' => 'Data berita tidak ditemukan',
                ], 404);
            }

            $berita->delete();

            return response()->json([
                'success' => true,
                'message' => 'Data berita berhasil dihapus',
            ]);
        } catch (\Exception $e) {
            return response()->json([
                'success' => false,
                'message' => 'Terjadi kesalahan: ' . $e->getMessage(),
            ], 500);
        }
    }
}
