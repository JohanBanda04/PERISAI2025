<?php

namespace App\Http\Controllers;

use App\Models\Konfigberita;
use Illuminate\Http\Request;
use App\Models\KonfigurasiBerita;

class KonfigurasiBeritaController extends Controller
{
    /**
     * Ambil semua konfigurasi berita.
     */
    public function apiIndex(Request $request)
    {
        try {
            $query = Konfigberita::select(
                'id_konfig',
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
                'nama_kakanwil'
            );

            // Filter optional by kode_satker
            if ($request->has('kode_satker')) {
                $query->where('kode_satker', $request->kode_satker);
            }

            $data = $query->orderBy('tgl_update', 'desc')->get();

            return response()->json([
                'success' => true,
                'message' => 'Data konfigurasi berita berhasil dimuat',
                'data' => $data,
            ], 200);

        } catch (\Exception $e) {
            return response()->json([
                'success' => false,
                'message' => 'Gagal memuat data konfigurasi berita: ' . $e->getMessage(),
                'data' => []
            ], 500);
        }
    }
}
