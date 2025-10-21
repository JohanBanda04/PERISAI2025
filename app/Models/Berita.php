<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;

class Berita extends Model
{
    use HasFactory;

    protected $table = "berita";
    protected $primaryKey = "id_berita";

    protected $guarded = ['id_berita'];

    // pastikan kolom JSON otomatis didecode
    protected $casts = [
        'media_lokal' => 'array',
        'media_nasional' => 'array',
        'tgl_input' => 'datetime',
        'tgl_update' => 'datetime',
    ];

    // relasi ke tabel satker
    public function satker()
    {
        return $this->belongsTo(Satker::class, 'kode_satker', 'kode_satker');
    }

    // relasi ke tabel prioritas
    public function prioritas()
    {
        return $this->belongsTo(Prioritas::class, 'prioritas_id', 'id_prioritas');
    }

    public function divisi(){
        return $this->belongsTo(Divisi::class,'kode_divisi','kode_divisi');
    }
}
