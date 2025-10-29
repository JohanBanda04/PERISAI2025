<!DOCTYPE html>
<html lang="id">
<head>
    <meta charset="utf-8">
    <title>Laporan Media Lokal</title>

    <style>
        @page {
            size: A4 landscape;
            margin: 10mm;
        }

        body {
            font-family: Arial, Helvetica, sans-serif;
            font-size: 11px;
            color: #000;
        }

        h1, h2, h3, h4 {
            margin: 0;
            padding: 0;
        }

        .header {
            text-align: center;
            margin-bottom: 15px;
        }

        .header h2 {
            font-size: 16px;
            font-weight: bold;
        }

        .header h3 {
            font-size: 13px;
            margin-top: 4px;
        }

        .header h4 {
            font-size: 12px;
            margin-top: 3px;
            font-style: italic;
            color: #333;
        }

        table {
            width: 100%;
            border-collapse: collapse;
            page-break-inside: avoid;
        }

        th, td {
            border: 1px solid #000;
            padding: 5px 6px;
            vertical-align: middle;
            word-wrap: break-word;
        }

        th {
            background: #ffe600;
            text-align: center;
            font-weight: bold;
        }

        td {
            text-align: left;
        }

        .center { text-align: center; }
        .right { text-align: right; }
        .bold { font-weight: bold; }
        .grey { background: #eaeaea; }
        .summary-title { background: #d8d8d8; }

        .summary-table {
            margin-top: 25px;
            width: 50%;
            border-collapse: collapse;
            font-size: 11px;
            page-break-inside: avoid;
        }

        .summary-table th, .summary-table td {
            border: 1px solid #000;
            padding: 6px;
        }

        .summary-table th {
            background: #f7f7a3;
        }

        /* Hindari tabel terpotong di halaman PDF */
        tr {
            page-break-inside: avoid;
            page-break-after: auto;
        }
    </style>
</head>

<body>
@php
    use Carbon\Carbon;
    use Illuminate\Support\Facades\DB;

    $countPerMedia = [];
    foreach ($filteredBerita as $b) {
        $kode = $b['kode_media'] ?? '-';
        if (!isset($countPerMedia[$kode])) $countPerMedia[$kode] = 0;
        $countPerMedia[$kode]++;
    }
    $totalBerita = array_sum($countPerMedia);
@endphp

<div class="header">
    <h2>REKAP BERITA MEDIA EKSTERNAL (LOKAL)</h2>
    <h3>{{ strtoupper($nama_divisi ?? 'BERITA UMUM') }}</h3>
    <h3>
        PERIODE {{ $tgl_dari }} {{ strtoupper($namabulan[$bulan_dari]) }} {{ $tahun_dari }}
        s.d. {{ $tgl_sampai }} {{ strtoupper($namabulan[$bulan_sampai]) }} {{ $tahun_sampai }}
    </h3>

    @if(!empty($kode_media) && $kode_media !== 'semua' && count($mediapartner) > 0)
        <h4>Media Dipilih: {{ $mediapartner[0]->name }}</h4>
    @elseif($kode_media === 'semua')
        <h4>Media Dipilih: Semua Media Lokal</h4>
    @endif
</div>

{{-- Tabel utama --}}
<table>
    <thead>
    <tr>
        <th style="width: 4%;">No</th>
        <th style="width: 12%;">Tanggal</th>
        <th style="width: 27%;">Judul / Isu Berita</th>
        <th style="width: 18%;">Media Lokal</th>
        <th style="width: 25%;">Link Berita</th>
        <th style="width: 7%;">Narasumber</th>
        <th style="width: 7%;">Sentimen</th>
    </tr>
    </thead>
    <tbody>
    @forelse($filteredBerita as $i => $item)
        @php
            $tgl_indo = Carbon::parse($item['tgl_input'])->translatedFormat('d F Y');
            $media_name = DB::table('mediapartner')
                ->where('kode_media', $item['kode_media'])
                ->value('name') ?? '-';
        @endphp
        <tr>
            <td class="center">{{ $i + 1 }}</td>
            <td class="center">{{ $tgl_indo }}</td>
            <td>{{ $item['judul'] ?? '-' }}</td>
            <td class="center">{{ $media_name }}</td>
            <td>{{ $item['link'] ?? '-' }}</td>
            <td class="center">-</td>
            <td class="center">-</td>
        </tr>
    @empty
        <tr>
            <td colspan="7" class="center">Tidak ada data berita untuk periode ini.</td>
        </tr>
    @endforelse
    </tbody>
</table>

{{-- Ringkasan --}}
<table class="summary-table">
    <tr><th colspan="2" class="center">RINGKASAN</th></tr>
    <tr>
        <td>Jumlah Total Berita Dimuat</td>
        <td class="center">{{ $totalBerita }}</td>
    </tr>
    <tr>
        <td>Jumlah Berita Sentimen Positif</td>
        <td class="center">-</td>
    </tr>
    <tr>
        <td>Jumlah Berita Sentimen Negatif</td>
        <td class="center">-</td>
    </tr>
    <tr><th colspan="2" class="center">Jumlah Berita per Media</th></tr>

    @php
        $allMediaFromBerita = collect($filteredBerita)->pluck('kode_media')->unique()->toArray();
        $extraMedias = DB::table('mediapartner')
            ->whereIn('kode_media', $allMediaFromBerita)
            ->get()
            ->keyBy('kode_media');
    @endphp

    @forelse($countPerMedia as $kode => $jumlah)
        @php
            $nama = $extraMedias[$kode]->name ?? 'Media Tidak Dikenal';
        @endphp
        <tr>
            <td>{{ $nama }}</td>
            <td class="center">{{ $jumlah }}</td>
        </tr>
    @empty
        <tr>
            <td colspan="2" class="center">Tidak ada media lokal terdaftar</td>
        </tr>
    @endforelse
    <tr class="grey bold">
        <td>Total</td>
        <td class="center">{{ $totalBerita }}</td>
    </tr>
</table>

</body>
</html>
