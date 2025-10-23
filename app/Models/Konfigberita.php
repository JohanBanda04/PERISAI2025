<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;

class Konfigberita extends Model
{
    use HasFactory;

    protected $table = 'konfigurasi_berita';
    protected $primaryKey = 'id_konfig';
    public $timestamps = false;

    protected $fillable = [
        'name_config',
        'kode_satker',
        'salam_pembuka',
        'yth',
        'jumlah_tembusan_yth',
        'dari_pengirim',
        'pengantar',
        'jumlah_hashtag',
        'jargon',
        'jumlah_moto',
        'penutup',
        'salam_penutup',
        'jenis_konfig',
        'tgl_input',
        'tgl_update',
        'ttd_kakanwil',
        'nama_kakanwil',
    ];

    public function satker(){
        return $this->belongsTo(Satker::class,'kode_satker','kode_satker');
    }
}
