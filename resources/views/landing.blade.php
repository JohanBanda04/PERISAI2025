<!doctype html>
<html lang="en">
<head>
    <meta charset="utf-8"/>
    <meta name="viewport" content="width=device-width, initial-scale=1, viewport-fit=cover"/>
    <meta http-equiv="X-UA-Compatible" content="ie=edge"/>
    <title>PERISAI - Landing Page</title>

    <!-- Tabler CSS -->
    <link href="{{ asset('tabler/dist/css/tabler.min.css') }}" rel="stylesheet"/>
    <link href="{{ asset('tabler/dist/css/tabler-flags.min.css') }}" rel="stylesheet"/>
    <link href="{{ asset('tabler/dist/css/tabler-payments.min.css') }}" rel="stylesheet"/>
    <link href="{{ asset('tabler/dist/css/tabler-vendors.min.css') }}" rel="stylesheet"/>
    <link href="{{ asset('tabler/dist/css/demo.min.css') }}" rel="stylesheet"/>

    <link rel="shortcut icon" href="{{ asset('assets/img/p_letter.png') }}" type="image/x-icon"/>

    <style>
        @import url('https://rsms.me/inter/inter.css');
        :root { --tblr-font-sans-serif: 'Inter Var', sans-serif; }
        body { font-feature-settings: "cv03", "cv04", "cv11"; }
        .hero-section { padding: 120px 0 80px; }
        .hero-title { font-size: 46px; font-weight: 800; color: var(--tblr-body-color); }
        .hero-subtitle { font-size: 20px; color: var(--tblr-secondary-color); }
    </style>
</head>

<body>

<!-- ============================= NAVBAR =============================== -->
<header class="navbar navbar-expand-md d-print-none shadow-sm">
    <div class="container-xl">

        <!-- Logo -->
        <a class="navbar-brand" href="{{ route('landing') }}">
            <img src="{{ asset('assets/img/perisai_logo_text.png') }}" height="48" alt="PERISAI">
        </a>

        <!-- Right section -->
        <div class="navbar-nav flex-row ms-auto">

            <!-- Toggle Dark / Light -->
            <a href="#" class="nav-link px-2" id="theme-toggle" title="Switch Theme">
                <!-- LIGHT ICON -->
                <svg id="icon-light" xmlns="http://www.w3.org/2000/svg"
                     class="icon hide-theme-light"
                     width="24" height="24" viewBox="0 0 24 24"
                     stroke-width="2" stroke="currentColor" fill="none"
                     stroke-linecap="round" stroke-linejoin="round">
                    <path stroke="none" d="M0 0h24v24H0z" fill="none"/>
                    <path d="M12 12m-4 0a4 4 0 1 0 8 0a4 4 0 1 0 -8 0"/>
                    <path d="M3 12h1m8 -9v1m8 8h1m-9 8v1m-6.4 -15.4l.7 .7
                    m12.1 -.7l-.7 .7m0 11.4l.7 .7m-12.1 -.7l-.7 .7"/>
                </svg>

                <!-- DARK ICON -->
                <svg id="icon-dark" xmlns="http://www.w3.org/2000/svg"
                     class="icon hide-theme-dark"
                     width="24" height="24" viewBox="0 0 24 24"
                     stroke-width="2" stroke="currentColor" fill="none"
                     stroke-linecap="round" stroke-linejoin="round">
                    <path stroke="none" d="M0 0h24v24H0z" fill="none"/>
                    <path d="M12 3c.132 0 .263 0 .393 0
                    a7.5 7.5 0 0 0 7.92 12.446
                    a9 9 0 1 1 -8.313 -12.454z"/>
                </svg>
            </a>

            <!-- Login -->
            <a href="{{ route('loginsatker') }}" class="btn btn-primary ms-3">
                Login Satker
            </a>
        </div>
    </div>
</header>


<!-- ============================= HERO =============================== -->
<section class="hero-section">
    <div class="container-xl">
        <div class="row align-items-center">

            <div class="col-lg-6">
                <h1 class="hero-title">Sistem PERISAI NTB</h1>
                <p class="hero-subtitle mt-3">
                    Platform manajemen publikasi dan administrasi humas satker & kanwil.
                </p>

                <div class="mt-4">
                    <a href="{{ route('loginsatker') }}" class="btn btn-lg btn-primary">
                        Mulai Login
                    </a>
                    <a href="#fitur" class="btn btn-lg btn-outline-secondary ms-2">
                        Lihat Fitur
                    </a>
                </div>
            </div>

            <div class="col-lg-6 text-center">
                <img src="{{ asset('assets/img/perisai_logo_kum1.png') }}"
                     class="img-fluid" style="max-width: 380px;">
            </div>

        </div>
    </div>
