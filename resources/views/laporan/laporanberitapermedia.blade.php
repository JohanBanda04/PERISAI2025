@extends('layouts.admin.tabler')
@section('content')
    <div class="page-header d-print-none">
        <div class="container-xl">
            <div class="row g-2 align-items-center">
                <div class="col">
                    <div class="page-pretitle">

                    </div>
                    <h2 class="page-title">
                        {{--ASLIII--}}
                        {{ $judul_web }}
                    </h2>
                </div>
            </div>
        </div>
    </div>
    <div class="page-body">
        <div class="container-xl">
            <div class="row">
                <div class="col-6">
                    <div class="card">
                        <div class="card-body">
                            <form action="{{ route('cetaklaporanberitapermedia') }}" id="frmLaporanBerita"
                                  target="_blank"
                                  method="post">
                                @csrf
                                <div class="row">
                                    <div class="col-6">
                                        <div class="input-icon mb-3">
                                            <span class="input-icon-addon">
                                                <svg xmlns="http://www.w3.org/2000/svg"
                                                     class="icon icon-tabler icon-tabler-calendar-event" width="24"
                                                     height="24"
                                                     viewBox="0 0 24 24" stroke-width="1.5" stroke="currentColor"
                                                     fill="none"
                                                     stroke-linecap="round" stroke-linejoin="round"><path stroke="none"
                                                                                                          d="M0 0h24v24H0z"
                                                                                                          fill="none"/><path
                                                            d="M4 5m0 2a2 2 0 0 1 2 -2h12a2 2 0 0 1 2 2v12a2 2 0 0 1 -2 2h-12a2 2 0 0 1 -2 -2z"/><path
                                                            d="M16 3l0 4"/><path d="M8 3l0 4"/><path d="M4 11l16 0"/><path
                                                            d="M8 15h2v2h-2z"/></svg>
                                            </span>
                                            <input type="text" value="{{ Request('dari') }}" class="form-control"
                                                   name="dari" id="dari"
                                                   placeholder="Dari" autocomplete="off">
                                        </div>
                                    </div>
                                    <div class="col-6">
                                        <div class="input-icon mb-3">
                                            <span class="input-icon-addon">
                                                <svg xmlns="http://www.w3.org/2000/svg"
                                                     class="icon icon-tabler icon-tabler-calendar-event" width="24"
                                                     height="24"
                                                     viewBox="0 0 24 24" stroke-width="1.5" stroke="currentColor"
                                                     fill="none"
                                                     stroke-linecap="round" stroke-linejoin="round"><path stroke="none"
                                                                                                          d="M0 0h24v24H0z"
                                                                                                          fill="none"/><path
                                                            d="M4 5m0 2a2 2 0 0 1 2 -2h12a2 2 0 0 1 2 2v12a2 2 0 0 1 -2 2h-12a2 2 0 0 1 -2 -2z"/><path
                                                            d="M16 3l0 4"/><path d="M8 3l0 4"/><path d="M4 11l16 0"/><path
                                                            d="M8 15h2v2h-2z"/></svg>
                                            </span>
                                            <input type="text" value="{{ Request('sampai') }}" class="form-control"
                                                   name="sampai" id="sampai"
                                                   placeholder="Sampai" autocomplete="off">
                                        </div>
                                    </div>

                                </div>

                                <div class="row mt-2">
                                    <div class="col-12">
                                        <div class="form-group">
                                            <select name="kode_satker" id="kode_satker" class="form-select">
                                                @if(auth()->user()->roles=='humas_kanwil' || auth()->user()->roles=='humas_satker')
                                                    @php
                                                        $satker = DB::table('satker')->where('kode_satker', auth()->user()->kode_satker)->first();

                                                    @endphp
                                                    <option selected
                                                            value="{{ auth()->user()->kode_satker }}">
                                                        {{ $satker->name  }} ({{ $satker->kode_satker }})
                                                    </option>
                                                @elseif(auth()->user()->roles=='superadmin')
                                                    {{--ASLIII--}}
                                                    <option value="">-Pilih Satker-</option>
                                                    @foreach($satker as $d)
                                                        @if($d->roles!='superadmin')
                                                            <option value="{{ $d->kode_satker }}">{{ $d->name }}
                                                                ({{ $d->kode_satker }})
                                                            </option>
                                                        @endif
                                                    @endforeach
                                                @endif

                                            </select>
                                        </div>
                                    </div>
                                </div>
                                <div class="row mt-2">
                                    <div class="col-12">
                                        <div class="form-group">
                                            <select name="jenis_media" id="jenis_media" class="form-select">
                                                <option value="">-Pilih Jenis Media-</option>
                                                <option value="sosial_media">Link Sosial Media</option>
                                                <option value="media_lokal">Link Media Lokal</option>
                                                <option value="media_nasional">Link Media Nasional</option>
                                            </select>
                                        </div>
                                    </div>
                                </div>
                                <div class="row mt-2">
                                    <div class="col-12">
                                        <div class="form-group">
                                            <select name="kode_media" id="kode_media" class="form-select">
                                                <option value="">-Pilih Nama Media-</option>
                                                @foreach($mediapartners as $key=>$media)
                                                    <option value="{{ $media->kode_media }}">{{ $media->name }}</option>
                                                @endforeach
                                            </select>
                                        </div>
                                    </div>
                                </div>
                                <div class="row mt-4">
                                    <div class="col-6">
                                        <div class="form-group">
                                            <button type="submit" name="cetakberita" id="cetakberita"
                                                    class="btn btn-primary w-100">
                                                <svg xmlns="http://www.w3.org/2000/svg"
                                                     class="icon icon-tabler icon-tabler-printer" width="24" height="24"
                                                     viewBox="0 0 24 24" stroke-width="2" stroke="currentColor"
                                                     fill="none"
                                                     stroke-linecap="round" stroke-linejoin="round">
                                                    <path stroke="none" d="M0 0h24v24H0z" fill="none"/>
                                                    <path d="M17 17h2a2 2 0 0 0 2 -2v-4a2 2 0 0 0 -2 -2h-14a2 2 0 0 0 -2 2v4a2 2 0 0 0 2 2h2"/>
                                                    <path d="M17 9v-4a2 2 0 0 0 -2 -2h-6a2 2 0 0 0 -2 2v4"/>
                                                    <path d="M7 13m0 2a2 2 0 0 1 2 -2h6a2 2 0 0 1 2 2v4a2 2 0 0 1 -2 2h-6a2 2 0 0 1 -2 -2z"/>
                                                </svg>
                                                Cetak
                                            </button>
                                        </div>
                                    </div>
                                    <div class="col-6">
                                        <div class="form-group">
                                            <button type="submit" name="exportexcelberita_permedia" id="exportexcelberita_permedia"
                                                    class="btn btn-success w-100">
                                                <svg xmlns="http://www.w3.org/2000/svg"
                                                     class="icon icon-tabler icon-tabler-download" width="24"
                                                     height="24"
                                                     viewBox="0 0 24 24" stroke-width="2" stroke="currentColor"
                                                     fill="none"
                                                     stroke-linecap="round" stroke-linejoin="round">
                                                    <path stroke="none" d="M0 0h24v24H0z" fill="none"/>
                                                    <path d="M4 17v2a2 2 0 0 0 2 2h12a2 2 0 0 0 2 -2v-2"/>
                                                    <path d="M7 11l5 5l5 -5"/>
                                                    <path d="M12 4l0 12"/>
                                                </svg>
                                                Export to Excel
                                            </button>
                                        </div>
                                    </div>
                                </div>
                            </form>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
