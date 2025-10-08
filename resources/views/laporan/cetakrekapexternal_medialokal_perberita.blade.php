<!DOCTYPE html>
<html lang="id">
<head>
    <meta charset="utf-8">
    <title>Laporan Media Lokal</title>

    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/normalize/7.0.0/normalize.min.css">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/paper-css/0.4.1/paper.css">

    <style>
        @page { size: A4 landscape; margin: 10mm; }

        body {
            font-family: Arial, Helvetica, sans-serif;
            font-size: 12px;
            color: #000;
        }

        .sheet {
            overflow: visible;
            height: auto !important;
        }

        table { border-collapse: collapse; width: 100%; }

        .table-wrapper {
            display: flex;
            justify-content: space-between;
            gap: 10px;
        }

        .tabelpresensi {
            width: 70%;
            table-layout: fixed;
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
            width: 28%;
            border-collapse: collapse;
            font-size: 12px;
        }

        .tabel-summary th, .tabel-summary td {
            border: 1px solid #000;
            padding: 5px;
        }

        .tabel-summary th { background: #e6e6e6; }
        .center { text-align: center; }
    </style>
</head>

<body class="A4 landscape">

@php
    use Illuminate\Support\Facades\DB;
    use Carbon\Carbon;

    $kode_divisi_pilihan = $kode_divisi_pilihan ?? 'all_berita';
    $jenis_berita = match($kode_divisi_pilihan) {
        'all_berita' => 'Semua Berita',
        'berita_umum' => 'Berita Umum',
        default => 'Berita ' . (DB::table('divisi')->where('kode_divisi', $kode_divisi_pilihan)->value('nama_divisi') ?? '-'),
    };

    $countPerMedia = [];
    foreach ($mediapartner as $media) {
        $kode = $media->kode_media;
        $countPerMedia[$kode] = collect($filteredBerita)
            ->where('kode_media', $kode)
            ->count();
    }
    $totalBerita = array_sum($countPerMedia);
@endphp

<section class="sheet padding-10mm">

    {{-- HEADER --}}
    <div style="text-align: center; margin-bottom: 10px;">
        <div id="title" style="font-weight: bold; font-size: 18px;">
            REKAP BERITA MEDIA EKSTERNAL (LOKAL)
        </div>
        <div style="font-weight: bold; font-size: 14px;">
            {{ strtoupper($jenis_berita) }}
        </div>
        <div style="font-size: 13px;">
            PERIODE {{ $tgl_dari }} {{ strtoupper($namabulan[$bulan_dari]) }} {{ $tahun_dari }}
            s.d. {{ $tgl_sampai }} {{ strtoupper($namabulan[$bulan_sampai]) }} {{ $tahun_sampai }}
        </div>

        @if(!empty($kode_media) && $kode_media !== 'semua' && count($mediapartner) > 0)
            <div style="font-size: 13px; margin-top: 5px; font-style: italic;">
                Media Dipilih: {{ $mediapartner[0]->name }}
            </div>
        @elseif($kode_media === 'semua')
            <div style="font-size: 13px; margin-top: 5px; font-style: italic;">
                Media Dipilih: Semua Media Lokal
            </div>
        @endif
    </div>

    {{-- TABEL KIRI DAN RINGKASAN --}}
    <div class="table-wrapper">

        {{-- TABEL KIRI --}}
        <table class="tabelpresensi">
            <thead>
            <tr>
                <th style="width: 4%;">No</th>
                <th style="width: 12%;">Tanggal</th>
                <th style="width: 25%;">Judul / Isu Berita</th>
                <th style="width: 18%;">Media Lokal</th>
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
                    <td>{{ $tgl_indo }}</td>
                    <td>{{ $item['judul'] ?? '-' }}</td>
                    <td>{{ $media_name }}</td>
                    <td>{{ $item['link'] ?? '-' }}</td>
                    <td class="center">-</td>
                    <td class="center">-</td>
                </tr>
            @empty
                <tr><td colspan="7" class="center">Tidak ada data berita untuk periode ini.</td></tr>
            @endforelse
            </tbody>
        </table>

        {{-- TABEL KANAN --}}
        <table class="tabel-summary">
            <tr><th colspan="2" class="center">RINGKASAN</th></tr>
            <tr><td>Jumlah Total Berita Dimuat</td><td class="center">{{ $totalBerita }}</td></tr>
            <tr><td>Jumlah Berita Sentimen Positif</td><td class="center">-</td></tr>
            <tr><td>Jumlah Berita Sentimen Negatif</td><td class="center">-</td></tr>
            <tr><th colspan="2" class="center">Jumlah Berita per Media</th></tr>

            @if(!empty($kode_media) && $kode_media !== 'semua')
                @foreach($mediapartner as $m)
                    <tr>
                        <td>{{ $m->name }}</td>
                        <td class="center">{{ $countPerMedia[$m->kode_media] ?? 0 }}</td>
                    </tr>
                @endforeach
            @else
                @forelse($mediapartner as $m)
                    <tr>
                        <td>{{ $m->name }}</td>
                        <td class="center">{{ $countPerMedia[$m->kode_media] ?? 0 }}</td>
                    </tr>
                @empty
                    <tr><td colspan="2" class="center">Tidak ada media lokal terdaftar</td></tr>
                @endforelse
            @endif

            <tr><th>Total</th><th class="center">{{ $totalBerita }}</th></tr>
        </table>
    </div>
</section>

</body>
</html>
