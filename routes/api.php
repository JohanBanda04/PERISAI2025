<?php

use App\Http\Controllers\AuthController;
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
});

//Route::post('/login-satker',[AuthController::class,'apiLoginSatker']);
Route::post('/login-satker', [AuthController::class, 'apiLoginSatker']);
Route::middleware('auth:sanctum')->get('/datasatker', [DatasatkerController::class, 'apiIndex']);