</section>


<!-- ============================= FITUR =============================== -->
<section id="fitur" class="py-5">
    <div class="container-xl">
        <h2 class="text-center mb-4">Fitur Utama</h2>

        <div class="row row-cards">

            <div class="col-md-4">
                <div class="card card-md text-center">
                    <div class="card-body">
                        <span class="avatar avatar-xl mb-3 bg-primary-lt">
                            <svg xmlns="http://www.w3.org/2000/svg" class="icon" width="40"
                                 height="40" viewBox="0 0 24 24" stroke-width="2"
                                 stroke="currentColor" fill="none" stroke-linecap="round">
                                 <path stroke="none" d="M0 0h24v24H0z"/>
                                 <path d="M9 7a4 4 0 1 0 8 0a4 4 0 1 0 -8 0"/>
                                 <path d="M3 21v-2a4 4 0 0 1 4 -4h4"/>
                        </svg>
                        </span>
                        <h3 class="card-title">Manajemen Satker</h3>
                        <p class="text-muted">Pengelolaan akun humas dan otorisasi akses.</p>
                    </div>
                </div>
            </div>

            <div class="col-md-4">
                <div class="card card-md text-center">
                    <div class="card-body">
                        <span class="avatar avatar-xl mb-3 bg-green-lt">
                            <svg xmlns="http://www.w3.org/2000/svg" class="icon"
                                 width="40" height="40" viewBox="0 0 24 24"
                                 stroke-width="2" stroke="currentColor" fill="none">
                                 <path d="M4 19h16v-14h-16v14z"/>
                                 <path d="M7 12h10"/>
                                 <path d="M7 16h10"/>
                                 <path d="M7 8h6"/>
                            </svg>
                        </span>
                        <h3 class="card-title">Publikasi Berita</h3>
                        <p class="text-muted">Mengelola berita, kegiatan, & laporan.</p>
                    </div>
                </div>
            </div>

            <div class="col-md-4">
                <div class="card card-md text-center">
                    <div class="card-body">
                        <span class="avatar avatar-xl mb-3 bg-orange-lt">
                            <svg xmlns="http://www.w3.org/2000/svg" class="icon"
                                 width="40" height="40" viewBox="0 0 24 24"
                                 stroke-width="2" stroke="currentColor" fill="none">
                                <path d="M4 6h16v12h-16z"/>
                                <path d="M4 15l4 -4a3 5 0 0 1 3 0l5 5"/>
                            </svg>
                        </span>
                        <h3 class="card-title">Media Partner</h3>
                        <p class="text-muted">Integrasi hubungan media lokal & nasional.</p>
                    </div>
                </div>
            </div>

        </div>

    </div>
</section>


<!-- ============================= FOOTER =============================== -->
<footer class="footer footer-transparent mt-5">
    <div class="container-xl text-center">
        <p class="text-muted mb-0">
            © {{ date('Y') }} PERISAI NTB – Kemenkumham
        </p>
    </div>
</footer>


<!-- Tabler JS -->
<script src="{{ asset('tabler/dist/js/tabler.min.js') }}" defer></script>
<script src="{{ asset('tabler/dist/js/demo.min.js') }}" defer></script>

<!-- ============================= THEME SCRIPT =============================== -->
<script>
    function setTheme(theme) {
        localStorage.setItem("tablerTheme", theme);
        document.documentElement.setAttribute("data-bs-theme", theme);
    }

    function initTheme() {
        const saved = localStorage.getItem("tablerTheme");
        if (saved) {
            setTheme(saved);
        } else {
            const prefersDark = window.matchMedia("(prefers-color-scheme: dark)").matches;
            setTheme(prefersDark ? "dark" : "light");
        }
    }

    document.getElementById("theme-toggle").addEventListener("click", function (e) {
        e.preventDefault();
        const current = document.documentElement.getAttribute("data-bs-theme");
        setTheme(current === "light" ? "dark" : "light");
    });

    initTheme();
</script>

</body>
</html>
