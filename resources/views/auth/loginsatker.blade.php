<!doctype html>
<!--
* Tabler - Premium and Open Source dashboard template with responsive and high quality UI.
* @version 1.0.0-beta20
* @link https://tabler.io
* Copyright 2018-2023 The Tabler Authors
* Copyright 2018-2023 codecalm.net Paweł Kuna
* Licensed under MIT (https://github.com/tabler/tabler/blob/master/LICENSE)
-->
<html lang="en">
<head>
    <meta charset="utf-8"/>
    <meta name="viewport" content="width=device-width, initial-scale=1, viewport-fit=cover"/>
    <meta http-equiv="X-UA-Compatible" content="ie=edge"/>
    <title>PERISAI</title>
    <!-- CSS files -->
    <link href="{{ asset('tabler/dist/css/tabler.min.css?1692870487') }}" rel="stylesheet"/>
    {{--ikon untuk title--}}
    <link rel="shortcut icon" href="{{ asset('assets/img/p_letter.png') }}" type="image/x-icon"/>
    <link href="{{ asset('tabler/dist/css/tabler-flags.min.css?1692870487') }}" rel="stylesheet"/>
    <link href="{{ asset('tabler/dist/css/tabler-payments.min.css?1692870487') }}" rel="stylesheet"/>
    <link href="{{ asset('tabler/dist/css/tabler-vendors.min.css?1692870487') }}" rel="stylesheet"/>
    <link href="{{ asset('tabler/dist/css/demo.min.css?1692870487') }}" rel="stylesheet"/>

    <style>
        @import url('https://rsms.me/inter/inter.css');

        :root {
            --tblr-font-sans-serif: 'Inter Var', -apple-system, BlinkMacSystemFont, San Francisco, Segoe UI, Roboto, Helvetica Neue, sans-serif;
        }

        body {
            font-feature-settings: "cv03", "cv04", "cv11";
        }
    </style>

</head>
<body class=" d-flex flex-column">
<script src="{{ asset('tabler/dist/js/demo-theme.min.js?1692870487') }}"></script>
<div class="page page-center">
    <div class="container container-normal py-4">
        <div class="row align-items-center g-4">
            <div class="col-lg">
                <div class="container-tight">
                    <div class="text-center mb-4">
                        <a href="." class="navbar-brand navbar-brand-autodark"><img src="./static/logo.svg" height="36"
                                                                                    alt=""></a>
                    </div>
                    <div class="card card-md">
                        <div class="card-body">
                            <h2 class="h2 text-center mb-4">Silakan Login</h2>
                            @if(Session::get('warning'))
                                <div class="alert alert-warning">
                                    <p>{{ Session::get('warning') }}</p>
                                </div>
                            @endif
                            @if($errors->any())
                                <div class="alert alert-danger">
                                    <strong>Errors!</strong><br>
                                    <ul>
                                        @foreach($errors->all() as $error)
                                            <li>{{ $error }}</li>
                                        @endforeach
                                    </ul>
                                </div>
                            @endif

                            {{--<form action="/prosesloginsatker" method="POST" autocomplete="off" novalidate>--}}
                            <form action="{{ route('prosesloginsatker') }}" method="POST" autocomplete="off" novalidate>
                                @csrf
                                <div class="mb-3">
                                    <label class="form-label">Kode Satker</label>
                                    <input type="email" id="kode_satker" name="kode_satker" class="form-control"
                                           placeholder="Your Satker ID" value="{{ old('kode_satker') }}"
                                           autocomplete="off">
                                </div>
                                <div class="mb-2">
                                    <label class="form-label">
                                        Password
                                        <span class="form-label-description">
                          <a hidden href="./forgot-password.html">I forgot password</a>
                        </span>
                                    </label>
                                    <div class="input-group input-group-flat">
                                        <input type="password" name="password" id="password" class="form-control"
                                               placeholder="Your Password" autocomplete="off">
                                        <span class="input-group-text">

                          <a href="#" id="passwordprompt" name="passwordprompt" class="link-secondary"
                             onclick="showPassword()" title="" data-bs-toggle="tooltip"><!-- Download SVG icon from http://tabler-icons.io/i/eye -->
                            <div class="row">
                                <div class="col-6" id="eye-open" name="eye-open" title="Show Password">
                                <svg xmlns="http://www.w3.org/2000/svg" class="icon" width="24" height="24"
                                     viewBox="0 0 24 24" stroke-width="2" stroke="currentColor" fill="none"
                                     stroke-linecap="round" stroke-linejoin="round"><path stroke="none" d="M0 0h24v24H0z"
                                                                                          fill="none"/><path
                                            d="M10 12a2 2 0 1 0 4 0a2 2 0 0 0 -4 0"/><path
                                            d="M21 12c-2.4 4 -5.4 6 -9 6c-3.6 0 -6.6 -2 -9 -6c2.4 -4 5.4 -6 9 -6c3.6 0 6.6 2 9 6"/></svg>
                            </div>
                                <div hidden class="col-6" id="eye-closed" name="eye-closed" title="Hide Password">
                                    <svg xmlns="http://www.w3.org/2000/svg" width="24" height="24" viewBox="0 0 24 24"
                                         fill="none" stroke="currentColor" stroke-width="2" stroke-linecap="round"
                                         stroke-linejoin="round"
                                         class="icon icon-tabler icons-tabler-outline icon-tabler-eye-off"><path stroke="none"
                                                                                                                 d="M0 0h24v24H0z"
                                                                                                                 fill="none"/><path
                                                d="M10.585 10.587a2 2 0 0 0 2.829 2.828"/><path
                                                d="M16.681 16.673a8.717 8.717 0 0 1 -4.681 1.327c-3.6 0 -6.6 -2 -9 -6c1.272 -2.12 2.712 -3.678 4.32 -4.674m2.86 -1.146a9.055 9.055 0 0 1 1.82 -.18c3.6 0 6.6 2 9 6c-.666 1.11 -1.379 2.067 -2.138 2.87"/><path
                                                d="M3 3l18 18"/></svg>
                                </div>

                            </div>

                          </a>
                        </span>
                                    </div>
                                </div>
                                <div class="mb-3">
                                    <label class="form-label">Roles</label>
                                    <select name="role_user" id="role_user" class="form-select">
                                        <option value="">Pilih Role</option>
                                        <option hidden value="humas_satker">Humas Satker</option>
                                        <option value="superadmin">Administrator</option>
                                        <option value="humas_kanwil">Humas Kanwil</option>
                                    </select>
                                </div>
                                <div hidden class="mb-2">
                                    <label class="form-check">
                                        <input type="checkbox" class="form-check-input"/>
                                        <span class="form-check-label">Remember me on this device</span>
                                    </label>
                                </div>
                                <div class="form-group mb-3">
                                    <div style="text-align: center; margin-bottom: 10px">

                                        <strong>Google Recaptcha</strong>
                                    </div>
                                    {!! NoCaptcha::renderJs() !!}
                                    {!! NoCaptcha::display() !!}
                                </div>
                                <div class="form-footer">

                                    <div class="row justify-content-center">
                                        <div class="col-12">
                                            <button type="submit" class="btn btn-primary w-100">
                                                Sign In Here
                                            </button>
                                        </div>
                                    </div>

                                    <div class="row mt-2 justify-content-center">
                                        <div class="col-12">
                                            <a href="{{ route('landing') }}" type="submit" class="btn btn-warning w-100">
                                                Back to Landing Page
                                            </a>
                                        </div>
                                    </div>

                                </div>

                                {{--<div class="form-footer">--}}

                                    {{--<div class="row">--}}
                                        {{--<div class="col-6"><button type="submit" class="btn btn-primary w-100">--}}
                                                {{--Sign In Here--}}
                                            {{--</button></div>--}}

                                    {{--</div>--}}
                                    {{--<div class="row mt-2">--}}
                                        {{--<div class="col-6"><button type="submit" class="btn btn-primary w-100">--}}
                                                {{--Sign In Here--}}
                                            {{--</button></div>--}}

                                    {{--</div>--}}


                                {{--</div>--}}
                            </form>
                        </div>

                    </div>

                </div>
            </div>

            <div class="col-lg d-none d-lg-block">

                <div class="row ">
                    <div class="col-12">
                        <center>

                            {{--<img src="{{ asset('assets/img/perisai_2.png') }}" alt="" class="">--}}
                            {{--<img src="{{ asset('assets/img/perisai_kemenkum.png') }}" alt="" class="" style="height: 80px; width: 800px;">--}}
                            <img src="{{ asset('assets/img/perisai_logo_text.png') }}" alt="" class=""
                                 style="height: 80px; width: 800px;">
                            {{--<img src="{{ asset('assets/img/perisai_kemenkum2.png') }}" alt="" class="" style="height: 80px; width: 800px;">--}}
                        </center>
                    </div>
                </div>
                <div class="row mt-4">
                    <div class="col-12">

                        {{--<img src="{{ asset('tabler/static/illustrations/undraw_secure_login_pdn4.svg') }}" height="300"
                             class="d-block mx-auto" alt="">--}}

                        <img src="{{ asset('assets/img/perisai_logo_kum1.png') }}" style="height: 350px; width: 350px;"
                             class="d-block mx-auto" alt="">

                    </div>
                </div>

            </div>
        </div>
    </div>
</div>
<!-- Libs JS -->
<!-- Tabler Core -->
<script src="{{ asset('tabler/dist/js/tabler.min.js?1692870487') }}" defer></script>
<script src="{{ asset('tabler/dist/js/demo.min.js?1692870487') }}" defer></script>


<script type="text/javascript">

    // document.getElementsByClassName("g-recaptcha");
    // document.getElementsByClassName('g-recaptcha').setAttribute("style","display:block;width:500px");
    // document.getElementsByClassName('g-recaptcha').style.width='1000px';

    function showPassword() {

        const eyeOpen = document.getElementById('eye-open');
        const eyeClosed = document.getElementById('eye-closed');

        var password = document.getElementById("password");

        const passwordprompt = document.getElementById("passwordprompt");
        passwordprompt.title = "";
        if (password.type === "password") {
            password.type = "text";
            //passwordprompt.setAttribute("title", "Hide Password");

            eyeOpen.hidden=true;
            eyeClosed.removeAttribute('hidden');
        } else {
            password.type = "password";
            //passwordprompt.setAttribute("title", "Show Password");
            eyeClosed.hidden=true;
            eyeOpen.removeAttribute('hidden');
        }


    }

    var list, index;
    list = document.getElementsByClassName("g-recaptcha");
    for (index = 0; index < list.length; ++index) {
        list[index].setAttribute("style", "display:block;margin-left:25px");
    }
</script>
</body>
</html>