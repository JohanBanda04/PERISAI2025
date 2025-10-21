<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;

class Divisi extends Model
{
    use HasFactory;

    protected $table = 'divisi';
    protected $primaryKey = 'id_divisi';
    public $timestamps = true;

    protected $fillable = [
        'kode_divisi',
        'nama_divisi',
    ];

    /**
     * 🔹 Relasi ke model Berita
     * Satu divisi bisa memiliki banyak berita
     * Relasi berdasarkan kolom kode_divisi
     */
    public function berita()
    {
        return $this->hasMany(Berita::class, 'kode_divisi', 'kode_divisi');
    }
}
