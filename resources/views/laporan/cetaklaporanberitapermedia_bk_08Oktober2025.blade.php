<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="utf-8">
    <title>Laporan Sosial Media</title>

    <!-- Normalize CSS -->
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/normalize/7.0.0/normalize.min.css">

    <!-- Paper.css -->
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/paper-css/0.4.1/paper.css">

    <style>
        @page {
            size: A4 landscape;
        }

        body {
            font-family: Arial, Helvetica, sans-serif;
            font-size: 12px;
        }

        #title {
            font-size: 18px;
            font-weight: bold;
            text-align: center;
            border: none !important;
            padding: 0;
            margin-bottom: 10px;
        }

        .sheet {
            overflow: visible;
            height: auto !important;
        }

        table {
            border-collapse: collapse;
            width: 100%;
        }

        th, td {
            border: 1px solid #000;
            padding: 6px;
            text-align: center;
        }

        th {
            background: #d9d9d9;
            font-weight: bold;
        }

        .summary-header {
            background: #ffe600; /* warna kuning untuk header ringkasan */
            font-weight: bold;
        }

        .summary-table {
            width: 50%;
            margin-top: 25px; /* jarak antar tabel */
            border-collapse: collapse;
        }

        .summary-table th, .summary-table td {
            border: 1px solid #000;
            padding: 6px;
            text-align: center;
        }

        .summary-table tr:last-child {
            background: #d9d9d9;
            font-weight: bold;
        }

        .text-center { text-align: center; }
        .nowrap { white-space: nowrap; }

        /* 🔹 Hilangkan border hanya di bagian judul laporan */
        .no-border {
            border: none !important;
            background: none !important;
        }
    </style>
</head>

<body class="A4 landscape">
<section class="sheet padding-10mm">

    {{-- Header Judul (tanpa border) --}}
    <table style="width: 100%; border: none;">
        <tr class="no-border">
            <td class="no-border" style="text-align: center;">
                <div id="title">
                    LAPORAN REKAP LINK BERITA SOSIAL MEDIA {{ strtoupper($satker_name ?? '') }} <br>
                    PERIODE {{ $tgl_dari }} {{ strtoupper($namabulan[$bulan_dari]) }} {{ $tahun_dari }}
                    s.d. {{ $tgl_sampai }} {{ strtoupper($namabulan[$bulan_sampai]) }} {{ $tahun_sampai }}
                </div>
            </td>
        </tr>
    </table>

    {{-- Tabel Data Utama --}}
    <table>
        <thead>
        <tr>
            <th style="width: 40px;">No</th>
            <th style="width: 100px;">Tanggal Berita</th>
            <th>Facebook</th>
            <th>Instagram</th>
            <th>Twitter</th>
            <th>Tiktok</th>
            <th>SIPPN</th>
            <th>Youtube</th>
        </tr>
        </thead>
        <tbody>
        @forelse($filteredBerita as $i => $row)
            @php
                $tgl_input = $row['tgl_input'];
                $exp_tgl_input = explode('-', $tgl_input);
                $tgl = $exp_tgl_input[2] ?? '';
                $bulan = (int)($exp_tgl_input[1] ?? 0);
                $tahun = $exp_tgl_input[0] ?? '';
                $namaBulan = $namabulan[$bulan] ?? '';
            @endphp
            <tr>
                <td>{{ $i + 1 }}</td>
                <td class="nowrap">{{ $tgl }} {{ $namaBulan }} {{ $tahun }}</td>
                <td>{!! $row['facebook'] ?: '-' !!}</td>
                <td>{!! $row['instagram'] ?: '-' !!}</td>
                <td>{!! $row['twitter'] ?: '-' !!}</td>
                <td>{!! $row['tiktok'] ?: '-' !!}</td>
                <td>{!! $row['sippn'] ?: '-' !!}</td>
                <td>{!! $row['youtube'] ?: '-' !!}</td>
            </tr>
        @empty
            <tr>
                <td colspan="8" class="text-center">Tidak ada data untuk periode ini.</td>
            </tr>
        @endforelse
        </tbody>

        <tfoot>
        <tr style="background:#eceaea; font-weight:bold;">
            <td colspan="2">Jumlah</td>
            <td>{{ $total_facebook ?? 0 }}</td>
            <td>{{ $total_instagram ?? 0 }}</td>
            <td>{{ $total_twitter ?? 0 }}</td>
            <td>{{ $total_tiktok ?? 0 }}</td>
            <td>{{ $total_sippn ?? 0 }}</td>
            <td>{{ $total_youtube ?? 0 }}</td>
        </tr>
        </tfoot>
    </table>

    {{-- Pemisah antar tabel --}}
    <br><br>

    {{-- Tabel Ringkasan --}}
    <table class="summary-table">
        <tr class="summary-header">
            <th colspan="2">RINGKASAN JUMLAH LINK BERITA SOSIAL MEDIA</th>
        </tr>
        <tr>
            <th>Platform</th>
            <th>Jumlah Link Valid</th>
        </tr>
        <tr><td>Facebook</td><td>{{ $total_facebook ?? 0 }}</td></tr>
        <tr><td>Instagram</td><td>{{ $total_instagram ?? 0 }}</td></tr>
        <tr><td>Twitter</td><td>{{ $total_twitter ?? 0 }}</td></tr>
        <tr><td>Tiktok</td><td>{{ $total_tiktok ?? 0 }}</td></tr>
        <tr><td>SIPPN</td><td>{{ $total_sippn ?? 0 }}</td></tr>
        <tr><td>Youtube</td><td>{{ $total_youtube ?? 0 }}</td></tr>
        <tr>
            <td>Total Semua Platform</td>
            <td>
                {{ ($total_facebook + $total_instagram + $total_twitter + $total_tiktok + $total_sippn + $total_youtube) ?? 0 }}
            </td>
        </tr>
    </table>

</section>
</body>
</html>
