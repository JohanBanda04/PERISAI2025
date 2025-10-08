<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;

use Illuminate\Contracts\Auth\MustVerifyEmail;
use Illuminate\Foundation\Auth\User as Authenticatable;
use Illuminate\Notifications\Notifiable;
use Laravel\Sanctum\HasApiTokens;

class Prioritas extends Authenticatable
{
    use HasApiTokens, HasFactory, Notifiable;

    protected $table="tbl_prioritas";
    protected $primaryKey="id_prioritas";

    protected $guarded = [
        'id_prioritas',
    ];


    public function berita(){
        return $this->hasMany(Berita::class,'prioritas_id','id_prioritas');
    }


}
