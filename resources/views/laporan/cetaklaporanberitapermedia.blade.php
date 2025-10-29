<!DOCTYPE html>
<html lang="id">
<head>
    <meta charset="utf-8">
    <title>Laporan Rekap Link Sosial Media</title>

    <style>
        @media screen {
            body {
                background: #f0f4f8;
                margin: 20px;
            }
            .sheet {
                background: white;
                padding: 20px;
                border-radius: 10px;
                box-shadow: 0 2px 10px rgba(0,0,0,0.1);
            }
        }

        @page {
            size: A4 landscape;
            margin: 15mm;
        }

        body {
            font-family: Arial, Helvetica, sans-serif;
            font-size: 11px;
            color: #000;
        }

        h1, h2, h3, h4, h5 {
            margin: 0;
            padding: 0;
        }

        .header {
            text-align: center;
            margin-bottom: 10px;
        }

        .header h2 {
            font-size: 16px;
            font-weight: bold;
        }

        .header h3 {
            font-size: 13px;
        }

        table {
            width: 100%;
            border-collapse: collapse;
            table-layout: auto;
            page-break-inside: auto;
        }

        th, td {
            border: 1px solid #000;
            padding: 5px;
            vertical-align: middle;
            text-align: center;
            word-wrap: break-word;
            font-size: 10px;
        }

        th {
            background-color: #f7f7a3;
            font-weight: bold;
        }

        tr {
            page-break-inside: avoid;
            page-break-after: auto;
        }

        .summary {
            margin-top: 25px;
            width: 70%;
            margin-left: auto;
            margin-right: auto;
            border-collapse: collapse;
        }

        .summary th, .summary td {
            border: 1px solid #000;
            padding: 6px;
            text-align: center;
        }

        .summary th {
            background-color: #ffec80;
            font-weight: bold;
        }

        .text-left { text-align: left; }
        .text-center { text-align: center; }
    </style>
</head>

<body>
<div class="header">
    <h2>LAPORAN REKAP LINK BERITA SOSIAL MEDIA {{ strtoupper($satker_name ?? '') }}</h2>

    <h3>
        @if(!empty($tgl_dari) && !empty($tgl_sampai))
            PERIODE
            {{ \Carbon\Carbon::parse($tgl_dari)->translatedFormat('d F Y') }}
            s.d.
            {{ \Carbon\Carbon::parse($tgl_sampai)->translatedFormat('d F Y') }}
        @else
            PERIODE - (Tanggal tidak tersedia)
        @endif
    </h3>


</div>

<table>
    <thead>
    <tr>
        <th style="width:3%">No</th>
        <th style="width:10%">Tanggal Berita</th>
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
            $tgl = date('d F Y', strtotime($row['tgl_input']));
        @endphp
        <tr>
            <td>{{ $i + 1 }}</td>
            <td>{{ $tgl }}</td>
            <td class="text-left">{!! $row['facebook'] ?: '-' !!}</td>
            <td class="text-left">{!! $row['instagram'] ?: '-' !!}</td>
            <td class="text-left">{!! $row['twitter'] ?: '-' !!}</td>
            <td class="text-left">{!! $row['tiktok'] ?: '-' !!}</td>
            <td class="text-left">{!! $row['sippn'] ?: '-' !!}</td>
            <td class="text-left">{!! $row['youtube'] ?: '-' !!}</td>
        </tr>
    @empty
        <tr>
            <td colspan="8" class="text-center">Tidak ada data untuk periode ini.</td>
        </tr>
    @endforelse

    <tr style="font-weight:bold; background:#eaeaea;">
        <td colspan="2">Jumlah</td>
        <td>{{ $total_facebook ?? 0 }}</td>
        <td>{{ $total_instagram ?? 0 }}</td>
        <td>{{ $total_twitter ?? 0 }}</td>
        <td>{{ $total_tiktok ?? 0 }}</td>
        <td>{{ $total_sippn ?? 0 }}</td>
        <td>{{ $total_youtube ?? 0 }}</td>
    </tr>
    </tbody>
</table>

<br><br>

<table class="summary">
    <tr><th colspan="2">RINGKASAN JUMLAH LINK BERITA SOSIAL MEDIA</th></tr>
    <tr><th>Platform</th><th>Jumlah Link Valid</th></tr>
    <tr><td>Facebook</td><td>{{ $total_facebook ?? 0 }}</td></tr>
    <tr><td>Instagram</td><td>{{ $total_instagram ?? 0 }}</td></tr>
    <tr><td>Twitter</td><td>{{ $total_twitter ?? 0 }}</td></tr>
    <tr><td>Tiktok</td><td>{{ $total_tiktok ?? 0 }}</td></tr>
    <tr><td>SIPPN</td><td>{{ $total_sippn ?? 0 }}</td></tr>
    <tr><td>Youtube</td><td>{{ $total_youtube ?? 0 }}</td></tr>
    <tr style="font-weight:bold; background:#f7f7a3;">
        <td>Total Semua Platform</td>
        <td>
            {{ ($total_facebook + $total_instagram + $total_twitter + $total_tiktok + $total_sippn + $total_youtube) ?? 0 }}
        </td>
    </tr>
</table>
</body>
</html>
