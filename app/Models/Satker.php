<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;

use Illuminate\Contracts\Auth\MustVerifyEmail;
use Illuminate\Foundation\Auth\User as Authenticatable;
use Illuminate\Notifications\Notifiable;
use Laravel\Sanctum\HasApiTokens;

class Satker extends Authenticatable
{
    use HasApiTokens, HasFactory, Notifiable;

    protected $table = "satker";
    protected $primaryKey = "id";

    protected $fillable = [
        'name',
        'username',
        'kode_satker',
        'email',
        'password',
        'no_hp',
        'roles',
        'konfigurasi_berita',
        'konfigurasi_rekap',
        'foto',
    ];


    protected $hidden = [
        'password',
        'remember_token',
    ];


    protected $casts = [
        'email_verified_at' => 'datetime',
    ];
}
