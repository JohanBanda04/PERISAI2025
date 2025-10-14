<!DOCTYPE html>
<html lang="id">
<head>
    <meta charset="utf-8">
    <title>Rekap Berita Media Eksternal</title>

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
            margin-top: 30px;
        }

        .tabel-summary th, .tabel-summary td {
            border: 1px solid #000;
            padding: 5px;
        }

        .tabel-summary th { background: #e6e6e6; }

        .center { text-align: center; }
        .italic { font-style: italic; }
        .bold { font-weight: bold; }
        .prioritas-heading {
            background: #b5d7ff;
            font-weight: bold;
            font-size: 13px;
            text-align: left;
            padding: 6px;
        }
    </style>
</head>

<body class="A4 landscape">

@php
    use Illuminate\Support\Facades\DB;
    use Carbon\Carbon;

    // --- Tentukan jenis berita
    $kode_divisi_pilihan = $kode_divisi_pilihan ?? 'all_berita';
    $jenis_berita = '';

    if ($kode_divisi_pilihan === 'all_berita') {
        $jenis_berita = 'Semua Berita';
    } elseif ($kode_divisi_pilihan === 'berita_umum') {
        $jenis_berita = 'Berita Umum';
    } else {
        $nama_divisi = DB::table('divisi')->where('kode_divisi', $kode_divisi_pilihan)->value('nama_divisi');
        $jenis_berita = 'Berita ' . ($nama_divisi ?: '-');
    }

    // --- Hitung berita per media (hanya link valid)
    $countPerMedia = [];
    foreach ($filteredBerita as $b) {
        $kode = $b['kode_media'] ?? '-';
        $link = trim($b['link'] ?? '');
        if ($link === '' || $link === '-' || $link === '--') continue;

        if (!isset($countPerMedia[$kode])) $countPerMedia[$kode] = 0;
        $countPerMedia[$kode]++;
    }

    $totalBerita = array_sum($countPerMedia);

    // --- Group berdasarkan skala_prioritas
    $grouped = collect($filteredBerita)->groupBy('skala_prioritas')->sortKeys();
@endphp

<section class="sheet padding-10mm">

    {{-- HEADER --}}
    <div style="text-align: center; margin-bottom: 15px;">
        <div class="bold" style="font-size: 18px;">
            REKAP BERITA MEDIA EKSTERNAL ({{ strtoupper($jenis_media === 'media_nasional' ? 'NASIONAL' : 'LOKAL') }}) {{ strtoupper($satker_name) }}
        </div>
        <div class="bold" style="font-size: 14px;">
            {{ strtoupper($jenis_berita) }}
        </div>
        <div style="font-size: 13px;">
            PERIODE {{ $tgl_dari }} {{ strtoupper($namabulan[$bulan_dari]) }} {{ $tahun_dari }}
            s.d. {{ $tgl_sampai }} {{ strtoupper($namabulan[$bulan_sampai]) }} {{ $tahun_sampai }}
        </div>
        <div class="italic" style="font-size: 13px; margin-top: 5px;">
            Urut Berdasarkan Skala Prioritas (Presiden → Menteri → Eselon 1 → dst.)
        </div>
    </div>

    {{-- 🔹 TABEL BERITA --}}
    @forelse($grouped as $skala => $beritas)
        @php
            $namaPrioritas = DB::table('tbl_prioritas')
                ->where('skala_prioritas', $skala)
                ->value('nama_prioritas_lengkap') ?? 'Prioritas Tidak Dikenal';
        @endphp

        {{-- Header prioritas --}}
        <div class="prioritas-heading">
            PRIORITAS: {{ strtoupper($namaPrioritas) }} {{--(Skala {{ $skala }})--}}
        </div>

        <table class="tabelpresensi">
            <thead>
            <tr>
                <th style="width: 4%;">No</th>
                <th style="width: 13%;">Tanggal</th>
                <th style="width: 25%;">Judul / Isu Berita</th>
                <th style="width: 18%;">Media</th>
                <th style="width: 25%;">Link Berita</th>
                <th style="width: 8%;">Narasumber</th>
                <th style="width: 8%;">Sentimen</th>
            </tr>
            </thead>
            <tbody>
            @foreach($beritas as $i => $item)
                @php
                    $tgl_indo = Carbon::parse($item['tgl_input'])->translatedFormat('d F Y');
                    $media_name = DB::table('mediapartner')
                        ->where('kode_media', $item['kode_media'])
                        ->value('name') ?? $item['kode_media'];
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
            @endforeach
            </tbody>
        </table>
    @empty
        <table class="tabelpresensi">
            <tr><td colspan="7" class="center">Tidak ada data berita untuk periode ini.</td></tr>
        </table>
    @endforelse


    {{-- 🔹 TABEL RINGKASAN --}}
    <table class="tabel-summary">
        <tr><th colspan="2" class="center">RINGKASAN</th></tr>
        <tr><td>Jumlah Total Berita Dimuat</td><td class="center">{{ $totalBerita }}</td></tr>
        <tr><td>Jumlah Berita Sentimen Positif</td><td class="center">-</td></tr>
        <tr><td>Jumlah Berita Sentimen Negatif</td><td class="center">-</td></tr>
        <tr><th colspan="2" class="center">Jumlah Berita per Media</th></tr>

        @php
            $allMediaFromBerita = array_keys($countPerMedia);
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
            <tr><td colspan="2" class="center">Tidak ada media terdaftar</td></tr>
        @endforelse

        <tr><th>Total</th><th class="center">{{ $totalBerita }}</th></tr>
    </table>

</section>

</body>
</html>