@endsection
@push('myscript')
    <script>
        $(function () {

            // --- Inisialisasi datepicker ---
            $("#dari, #sampai").datepicker({
                autoclose: true,
                todayHighlight: true,
                format: 'yyyy-mm-dd',
            });

            // --- Validasi sebelum submit ---
            $('#frmLaporanBerita').on('submit', function () {
                const dari = $('#dari').val().trim();
                const sampai = $('#sampai').val().trim();
                const kode_satker = $('#kode_satker').val();
                const jenis_media = $('#jenis_media').val();
                const kode_media = $('#kode_media').val();

                if (!dari) {
                    Swal.fire({
                        title: 'Warning!',
                        text: 'Tanggal Awal belum dipilih',
                        icon: 'warning',
                        confirmButtonText: 'OK'
                    }).then(() => $('#dari').focus());
                    return false;
                }

                if (!sampai) {
                    Swal.fire({
                        title: 'Warning!',
                        text: 'Tanggal Akhir belum dipilih',
                        icon: 'warning',
                        confirmButtonText: 'OK'
                    }).then(() => $('#sampai').focus());
                    return false;
                }

                if (!kode_satker) {
                    Swal.fire({
                        title: 'Warning!',
                        text: 'Kode Satker belum dipilih',
                        icon: 'warning',
                        confirmButtonText: 'OK'
                    }).then(() => $('#kode_satker').focus());
                    return false;
                }

                if (!jenis_media) {
                    Swal.fire({
                        title: 'Warning!',
                        text: 'Jenis Media belum dipilih',
                        icon: 'warning',
                        confirmButtonText: 'OK'
                    }).then(() => $('#jenis_media').focus());
                    return false;
                }

                if (jenis_media !== "sosial_media" && !kode_media) {
                    Swal.fire({
                        title: 'Warning!',
                        text: 'Nama Media belum dipilih',
                        icon: 'warning',
                        confirmButtonText: 'OK'
                    }).then(() => $('#kode_media').focus());
                    return false;
                }
            });

            // --- Ambil semua data media dari PHP ---
            const allMedia = @json($mediapartners);

            // --- Efek dinamis: tampil/sembunyi Nama Media berdasarkan Jenis Media ---
            $('#jenis_media').on('change', function () {
                const jenis = $(this).val();
                const kodeMediaGroup = $('#kode_media').closest('.form-group');
                const kodeMediaSelect = $('#kode_media');

                if (jenis === 'sosial_media' || !jenis) {
                    // Sembunyikan field dan kosongkan nilai
                    kodeMediaGroup.slideUp(200);
                    kodeMediaSelect.val('');
                    return;
                }

                // Filter media sesuai jenis_media
                //.filter ini seperti foreach yang langsung ngefilter
                const filtered = allMedia.filter(item => item.jenis_media === jenis);

                /*Prosesi pengisian option dropdown select mulai dari sini*/
                // Reset isi dropdown
                kodeMediaSelect.empty();

                // Tambahkan opsi default
                kodeMediaSelect.append('<option value="">-Pilih Nama Media-</option>');
                // Tambahkan opsi "Semua"
                kodeMediaSelect.append('<option value="semua">-Semua-</option>');

                // Tambahkan opsi hasil filter
                filtered.forEach(media => {
                    kodeMediaSelect.append(
                        `<option value="${media.kode_media}">${media.name}</option>`
                    );
                });
                /*Prosesi pengisian option dropdown select mulai sampai sini*/

                // Tampilkan field dengan animasi
                kodeMediaGroup.slideDown(200);
            });

            // --- Jalankan saat halaman pertama kali dimuat ---
            (function initKodeMediaVisibility() {
                const jenis = $('#jenis_media').val();
                const kodeMediaGroup = $('#kode_media').closest('.form-group');
                if (jenis === 'sosial_media' || !jenis) {
                    kodeMediaGroup.hide();
                    $('#kode_media').val('');
                } else {
                    kodeMediaGroup.show();
                }
            })();

        });
    </script>
@endpush
