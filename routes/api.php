<?php

use App\Http\Controllers\AuthController;
use App\Http\Controllers\BeritaController;
use App\Http\Controllers\DatasatkerController;
use App\Http\Controllers\DivisiController;
use App\Http\Controllers\KonfigurasiBeritaController;
use App\Http\Controllers\MediapartnerController;
use App\Http\Controllers\PrioritasController;
use App\Http\Controllers\UserController; // ✅ Tambah controller baru
use Illuminate\Http\Request;
use Illuminate\Support\Facades\Route;

/*
|--------------------------------------------------------------------------
| API Routes
|--------------------------------------------------------------------------
|
| Semua endpoint API aplikasi ini didefinisikan di sini.
| Middleware Sanctum digunakan untuk autentikasi satker.
|
*/

// ✅ Default route user bawaan Sanctum
Route::middleware('auth:sanctum')->get('/user', function (Request $request) {
    return $request->user();
})->name('api.user');

// ======================
// 🔐 AUTH SECTION
// ======================
Route::post('/login-satker', [AuthController::class, 'apiLoginSatker'])
    ->name('api.login.satker');
Route::post('/logout-satker', [AuthController::class, 'apiLogoutSatker'])
    ->middleware('auth:sanctum')
    ->name('api.logout.satker');

// ======================
// 📦 PROTECTED ROUTES (Require Token)
// ======================
Route::middleware('auth:sanctum')->group(function () {

    // ======================
    // 🧑‍💼 USER (SESSION)
    // ======================
    Route::get('/me', [UserController::class, 'apiMe'])->name('api.me'); // ✅ endpoint user login info

    // ======================
    // 🏢 DATA SATKER
    // ======================
    Route::get('/datasatker', [DatasatkerController::class, 'apiIndex'])->name('api.satker.index');
    Route::post('/datasatker', [DatasatkerController::class, 'apiStore'])->name('api.satker.store');
    Route::put('/datasatker/{id}', [DatasatkerController::class, 'apiUpdate'])->name('api.satker.update');
    Route::delete('/datasatker/{id}', [DatasatkerController::class, 'apiDestroy'])->name('api.satker.destroy');

    // Route tambahan untuk satker list (tanpa pagination)
    Route::get('/satker', [DatasatkerController::class, 'apiList'])->name('api.satker.list');


    // ======================
    // 📰 BERITA
    // ======================
    Route::get('/berita', [BeritaController::class, 'apiIndex'])->name('api.berita.index');
    Route::post('/berita', [BeritaController::class, 'apiStore'])->name('api.berita.store');
    Route::match(['put', 'post'], '/berita/{id}', [BeritaController::class, 'apiUpdate'])->name('api.berita.update');
    Route::match(['delete', 'post'], '/berita/{id}', [BeritaController::class, 'apiDestroy'])->name('api.berita.destroy');

    // ======================
    // 📻 MEDIA PARTNER
    // ======================
    Route::get('/mediapartner', [MediapartnerController::class, 'apiIndex'])->name('api.media.index');

    // ======================
    // 🧭 DIVISI
    // ======================
    Route::get('/divisi', [DivisiController::class, 'apiIndex'])->name('api.divisi.index');

    // ======================
    // ⚡ PRIORITAS
    // ======================
    Route::get('/prioritas', [PrioritasController::class, 'apiIndex'])->name('api.prioritas.index');

    // ======================
// ⚙️ KONFIGURASI BERITA
// ======================
    Route::get('/konfigurasi-berita', [KonfigurasiBeritaController::class, 'apiIndex'])
        ->name('api.konfigurasi.berita.index');

});
