<?php

use App\Http\Controllers\AuthController;
use App\Http\Controllers\BeritaController;
use App\Http\Controllers\DatasatkerController;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\Route;

/*
|--------------------------------------------------------------------------
| API Routes
|--------------------------------------------------------------------------
|
| Here is where you can register API routes for your application. These
| routes are loaded by the RouteServiceProvider within a group which
| is assigned the "api" middleware group. Enjoy building your API!
|
*/

Route::middleware('auth:sanctum')->get('/user', function (Request $request) {
    return $request->user();
})->name('api.user');

// Auth Routes
Route::post('/login-satker', [AuthController::class, 'apiLoginSatker'])
    ->name('api.login.satker');
Route::post('/logout-satker', [AuthController::class, 'apiLogoutSatker'])
    ->middleware('auth:sanctum')
    ->name('api.logout.satker');

// CRUD Satker
Route::middleware('auth:sanctum')->group(function () {
    Route::get('/datasatker', [DatasatkerController::class, 'apiIndex'])->name('api.satker.index');
    Route::post('/datasatker', [DatasatkerController::class, 'apiStore'])->name('api.satker.store');
    Route::put('/datasatker/{id}', [DatasatkerController::class, 'apiUpdate'])->name('api.satker.update');
    Route::delete('/datasatker/{id}', [DatasatkerController::class, 'apiDestroy'])->name('api.satker.destroy');

    /*data berita*/
    Route::get('/berita',[BeritaController::class,'apiIndex'])->name('api.berita.index');
    Route::post('/berita',[BeritaController::class,'apiStore'])->name('api.berita.store');
    Route::put('/berita/{id}',[BeritaController::class,'apiUpdate'])->name('api.berita.update');
    Route::delete('/berita/{id}',[BeritaController::class,'apiDestroy'])->name('api.berita.destroy');
});




