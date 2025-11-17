<?php

namespace App\Http\Middleware;

use App\Providers\RouteServiceProvider;
use Closure;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\Auth;

class RedirectIfAuthenticated
{
    /**
     * Handle an incoming request.
     *
     * @param  \Illuminate\Http\Request  $request
     * @param  \Closure(\Illuminate\Http\Request): (\Illuminate\Http\Response|\Illuminate\Http\RedirectResponse)  $next
     * @param  string|null  ...$guards
     * @return \Illuminate\Http\Response|\Illuminate\Http\RedirectResponse
     */
    public function handle(Request $request, Closure $next, ...$guards)
    {
        $guards = empty($guards) ? [null] : $guards;
        //dd($guards);
        //echo "hey";die;
        //echo Auth::guard('satker')->check(); die;
        foreach ($guards as $guard) {
           // echo "<pre>"; print_r($guard);
            if (Auth::guard('karyawan')->check()) {
                return redirect(RouteServiceProvider::HOME);
            }

            if (Auth::guard('user')->check()) {
                return redirect(RouteServiceProvider::HOMEADMIN);
            }

            if(Auth::guard('satker')->check()){
                //return redirect(RouteServiceProvider::HOMESATKER);
                return redirect()->route('dashboardsatker');
            }
        }
        //die;

        return $next($request);
    }
}
