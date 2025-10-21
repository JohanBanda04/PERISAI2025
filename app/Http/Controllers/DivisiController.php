<?php

namespace App\Http\Controllers;

use App\Models\Divisi;
use Illuminate\Http\Request;

class DivisiController extends Controller
{
    /**
     * 🔹 API: Ambil semua data divisi + tambahan "berita_umum"
     * Endpoint: GET /api/divisi
     */
    public function apiIndex()
    {
        try {
            // Ambil semua data dari tabel divisi
            $divisi = Divisi::select('id_divisi', 'kode_divisi', 'nama_divisi')
                ->orderBy('nama_divisi', 'asc')
                ->get()
                ->toArray();

            // Tambahkan kategori "Berita Umum" secara manual di urutan pertama
            $divisi_umum = [
                'id_divisi'   => 0,
                'kode_divisi' => 'berita_umum',
                'nama_divisi' => 'Berita Umum',
            ];

            array_unshift($divisi, $divisi_umum);

            // Kembalikan response JSON untuk Flutter
            return response()->json([
                'success' => true,
                'message' => 'Data divisi berhasil dimuat',
                'data' => $divisi
            ], 200);

        } catch (\Exception $e) {
            // Tangani error dengan response JSON
            return response()->json([
                'success' => false,
                'message' => 'Gagal memuat data divisi: ' . $e->getMessage(),
                'data' => []
            ], 500);
        }
    }
}
