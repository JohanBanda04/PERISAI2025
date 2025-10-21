<?php

namespace App\Http\Controllers;

use App\Models\Prioritas;
use Illuminate\Http\Request;

class PrioritasController extends Controller
{
    /**
     * 🔹 API: Ambil semua data prioritas berita
     * Endpoint: GET /api/prioritas
     */
    public function apiIndex()
    {
        try {
            // Ambil semua data prioritas dari tabel tbl_prioritas
            $prioritas = Prioritas::select(
                'id_prioritas',
                'nama_prioritas_lengkap',
                'nama_prioritas',
                'skala_prioritas'
            )
                ->orderBy('skala_prioritas', 'asc')
                ->get();

            // Jika data kosong
            if ($prioritas->isEmpty()) {
                return response()->json([
                    'success' => true,
                    'message' => 'Tidak ada data prioritas ditemukan',
                    'data' => []
                ], 200);
            }

            // Kembalikan response JSON untuk Flutter
            return response()->json([
                'success' => true,
                'message' => 'Data prioritas berhasil dimuat',
                'data' => $prioritas
            ], 200);

        } catch (\Exception $e) {
            // Tangani error dengan response JSON
            return response()->json([
                'success' => false,
                'message' => 'Gagal memuat data prioritas: ' . $e->getMessage(),
                'data' => []
            ], 500);
        }
    }
}
