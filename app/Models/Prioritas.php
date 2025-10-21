<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;

class Prioritas extends Model
{
    use HasFactory;

    protected $table = "tbl_prioritas";
    protected $primaryKey = "id_prioritas";

    protected $guarded = ['id_prioritas'];

    /**
     * 🔹 Relasi ke tabel Berita
     * Setiap prioritas bisa punya banyak berita
     */
    public function berita()
    {
        return $this->hasMany(Berita::class, 'prioritas_id', 'id_prioritas');
    }
}
