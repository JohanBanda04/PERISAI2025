@php
    use Illuminate\Support\Facades\DB;
    use Carbon\Carbon;

    // Group by skala_prioritas
    $grouped = collect($filteredBerita)->groupBy('skala_prioritas')->sortKeys();

    // Hitung berita per media
    $countPerMedia = [];
    foreach ($filteredBerita as $b) {
        $kode = $b['kode_media'] ?? '-';
        $link = trim($b['link'] ?? '');
        if ($link === '' || $link === '-' || $link === '--') continue;
        if (!isset($countPerMedia[$kode])) $countPerMedia[$kode] = 0;
        $countPerMedia[$kode]++;
    }
    $totalBerita = array_sum($countPerMedia);
@endphp

{{-- ================= HEADER TANPA BORDER ================= --}}
<table cellspacing="0" cellpadding="3" style="font-family:Arial; font-size:11px; width:100%; border-collapse:collapse;">
    <tr>
        <td colspan="7" style="font-size:16px; font-weight:bold; text-align:center;">
            REKAP BERITA MEDIA EKSTERNAL ({{ strtoupper($jenis_media === 'media_nasional' ? 'NASIONAL' : 'LOKAL') }}) {{ strtoupper($satker_name) }}
        </td>
    </tr>
    <tr>
        <td colspan="7" style="font-size:13px; font-weight:bold; text-align:center;">
            {{ strtoupper($kode_divisi_pilihan === 'all_berita' ? 'SEMUA BERITA' : 'BERITA SPESIFIK') }}
        </td>
    </tr>
    <tr>
        <td colspan="7" style="text-align:center; font-size:12px;">
            PERIODE {{ $tgl_dari }} {{ strtoupper($namabulan[$bulan_dari]) }} {{ $tahun_dari }}
            s.d. {{ $tgl_sampai }} {{ strtoupper($namabulan[$bulan_sampai]) }} {{ $tahun_sampai }}
        </td>
    </tr>
    <tr>
        <td colspan="7" style="text-align:center; font-style:italic; font-size:11px;">
            Urut Berdasarkan Skala Prioritas (Presiden → Menteri → Eselon 1 → dst)
        </td>
    </tr>
</table>

<br>

{{-- ================= TABEL UTAMA DENGAN BORDER ================= --}}
<table border="1" cellspacing="0" cellpadding="4" style="border-collapse:collapse; font-family:Arial; font-size:11px; width:100%;">
    @forelse($grouped as $skala => $items)
        @php
            $prior = DB::table('tbl_prioritas')->where('skala_prioritas', $skala)->first();
            $namaPrioritas = $prior->nama_prioritas_lengkap ?? 'Prioritas Tidak Dikenal';
        @endphp

        {{-- HEADER PRIORITAS --}}
        <tr style="background:#9dc3e6; font-weight:bold;">
            <td colspan="7" style="font-size:13px;">PRIORITAS: {{ strtoupper($namaPrioritas) }}</td>
        </tr>

        {{-- HEADER KOLOM --}}
        <tr style="background:#ffe699; font-weight:bold; text-align:center;">
            <td style="width:4%;">No</td>
            <td style="width:13%;">Tanggal</td>
            <td style="width:28%;">Judul / Isu Berita</td>
            <td style="width:18%;">Media</td>
            <td style="width:23%;">Link Berita</td>
            <td style="width:7%;">Narasumber</td>
            <td style="width:7%;">Sentimen</td>
        </tr>

        {{-- ISI BERITA --}}
        @foreach($items as $i => $b)
            @php
                $tgl_indo = Carbon::parse($b['tgl_input'])->translatedFormat('d F Y');
                $media_name = DB::table('mediapartner')->where('kode_media', $b['kode_media'])->value('name') ?? $b['kode_media'];
            @endphp
            <tr>
                <td align="center">{{ $i + 1 }}</td>
                <td align="center">{{ $tgl_indo }}</td>
                <td>{{ $b['judul'] }}</td>
                <td>{{ $media_name }}</td>
                <td>{{ $b['link'] }}</td>
                <td align="center">-</td>
                <td align="center">-</td>
            </tr>
        @endforeach

        {{-- SPASI ANTAR PRIORITAS --}}
        <tr><td colspan="7" style="height:25px;"></td></tr>
    @empty
        <tr><td colspan="7" align="center">Tidak ada data berita.</td></tr>
    @endforelse
</table>

<br>

{{-- ================= RINGKASAN ================= --}}
<table border="1" cellspacing="0" cellpadding="4" style="border-collapse:collapse; font-family:Arial; font-size:11px; width:50%;">
    <tr style="background:#d9d9d9; font-weight:bold; text-align:center;">
        <th colspan="2">RINGKASAN</th>
    </tr>
    <tr>
        <td>Jumlah Total Berita Dimuat</td>
        <td align="center">{{ $totalBerita }}</td>
    </tr>
    <tr>
        <td>Jumlah Berita Sentimen Positif</td>
        <td align="center">-</td>
    </tr>
    <tr>
        <td>Jumlah Berita Sentimen Negatif</td>
        <td align="center">-</td>
    </tr>
    <tr style="background:#fce4d6; font-weight:bold; text-align:center;">
        <th colspan="2">Jumlah Berita per Media</th>
    </tr>

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
            <td align="center">{{ $jumlah }}</td>
        </tr>
    @empty
        <tr><td colspan="2" align="center">Tidak ada media terdaftar</td></tr>
    @endforelse

    <tr style="font-weight:bold;">
        <td>Total</td>
        <td align="center">{{ $totalBerita }}</td>
    </tr>
</table>
