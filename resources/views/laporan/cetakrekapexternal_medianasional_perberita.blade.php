<!DOCTYPE html>
<html lang="id">
<head>
    <meta charset="utf-8">
    <title>Laporan Media Nasional</title>

    <style>
        @page {
            size: A4 landscape;
            margin: 10mm;
        }

        body {
            font-family: Arial, Helvetica, sans-serif;
            font-size: 11px;
            color: #000;
            margin: 0;
            padding: 0;
        }

        .sheet {
            overflow: visible;
            height: auto !important;
        }

        table {
            border-collapse: collapse;
            width: 100%;
            page-break-inside: avoid;
            table-layout: fixed;
        }

        th, td {
            border: 1px solid #000;
            padding: 6px 8px;
            word-wrap: break-word;
            vertical-align: middle;
        }

        th {
            background: #ffef7a;
            font-weight: bold;
            text-align: center;
        }

        .center { text-align: center; }
        .italic { font-style: italic; }
        .bold { font-weight: bold; }

        /* Lebar kolom dinamis tapi konsisten */
        th:nth-child(1), td:nth-child(1) { width: 4%; }
        th:nth-child(2), td:nth-child(2) { width: 11%; }
        th:nth-child(3), td:nth-child(3) { width: 27%; }
        th:nth-child(4), td:nth-child(4) { width: 18%; }
        th:nth-child(5), td:nth-child(5) { width: 27%; }
        th:nth-child(6), td:nth-child(6),
        th:nth-child(7), td:nth-child(7) { width: 6.5%; }

        /* Ringkasan */
        .summary {
            margin-top: 25px;
            border-collapse: collapse;
            width: 60%;
            margin-left: 0;
        }

        .summary th, .summary td {
            border: 1px solid #000;
            padding: 6px 8px;
            font-size: 10.5px;
        }

        .summary th {
            background: #eaeaea;
            text-align: center;
        }

        /* Pastikan tidak ada potongan halaman */
        tr, td, th { page-break-inside: avoid !important; }

        /* Untuk preview web */
        @media screen {
            body {
                background: #f0f4f8;
                padding: 20px;
            }
            .sheet {
                background: #fff;
                padding: 20px;
                border-radius: 8px;
                box-shadow: 0 2px 10px rgba(0, 0, 0, 0.1);
            }
        }
    </style>
</head>

<body class="A4 landscape">
<section class="sheet">

    {{-- HEADER --}}
    <div style="text-align: center; margin-bottom: 10px;">
        <div class="bold" style="font-size: 17px;">REKAP BERITA MEDIA EKSTERNAL (NASIONAL)</div>
        <div class="bold" style="font-size: 13px;">{{ strtoupper($nama_divisi ?? 'BERITA UMUM') }}</div>
        <div style="font-size: 12px;">
            PERIODE {{ $tgl_dari }} {{ strtoupper($namabulan[$bulan_dari]) }} {{ $tahun_dari }}
            s.d. {{ $tgl_sampai }} {{ strtoupper($namabulan[$bulan_sampai]) }} {{ $tahun_sampai }}
        </div>

        @if(!empty($kode_media) && $kode_media !== 'semua' && count($mediapartner) > 0)
            <div class="italic" style="font-size: 12px; margin-top: 5px;">
                Media Dipilih: {{ $mediapartner[0]->name }}
            </div>
        @elseif($kode_media === 'semua')
            <div class="italic" style="font-size: 12px; margin-top: 5px;">
                Media Dipilih: Semua Media Nasional
            </div>
        @endif
    </div>

    {{-- TABEL BERITA --}}
    <table>
        <thead>
        <tr>
            <th>No</th>
            <th>Tanggal</th>
            <th>Judul / Isu Berita</th>
            <th>Media Nasional</th>
            <th>Link Berita</th>
            <th>Narasumber</th>
            <th>Sentimen</th>
        </tr>
        </thead>
        <tbody>
        @forelse($filteredBerita as $i => $item)
            @php
                $tgl_indo = \Carbon\Carbon::parse($item['tgl_input'])->translatedFormat('d F Y');
                $media_name = DB::table('mediapartner')
                    ->where('kode_media', $item['kode_media'])
                    ->value('name') ?? '-';
            @endphp
            <tr>
                <td class="center">{{ $i + 1 }}</td>
                <td>{{ $tgl_indo }}</td>
                <td>{{ $item['judul'] ?? '-' }}</td>
                <td>{{ $media_name }}</td>
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

    {{-- RINGKASAN --}}
    @php
        // Hitung jumlah berita per media dari filteredBerita (bukan mediapartner)
        $countPerMedia = [];
        foreach ($filteredBerita as $b) {
            $kode = $b['kode_media'] ?? '-';
            if (!isset($countPerMedia[$kode])) $countPerMedia[$kode] = 0;
            $countPerMedia[$kode]++;
        }
        $totalBerita = array_sum($countPerMedia);

        // Ambil nama media yang muncul di berita
        $allMediaFromBerita = collect($filteredBerita)
            ->pluck('kode_media')
            ->unique()
            ->toArray();
        $extraMedias = DB::table('mediapartner')
            ->whereIn('kode_media', $allMediaFromBerita)
            ->get()
            ->keyBy('kode_media');
    @endphp

    <table class="summary">
        <tr><th colspan="2" class="center">RINGKASAN</th></tr>
        <tr><td>Jumlah Total Berita Dimuat</td><td class="center">{{ $totalBerita }}</td></tr>
        <tr><td>Jumlah Berita Sentimen Positif</td><td class="center">-</td></tr>
        <tr><td>Jumlah Berita Sentimen Negatif</td><td class="center">-</td></tr>
        <tr><th colspan="2" class="center">Jumlah Berita per Media</th></tr>

        @forelse($countPerMedia as $kode => $jumlah)
            @php
                $nama = $extraMedias[$kode]->name ?? 'Media Tidak Dikenal';
            @endphp
            <tr>
                <td>{{ $nama }}</td>
                <td class="center">{{ $jumlah }}</td>
            </tr>
        @empty
            <tr><td colspan="2" class="center">Tidak ada media nasional terdaftar</td></tr>
        @endforelse

        <tr class="grey bold">
            <td>Total</td>
            <td class="center">{{ $totalBerita }}</td>
        </tr>
    </table>

</section>
</body>
</html>
