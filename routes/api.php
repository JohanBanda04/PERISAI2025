<?php

use Illuminate\Http\Request;
use Illuminate\Support\Facades\Route;

// Controllers
use App\Http\Controllers\AuthController;
use App\Http\Controllers\BeritaController;
use App\Http\Controllers\DatasatkerController;
use App\Http\Controllers\DivisiController;
use App\Http\Controllers\KonfigurasiBeritaController;
use App\Http\Controllers\LaporanWhatsappController;
use App\Http\Controllers\MediapartnerController;
use App\Http\Controllers\PrioritasController;
use App\Http\Controllers\UserController;

/*
|--------------------------------------------------------------------------
| API Routes
|--------------------------------------------------------------------------
| Semua endpoint API didefinisikan di sini.
| Route yang membutuhkan autentikasi dilindungi oleh Sanctum.
|--------------------------------------------------------------------------
*/

// =====================================================
// 🔹 DEFAULT SANCTUM
// =====================================================
Route::middleware('auth:sanctum')->get('/user', fn(Request $request) => $request->user())
    ->name('api.user');

// =====================================================
// 🔐 AUTHENTICATION
// =====================================================
Route::post('/login-satker', [AuthController::class, 'apiLoginSatker'])
    ->name('api.login.satker');

Route::post('/logout-satker', [AuthController::class, 'apiLogoutSatker'])
    ->middleware('auth:sanctum')
    ->name('api.logout.satker');

// =====================================================
// 🔒 PROTECTED ROUTES (AUTH REQUIRED)
// =====================================================
Route::middleware('auth:sanctum')->group(function () {

    // =================================================
    // 👤 USER SESSION
    // =================================================
    Route::get('/me', [UserController::class, 'apiMe'])->name('api.me');

    // =================================================
    // 🏢 DATA SATKER
    // =================================================
    Route::prefix('datasatker')->controller(DatasatkerController::class)->group(function () {
        Route::get('/', 'apiIndex')->name('api.satker.index');
        Route::post('/', 'apiStore')->name('api.satker.store');
        Route::put('/{id}', 'apiUpdate')->name('api.satker.update');
        Route::delete('/{id}', 'apiDestroy')->name('api.satker.destroy');
    });
    Route::get('/satker', [DatasatkerController::class, 'apiList'])
        ->name('api.satker.list');

    // =================================================
    // 📰 BERITA
    // =================================================
    Route::prefix('berita')->controller(BeritaController::class)->group(function () {
        Route::get('/', 'apiIndex')->name('api.berita.index');
        Route::post('/', 'apiStore')->name('api.berita.store');
        Route::match(['put', 'post'], '/{id}', 'apiUpdate')->name('api.berita.update');
        Route::match(['delete', 'post'], '/{id}', 'apiDestroy')->name('api.berita.destroy');
    });

    // =================================================
    // 📻 MEDIA PARTNER
    // =================================================
    Route::prefix('mediapartner')->controller(MediapartnerController::class)->group(function () {
        // ⚙️ Generate kode otomatis (harus di atas {id_media})
        Route::get('/next-kode', 'getNextKode')->name('api.media.next-kode');

        // 🔹 CRUD utama
        Route::get('/', 'apiIndex')->name('api.media.index');
        Route::post('/', 'apiStore')->name('api.media.store');
        Route::get('/{id_media}', 'apiShow')->name('api.media.show');
        Route::match(['put', 'post'], '/{id_media}', 'apiUpdate')->name('api.media.update');
        Route::match(['delete', 'post'], '/{id_media}', 'apiDestroy')->name('api.media.destroy');
    });

    // =================================================
    // 🧭 DIVISI
    // =================================================
    Route::get('/divisi', [DivisiController::class, 'apiIndex'])
        ->name('api.divisi.index');

    // =================================================
    // ⚡ PRIORITAS
    // =================================================
    Route::get('/prioritas', [PrioritasController::class, 'apiIndex'])
        ->name('api.prioritas.index');

    // =================================================
    // ⚙️ KONFIGURASI BERITA
    // =================================================
//    Route::get('/konfigurasi-berita', [KonfigurasiBeritaController::class, 'apiIndex'])
//        ->name('api.konfigurasi.berita.index');

    // =================================================
    // 🧾 LAPORAN WHATSAPP & BERITA PER MEDIA
    // =================================================
    Route::controller(LaporanWhatsappController::class)->group(function () {
        Route::post('/laporan-whatsapp', 'apiGenerate')->name('api.laporan.whatsapp');
    });

    Route::controller(BeritaController::class)->group(function () {
        Route::post('/laporan-whatsapp-preview', 'apiLaporanWhatsappPreview')
            ->name('api.laporan.whatsapp.preview');

        Route::post('/laporan-berita-permedia', 'apiLaporanBeritaPerMedia')
            ->name('api.laporan.berita.permedia');

        Route::post('/export-laporan-berita-permedia', 'apiExportLaporanBeritaPerMedia')
            ->name('api.export.laporan.berita.permedia');
    });

    Route::prefix('konfigurasi-berita')->controller(KonfigurasiBeritaController::class)->group(function(){
        /*Get data konfigurasi*/

        Route::get('/','apiIndex')->name('api.konfig.index');
        // 🔹 Tambah data konfigurasi
        Route::post('/', 'apiStore')->name('api.konfig.store');

        // 🔹 Lihat satu data konfigurasi
        Route::get('/{id_konfig}','apiShow')->name('api.konfig.show');

        // 🔹 Update konfigurasi (pakai PUT atau POST)
        Route::match(['put', 'post'], '/{id_konfig}', 'apiUpdate')->name('api.konfig.update');

        // 🔹 Hapus data konfigurasi
        Route::match(['delete', 'post'], '/{id_konfig}', 'apiDestroy')->name('api.konfig.destroy');

        Route::get('/next-kode', 'getNextKode')->name('api.konfig.next-kode');

    });
});
