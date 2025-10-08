<!DOCTYPE html>
<html lang="id">
<head>
    <meta charset="utf-8">
    <title>Laporan Sosial Media</title>

    <!-- Normalize CSS -->
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/normalize/7.0.0/normalize.min.css">

    <!-- Paper.css -->
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/paper-css/0.4.1/paper.css">

    <style>
        @page { size: A4 landscape; margin: 10mm; }

        body {
            font-family: Arial, Helvetica, sans-serif;
            font-size: 11px;
            color: #000;
        }

        .sheet {
            overflow: visible;
            height: auto !important;
        }

        #title {
            font-size: 16px;
            font-weight: bold;
            text-align: center;
            margin-bottom: 5px;
        }

        #subtitle {
            font-size: 13px;
            text-align: center;
            margin-bottom: 15px;
        }

        table {
            border-collapse: collapse;
            width: 100%;
            table-layout: fixed;
        }

        th, td {
            border: 1px solid #000;
            padding: 5px;
            text-align: center;
            word-wrap: break-word;
            overflow-wrap: break-word;
            vertical-align: middle;
        }

        th {
            background: #f4f4a5;
            font-weight: bold;
        }

        td {
            font-size: 10.5px;
        }

        /* ✅ Lebar kolom proporsional supaya pas di A4 */
        th:nth-child(1), td:nth-child(1) { width: 3%; }   /* No */
        th:nth-child(2), td:nth-child(2) { width: 10%; }  /* Tanggal */
        th:nth-child(3), td:nth-child(3) { width: 17%; }  /* Facebook */
        th:nth-child(4), td:nth-child(4) { width: 17%; }  /* Instagram */
        th:nth-child(5), td:nth-child(5) { width: 13%; }  /* Twitter */
        th:nth-child(6), td:nth-child(6) { width: 10%; }  /* Tiktok */
        th:nth-child(7), td:nth-child(7) { width: 10%; }  /* SIPPN */
        th:nth-child(8), td:nth-child(8) { width: 10%; }  /* Youtube */

        /* ✅ Ringkasan tabel */
        .summary-table {
            width: 60%;
            margin: 25px auto 0;
            border-collapse: collapse;
            font-size: 11px;
        }

        .summary-table th, .summary-table td {
            border: 1px solid #000;
            padding: 6px;
        }

        .summary-table th {
            background: #e6e6e6;
            font-weight: bold;
        }

        .summary-table tr:first-child th {
            background: #ffe600;
            text-transform: uppercase;
        }

        .center { text-align: center; }
    </style>
</head>

<body class="A4 landscape">
<section class="sheet padding-10mm">

    {{-- 🔹 HEADER --}}
    <div id="title">
        LAPORAN REKAP LINK BERITA SOSIAL MEDIA {{ strtoupper($satker_name ?? '') }}
    </div>
    <div id="subtitle">
        PERIODE {{ $tgl_dari }} {{ strtoupper($namabulan[$bulan_dari]) }} {{ $tahun_dari }}
        s.d. {{ $tgl_sampai }} {{ strtoupper($namabulan[$bulan_sampai]) }} {{ $tahun_sampai }}
    </div>

    {{-- 🔹 TABEL UTAMA --}}
    <table>
        <thead>
        <tr>
            <th>No</th>
            <th>Tanggal Berita</th>
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
                <td>{{ $tgl }} {{ $namaBulan }} {{ $tahun }}</td>
                <td style="text-align:left;">{!! $row['facebook'] ?: '-' !!}</td>
                <td style="text-align:left;">{!! $row['instagram'] ?: '-' !!}</td>
                <td style="text-align:left;">{!! $row['twitter'] ?: '-' !!}</td>
                <td style="text-align:left;">{!! $row['tiktok'] ?: '-' !!}</td>
                <td style="text-align:left;">{!! $row['sippn'] ?: '-' !!}</td>
                <td style="text-align:left;">{!! $row['youtube'] ?: '-' !!}</td>
            </tr>
        @empty
            <tr><td colspan="8" class="center">Tidak ada data untuk periode ini.</td></tr>
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

    {{-- 🔹 PEMBATAS --}}
    <br><br>

    {{-- 🔹 TABEL RINGKASAN --}}
    <table class="summary-table">
        <tr><th colspan="2">RINGKASAN JUMLAH LINK BERITA SOSIAL MEDIA</th></tr>
        <tr><th>Platform</th><th>Jumlah Link Valid</th></tr>
        <tr><td>Facebook</td><td>{{ $total_facebook ?? 0 }}</td></tr>
        <tr><td>Instagram</td><td>{{ $total_instagram ?? 0 }}</td></tr>
        <tr><td>Twitter</td><td>{{ $total_twitter ?? 0 }}</td></tr>
        <tr><td>Tiktok</td><td>{{ $total_tiktok ?? 0 }}</td></tr>
        <tr><td>SIPPN</td><td>{{ $total_sippn ?? 0 }}</td></tr>
        <tr><td>Youtube</td><td>{{ $total_youtube ?? 0 }}</td></tr>
        <tr>
            <th>Total Semua Platform</th>
            <th>
                {{ ($total_facebook + $total_instagram + $total_twitter + $total_tiktok + $total_sippn + $total_youtube) ?? 0 }}
            </th>
        </tr>
    </table>

</section>
</body>
</html>
