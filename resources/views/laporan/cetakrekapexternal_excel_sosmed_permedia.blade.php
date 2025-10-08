<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="utf-8">
    <title>Rekap Sosial Media</title>
    <style>
        body {
            font-family: Arial, sans-serif;
            font-size: 12px;
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
            background-color: #d9d9d9;
            font-weight: bold;
        }

        .title {
            text-align: center;
            font-weight: bold;
            font-size: 16px;
            margin-bottom: 5px;
        }

        .subtitle {
            text-align: center;
            margin-bottom: 15px;
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

        .summary-table th:first-child {
            width: 50%;
        }

        .summary-table-header {
            background: #ffe600; /* warna kuning */
            color: #000;
            font-weight: bold;
        }

        .summary-table tr:last-child {
            font-weight: bold;
            background-color: #d9d9d9;
        }
    </style>
</head>

<body>
{{-- Judul Utama --}}
<div class="title">
    LAPORAN REKAP LINK BERITA SOSIAL MEDIA {{ strtoupper($satker_name) }}
</div>
<div class="subtitle">
    PERIODE {{ $tgl_dari }} {{ strtoupper($namabulan[$bulan_dari]) }} {{ $tahun_dari }}
    s.d. {{ $tgl_sampai }} {{ strtoupper($namabulan[$bulan_sampai]) }} {{ $tahun_sampai }}
</div>

{{-- Tabel Utama --}}
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
    @foreach($filteredBerita as $index => $row)
        @php
            $exp_tgl = explode('-', $row['tgl_input']);
            $tgl = $exp_tgl[2];
            $bln = $exp_tgl[1];
            $thn = $exp_tgl[0];
            if(substr($bln,0,1)=="0"){ $bln = substr($bln,1,1); }
        @endphp
        <tr>
            <td>{{ $index + 1 }}</td>
            <td>{{ $tgl }} {{ $namabulan[$bln] }} {{ $thn }}</td>
            <td>{!! $row['facebook'] ?: '-' !!}</td>
            <td>{!! $row['instagram'] ?: '-' !!}</td>
            <td>{!! $row['twitter'] ?: '-' !!}</td>
            <td>{!! $row['tiktok'] ?: '-' !!}</td>
            <td>{!! $row['sippn'] ?: '-' !!}</td>
            <td>{!! $row['youtube'] ?: '-' !!}</td>
        </tr>
    @endforeach
    </tbody>
</table>

{{-- 🔹 Tambahkan jarak antar tabel agar tidak nempel --}}
<br><br>

{{-- Tabel Ringkasan --}}
<table class="summary-table">
    <tr class="summary-table-header">
        <th colspan="2">RINGKASAN JUMLAH LINK BERITA SOSIAL MEDIA</th>
    </tr>
    <tr>
        <th>Platform</th>
        <th>Jumlah Link Valid</th>
    </tr>
    <tr>
        <td>Facebook</td>
        <td>{{ $total_facebook ?? 0 }}</td>
    </tr>
    <tr>
        <td>Instagram</td>
        <td>{{ $total_instagram ?? 0 }}</td>
    </tr>
    <tr>
        <td>Twitter</td>
        <td>{{ $total_twitter ?? 0 }}</td>
    </tr>
    <tr>
        <td>Tiktok</td>
        <td>{{ $total_tiktok ?? 0 }}</td>
    </tr>
    <tr>
        <td>SIPPN</td>
        <td>{{ $total_sippn ?? 0 }}</td>
    </tr>
    <tr>
        <td>Youtube</td>
        <td>{{ $total_youtube ?? 0 }}</td>
    </tr>
    <tr>
        <td>Total Semua Platform</td>
        <td>
            {{ ($total_facebook + $total_instagram + $total_twitter + $total_tiktok + $total_sippn + $total_youtube) ?? 0 }}
        </td>
    </tr>
</table>

</body>
</html>
