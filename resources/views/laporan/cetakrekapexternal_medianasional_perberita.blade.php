<!DOCTYPE html>
<html lang="id">
<head>
    <meta charset="utf-8">
    <title>Rekap Berita Media Nasional</title>

    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/normalize/7.0.0/normalize.min.css">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/paper-css/0.4.1/paper.css">

    <style>
        @page { size: A4 landscape; margin: 10mm; }

        body {
            font-family: Arial, Helvetica, sans-serif;
            font-size: 12px;
            color: #000;
        }

        .sheet { overflow: visible; height: auto !important; }

        table { border-collapse: collapse; width: 100%; }

        .tabelpresensi {
            width: 100%;
            table-layout: fixed;
            margin-bottom: 20px;
        }

        .tabelpresensi th, .tabelpresensi td {
            border: 1px solid #000;
            padding: 5px;
            word-wrap: break-word;
            vertical-align: top;
        }

        .tabelpresensi th {
            background: #f6ee1a;
            font-weight: bold;
            text-align: center;
        }

        .tabel-summary {
            width: 40%;
            border-collapse: collapse;
            font-size: 12px;
        }

        .tabel-summary th, .tabel-summary td {
            border: 1px solid #000;
            padding: 5px;
        }

        .tabel-summary th { background: #e6e6e6; }

        .center { text-align: center; }
        .italic { font-style: italic; }
        .bold { font-weight: bold; }
    </style>
</head>

<body class="A4 landscape">

@php
    use Illuminate\Support\Facades\DB;
    use Carbon\Carbon;

    // --- Jenis berita (tanpa match(), aman untuk PHP 7)
    $kode_divisi_pilihan = $kode_divisi_pilihan ?? 'all_berita';
    $jenis_berita = '';

    if ($kode_divisi_pilihan === 'all_berita') {
        $jenis_berita = 'Semua Berita';
    } elseif ($kode_divisi_pilihan === 'berita_umum') {
        $jenis_berita = 'Berita Umum';
    } else {
        $nama_divisi = DB::table('divisi')
            ->where('kode_divisi', $kode_divisi_pilihan)
            ->value('nama_divisi');
        $jenis_berita = 'Berita ' . ($nama_divisi ?: '-');
    }

    // --- Hitung berita per media hanya jika link != '-' dan tidak kosong
    $countPerMedia = [];
    foreach ($filteredBerita as $b) {
        $kode = $b['kode_media'] ?? '-';
        $link = trim($b['link'] ?? '');
        if ($link === '' || $link === '-' || $link === '--') continue; // abaikan link kosong / strip

        if (!isset($countPerMedia[$kode])) $countPerMedia[$kode] = 0;
        $countPerMedia[$kode]++;
    }

    $totalBerita = array_sum($countPerMedia);
@endphp

<section class="sheet padding-10mm">

    {{-- HEADER --}}
    <div style="text-align: center; margin-bottom: 15px;">
        <div id="title" class="bold" style="font-size: 18px;">
            REKAP BERITA MEDIA EKSTERNAL (NASIONAL) {{ strtoupper($satker_name) }}
        </div>
        <div class="bold" style="font-size: 14px;">
            {{ strtoupper($jenis_berita) }}
        </div>
        <div style="font-size: 13px;">
            PERIODE {{ $tgl_dari }} {{ strtoupper($namabulan[$bulan_dari]) }} {{ $tahun_dari }}
            s.d. {{ $tgl_sampai }} {{ strtoupper($namabulan[$bulan_sampai]) }} {{ $tahun_sampai }}
        </div>

        @if(!empty($kode_media) && $kode_media !== 'semua' && count($mediapartner) > 0)
            <div class="italic" style="font-size: 13px; margin-top: 5px;">
                Media Dipilih: {{ $mediapartner[0]->name }}
            </div>
        @elseif($kode_media === 'semua')
            <div class="italic" style="font-size: 13px; margin-top: 5px;">
                Media Dipilih: Semua Media Nasional
            </div>
        @endif
    </div>

    {{-- 🔹 TABEL BERITA --}}
    <table class="tabelpresensi">
        <thead>
        <tr>
            <th style="width: 4%;">No</th>
            <th style="width: 13%;">Tanggal</th>
            <th style="width: 25%;">Judul / Isu Berita</th>
            <th style="width: 18%;">Media Nasional</th>
            <th style="width: 25%;">Link Berita</th>
            <th style="width: 8%;">Narasumber</th>
            <th style="width: 8%;">Sentimen</th>
        </tr>
        </thead>
        <tbody>
        @forelse($filteredBerita as $i => $item)
            @php
                $tgl_indo = Carbon::parse($item['tgl_input'])->translatedFormat('d F Y');
                $media_name = DB::table('mediapartner')->where('kode_media', $item['kode_media'])->value('name') ?? '-';
            @endphp
            <tr>
                <td class="center">{{ $i + 1 }}</td>
                <td class="center">{{ $tgl_indo }}</td>
                <td>{{ $item['judul'] ?? '-' }}</td>
                <td>{{ $media_name }}</td>
                <td>{{ $item['link'] ?? '-' }}</td>
                <td class="center">-</td>
                <td class="center">-</td>
            </tr>
        @empty
            <tr><td colspan="7" class="center">Tidak ada data berita untuk periode ini.</td></tr>
        @endforelse

        {{-- 🔹 PEMISAH ANTAR TABEL --}}
        <tr><td colspan="7" style="height:25px; border:none;"></td></tr>
        </tbody>
    </table>

    {{-- 🔹 TABEL RINGKASAN --}}
    <table class="tabel-summary" style="width: 40%;">
        <tr><th colspan="2" class="center">RINGKASAN</th></tr>
        <tr><td>Jumlah Total Berita Dimuat</td><td class="center">{{ $totalBerita }}</td></tr>
        <tr><td>Jumlah Berita Sentimen Positif</td><td class="center">-</td></tr>
        <tr><td>Jumlah Berita Sentimen Negatif</td><td class="center">-</td></tr>
        <tr><th colspan="2" class="center">Jumlah Berita per Media</th></tr>

        @php
            // Ambil semua kode media dari berita valid (yang link-nya tidak strip)
            $allMediaFromBerita = array_keys($countPerMedia);

            // Ambil data media tambahan dari DB (jika tidak termasuk mediapartner)
            $extraMedias = DB::table('mediapartner')
                ->whereIn('kode_media', $allMediaFromBerita)
                ->get()
                ->keyBy('kode_media');
        @endphp

        @forelse($countPerMedia as $kode => $jumlah)
            @php
                $nama = $extraMedias[$kode]->name ?? (
                    DB::table('mediapartner')->where('kode_media', $kode)->value('name') ?? 'Media Tidak Dikenal'
                );
            @endphp
            <tr>
                <td>{{ $nama }}</td>
                <td class="center">{{ $jumlah }}</td>
            </tr>
        @empty
            <tr><td colspan="2" class="center">Tidak ada media nasional terdaftar</td></tr>
        @endforelse

        <tr><th>Total</th><th class="center">{{ $totalBerita }}</th></tr>
    </table>

</section>

</body>
</html>
