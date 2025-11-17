<?php

namespace App\Http\Controllers;

use App\Models\Satker;
use App\Models\User;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\Auth;
use Illuminate\Support\Facades\Hash;

class AuthController extends Controller
{
    public function apiLoginSatker(Request $request)
    {
        $request->validate([
            'kode_satker' => 'required|string',
            'password' => 'required|string',
            'role_user' => 'required|string',
        ]);

        $satker = Satker::where('kode_satker', $request->kode_satker)
            ->where('roles', $request->role_user)
            ->first();

        if (!$satker || !Hash::check($request->password, $satker->password)) {
            return response()->json([
                'success' => false,
                'message' => 'Kode satker atau password salah.'
            ], 401);
        }

        $token = $satker->createToken('satker_app_token')->plainTextToken;

        return response()->json([
            'success' => true,
            'message' => 'Login berhasil.',
            'data' => [
                'satker' => $satker,
                'token' => $token
            ]
        ]);
    }
    public function apiLogoutSatker(Request $request){
        try{
        // Cek apakah user sudah login dengan token
            if($request->user()){
                // Hapus token yang digunakan untuk autentikasi sekarang
                $request->user()->currentAccessToken()->delete();
                return response()->json([
                    'success' => true,
                    'message' => 'Logout berhasil.',
                ], 200);
            } else {
                return response()->json([
                    'success' => false,
                    'message' => 'Tidak ada pengguna yang sedang login.',
                ], 401);
            }
        }catch (\Exception $e){
            return response()->json([
                'success'=>false,
                'message'=>'Terjadi kesalahan saat logout :'.$e->getMessage(),
            ],500);
        }
    }


    public function proseslogin(Request $request){
        //dd($request->nik." - ".$request->password);
        $pass = Hash::make($request->password);
        //dd($pass);

        if(Auth::guard('karyawan')->attempt(['nik'=>$request->nik,'password'=>$request->password])){
            return redirect('/dashboard');
        } else {
            return redirect('/')->with(['warning'=>'Nik / Password Salah!']);
        }
    }

    public function proseslogout(){
        if(Auth::guard('karyawan')->check()){
            Auth::guard('karyawan')->logout();
            return redirect('/');
        }


    }

    public function proseslogoutadmin(){
        if(Auth::guard('user')->check()){
            Auth::guard('user')->logout();
            return redirect('/panel');
        }

    }
    public function proseslogoutsatker(){
        //echo "proseslogoutsatker"; die;
        if(Auth::guard('satker')->check()){
            Auth::guard('satker')->logout();
            //return redirect('/');
            return redirect()->route('landing');
        }

    }






    public function prosesloginadmin(Request $request){
        //echo "die"; die;
        //dd($request);
        $pass = Hash::make($request->password);
        //dd($pass);
        //dd($request->email." - ".$request->password);
        if(Auth::guard('user')->attempt(
            [
                'email'=>$request->email,'password'=>$request->password
            ]))
        {
            return redirect('/panel/dashboardadmin');
        } else {
            return redirect('/panel')->with(['warning'=>'Username atau Password Salah!']);
        }
    }



    public function prosesloginsatker(Request $request){
        //return "hay";
        //dd($request->nik." - ".$request->password);
        $request->validate([
            'kode_satker'=>'required',
            'password'=>'required',
            'g-recaptcha-response'=>'required|captcha'
        ],[
            'kode_satker.required' => 'Anda Belum Mengisi Kode Satker',
            'password.required' => 'Anda Belum Mengisi Password',
            'g-recaptcha-response.required' => 'Verifikasi Captcha ',
        ]);
        $pass = Hash::make($request->password);
        //dd($pass);

        if(Auth::guard('satker')->attempt(['kode_satker'=>$request->kode_satker,'password'=>$request->password,'roles'=>$request->role_user])){
            return redirect()->route('dashboardsatker');
        } else {
            return redirect()->route('loginsatker')->with(['warning'=>'Kode User / Password Tidak Ditemukan']);
        }
    }
}
