<?php

namespace App\Http\Controllers;

use App\Models\Berita;
use App\Models\Prioritas;
use Illuminate\Validation\ValidationException;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\DB;

class BeritaController extends Controller
{
    public function apiIndex(Request $request)
    {
        /**
         * API: Ambil data berita per satker dengan filter & role access
         */
        try {
            $user = auth()->user();
            if (!$user) {
                return response()->json([
                    'success' => false,
                    'message' => 'User tidak terautentikasi',
                ], 401);
            }

            $query = Berita::query();

            /** 🔒 Batasi data sesuai role */
            if ($user->roles === 'superadmin') {
                // superadmin bisa lihat semua
            } elseif (in_array($user->roles, ['humas_satker', 'humas_kanwil'])) {
                $query->where('kode_satker', $user->kode_satker);
            } else {
                return response()->json([
                    'success' => false,
                    'message' => 'Akses ditolak',
                ], 403);
            }

            /** 🔍 Filter berdasarkan parameter request */
            if ($request->filled('nama_berita')) {
                $query->where('nama_berita', 'LIKE', '%' . $request->nama_berita . '%');
            }

            if ($request->filled('kode_divisi') && $request->kode_divisi !== 'all_berita') {
                $query->where('kode_divisi', $request->kode_divisi);
            }

            if ($request->filled('dari') && $request->filled('sampai')) {
                $query->whereBetween('tgl_input', [$request->dari, $request->sampai]);
            }

            /** Urutkan & paginasi */
            $query->orderBy('id_berita', 'desc');
            $berita = $query->paginate(10);

            /** 🔗 Ambil data referensi */
            $dataPrioritas = Prioritas::orderBy('skala_prioritas', 'asc')->get();
            $getMedia = DB::table('mediapartner')
                ->where('kode_satker_penjalin', $user->kode_satker)
                ->get();
            $getDivisi = DB::table('divisi')->get();

            /** Kembalikan response */
            return response()->json([
                'success' => true,
                'message' => 'Data berita berhasil diperoleh',
                'filters' => [
                    'nama_berita' => $request->nama_berita,
                    'kode_divisi' => $request->kode_divisi,
                    'periode' => [$request->dari, $request->sampai],
                ],
                'data' => $berita->items(),
                'pagination' => [
                    'current_page' => $berita->currentPage(),
                    'last_page' => $berita->lastPage(),
                    'total' => $berita->total(),
                ],
                'media_partner' => $getMedia,
                'divisi' => $getDivisi,
                'prioritas' => $dataPrioritas,
            ], 200);

        } catch (\Exception $e) {
            return response()->json([
                'success' => false,
                'message' => 'Terjadi kesalahan: ' . $e->getMessage(),
            ], 500);
        }
    }

    /**
     * API: Simpan berita baru
     */
    public function apiStore(Request $request)
    {
        try {
            $validated = $request->validate([
                'nama_berita' => 'required|string',
                'kode_satker' => 'required|string',
                'kode_divisi' => 'required|string',
                'prioritas_id' => 'required|integer',
            ]);

            $berita = new Berita();
            $berita->nama_berita = $request->nama_berita;
            $berita->kode_satker = $request->kode_satker;
            $berita->kode_divisi = $request->kode_divisi;
            $berita->prioritas_id = $request->prioritas_id;
            $berita->facebook = $request->facebook ?? '-';
            $berita->website = $request->website ?? '-';
            $berita->instagram = $request->instagram ?? '-';
            $berita->twitter = $request->twitter ?? '-';
            $berita->tiktok = $request->tiktok ?? '-';
            $berita->sippn = $request->sippn ?? '-';
            $berita->youtube = $request->youtube ?? '-';

            // Simpan media_lokal & media_nasional TANPA json_encode manual
            // biarkan Laravel casts otomatis menyimpan sebagai JSON
            $berita->media_lokal = $this->normalizeMediaInput($request->media_lokal);
            $berita->media_nasional = $this->normalizeMediaInput($request->media_nasional);

            $berita->tgl_input = now();
            $berita->tgl_update = now();
            //return "hey bro";
            $berita->save();



            return response()->json([
                'success' => true,
                'message' => 'Data berita berhasil disimpan',
                'data' => $berita,
            ], 201);

        } catch (ValidationException $e) {
            return response()->json([
                'success' => false,
                'message' => 'Validasi gagal',
                'errors' => $e->errors(),
            ], 422);
        } catch (\Exception $e) {
            return response()->json([
                'success' => false,
                'message' => 'Terjadi kesalahan: ' . $e->getMessage(),
            ], 500);
        }
    }

    /**
     * Fungsi bantu agar input media fleksibel (array/string)
     */
    private function normalizeMediaInput($value)
    {
        if (empty($value)) {
            return [];
        }

        // Kalau string JSON → decode
        if (is_string($value)) {
            $decoded = json_decode($value, true);
            if (json_last_error() === JSON_ERROR_NONE && is_array($decoded)) {
                return $decoded;
            }
            // Kalau cuma string biasa → jadikan array tunggal
            return [$value];
        }

        // Kalau array langsung → kembalikan saja
        if (is_array($value)) {
            return $value;
        }

        return [];
    }


    /**
     * API: Update berita
     */
    public function apiUpdate(Request $request, $id)
    {
        try {
            $berita = Berita::find($id);

            if (!$berita) {
                return response()->json([
                    'success' => false,
                    'message' => 'Data berita tidak ditemukan',
                ], 404);
            }

            // ✅ Validasi dinamis hanya untuk field yang dikirim
            $rules = [
                'nama_berita'   => 'string',
                'kode_divisi'   => 'string',
                'prioritas_id'  => 'integer',
                'facebook'      => 'nullable|string',
                'website'       => 'nullable|string',
                'instagram'     => 'nullable|string',
                'twitter'       => 'nullable|string',
                'tiktok'        => 'nullable|string',
                'sippn'         => 'nullable|string',
                'youtube'       => 'nullable|string',
            ];

            $validated = $request->validate(
                collect($rules)
                    ->only(array_keys($request->all())) // hanya validasi field yang dikirim
                    ->toArray()
            );

            // 🚀 Update otomatis semua field valid
            $berita->fill($validated);

            // 🧩 Tangani media lokal & nasional
            foreach (['media_lokal', 'media_nasional'] as $field) {
                if ($request->has($field)) {
                    $berita->$field = $this->normalizeMediaInput($request->$field);
                }
            }

            $berita->tgl_update = now();
            $berita->save();
            $berita->refresh(); // ✅ tambahkan ini

            return response()->json([
                'success' => true,
                'message' => 'Data berita berhasil diperbarui',
                'data' => $berita,
            ]);


        } catch (ValidationException $e) {
            return response()->json([
                'success' => false,
                'message' => 'Validasi gagal',
                'errors' => $e->errors(),
            ], 422);
        } catch (\Throwable $e) {
            return response()->json([
                'success' => false,
                'message' => 'Terjadi kesalahan: ' . $e->getMessage(),
            ], 500);
        }
    }



    /**
     * API: Hapus berita
     */
    public function apiDestroy($id)
    {
        try {
            $berita = Berita::find($id);
            if (!$berita) {
                return response()->json([
                    'success' => false,
                    'message' => 'Data berita tidak ditemukan',
                ], 404);
            }

            $berita->delete();

            return response()->json([
                'success' => true,
                'message' => 'Data berita berhasil dihapus',
            ]);
        } catch (\Exception $e) {
            return response()->json([
                'success' => false,
                'message' => 'Terjadi kesalahan: ' . $e->getMessage(),
            ], 500);
        }
    }
}
