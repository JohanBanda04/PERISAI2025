<?php

namespace App\Http\Controllers;

use App\Models\Konfigberita;
use Illuminate\Http\Request;
use App\Models\KonfigurasiBerita;
use Illuminate\Support\Facades\Validator;

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

    /**
     * 👀 Ambil satu data konfigurasi
     */
    public function apiShow($id_konfig)
    {
        $data = Konfigberita::find($id_konfig);
        if (!$data) {
            return response()->json([
                'success' => false,
                'message' => 'Data tidak ditemukan',
            ], 404);
        }
        return response()->json(['success' => true, 'data' => $data]);
    }

    /**
     * 🆕 Tambah data baru
     */
    public function apiStore(Request $request)
    {
        $validator = Validator::make($request->all(), [
            'name_config' => 'required|string|max:255',
            'kode_satker' => 'required|string|max:50',
            'jenis_konfig' => 'required|string|max:50',
        ]);

        if ($validator->fails()) {
            return response()->json([
                'success' => false,
                'message' => 'Validasi gagal',
                'errors' => $validator->errors(),
            ], 422);
        }

        try {
            $data = Konfigberita::create([
                'name_config' => $request->name_config,
                'kode_satker' => $request->kode_satker,
                'salam_pembuka' => $request->salam_pembuka,
                'yth' => $request->yth,
                'jumlah_tembusan_yth' => $request->jumlah_tembusan_yth,
                'dari_pengirim' => $request->dari_pengirim,
                'pengantar' => $request->pengantar,
                'jumlah_hashtag' => $request->jumlah_hashtag,
                'jargon' => $request->jargon,
                'jumlah_moto' => $request->jumlah_moto,
                'penutup' => $request->penutup,
                'salam_penutup' => $request->salam_penutup,
                'jenis_konfig' => $request->jenis_konfig,
                'tgl_input' => now(),
                'tgl_update' => now(),
                'ttd_kakanwil' => $request->ttd_kakanwil,
                'nama_kakanwil' => $request->nama_kakanwil,
            ]);

            return response()->json([
                'success' => true,
                'message' => 'Konfigurasi berita berhasil ditambahkan',
                'data' => $data,
            ], 201);
        } catch (\Exception $e) {
            return response()->json([
                'success' => false,
                'message' => 'Gagal menambah data: ' . $e->getMessage(),
            ], 500);
        }
    }

    /**
     * ✏️ Update konfigurasi
     */

    public function apiUpdate(Request $request, $id_konfig)
    {
        $data = Konfigberita::find($id_konfig);
        if (!$data) {
            return response()->json([
                'success' => false,
                'message' => 'Data tidak ditemukan',
            ], 404);
        }

        try {
            $data->update(array_merge(
                $request->all(),
                ['tgl_update' => now()]
            ));

            return response()->json([
                'success' => true,
                'message' => 'Konfigurasi berhasil diperbarui',
                'data' => $data,
            ]);
        } catch (\Exception $e) {
            return response()->json([
                'success' => false,
                'message' => 'Gagal memperbarui data: ' . $e->getMessage(),
            ], 500);
        }
    }

    /**
     * 🗑️ Hapus konfigurasi
     */
    public function apiDestroy($id_konfig)
    {
        $data = Konfigberita::find($id_konfig);
        if (!$data) {
            return response()->json([
                'success' => false,
                'message' => 'Data tidak ditemukan',
            ], 404);
        }

        try {
            $data->delete();
            return response()->json([
                'success' => true,
                'message' => 'Data konfigurasi berhasil dihapus',
            ]);
        } catch (\Exception $e) {
            return response()->json([
                'success' => false,
                'message' => 'Gagal menghapus data: ' . $e->getMessage(),
            ], 500);
        }
    }

    public function getNextKode()
    {
        $last = Konfigberita::orderBy('id_konfig', 'desc')->first();
        $next = $last ? $last->id_konfig + 1 : 1;
        return response()->json([
            'success' => true,
            'next_kode' => 'KONF-' . str_pad($next, 3, '0', STR_PAD_LEFT),
        ]);
    }
}
