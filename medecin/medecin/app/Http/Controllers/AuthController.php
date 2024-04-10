<?php

namespace App\Http\Controllers;

use App\Http\Resources\User as ResourcesUser;
use App\Models\Docter;
use Illuminate\Http\Request;
use App\Models\User;
use Carbon\Carbon;
use Illuminate\Support\Facades\Auth;

class AuthController extends Controller
{
    public function signup_patient(Request $request)
    {
        $request->validate(
            [
                'name' => 'required',
                'dateNaissance' => 'required',
                'ip' => 'required',
                'role' => 'required',
                'password' => 'required|min:5',
                'sexe' => 'required',
            ]
        );

        $patient = new User([
            'name' => $request->name,
            'dateNaissance' => $request->dateNaissance,
            'ip' => $request->ip,
            'role' => $request->role,
            'password' => bcrypt($request->password),
            'sexe' => $request->sexe,
        ]);

        if ($patient->save()) {
            return response()->json([
                'patient' => new ResourcesUser($patient),
                'sucsses' => true,
                'message' => 'Successfully created patient!'
            ], 201);
        }
    }

    public function signup_docter(Request $request)
    {
        $request->validate(
            [
                'email' => 'required|email',
                'name' => 'required',
                'role' => 'required',
                'password' => 'required'
                
            ]
        );

        $docter = new User([
            'name' => $request->name,
            'email' => $request->email,
            'role' => $request->role,
            'password' => bcrypt($request->password)
        ]);

        if ($docter->save()) {
            return response()->json([
                'docter' => new ResourcesUser($docter),
                'sucsses' => true,
                'message' => 'Successfully created docter!'
            ], 201);
        }
    }

    public function login_patient(Request $request)
    {
        $request->validate([
            'ip' => 'required',
            'password' => 'required|min:5',
        ]);

        $credentials = $request->only('ip', 'password');
        if (!Auth::attempt($credentials))
            return response()->json([
                'message' => 'Unauthorized',
                'success'=> false
            ], 401);

        $user = auth()->user();
        $token =  $user->createToken('my-app-token')->plainTextToken;
        $user->remember_token = $token;
        $user->save();
        
        return response()->json([
            'token' => $token,
            'name'=>$user->name,
            'ip' => $user->ip,
            'dateNaissance' => $user->dateNaissance,
            'protocol' => $user->protocol,
            'cure' => $user->dateDernierCure,
            'success' => true, 
            'message' => 'logged in with success'
        ]);
    }

    public function login_docter(Request $request)
    {
        $request->validate([
            'email' => 'required',
            'password' => 'required',
        ]);
        $credentials = $request->only('email', 'password');
        if (!Auth::attempt($credentials))
            return response()->json([
                'message' => 'Unauthorized'
            ], 401);

        $docter = auth()->user();
        $token =  $docter->createToken('my-app-token')->plainTextToken;
        $docter->remember_token = $token;
        $docter->save();

        return response()->json([
        'token' => $token,
        'docter' => new ResourcesUser($docter),
        'success' => true,
        'status' => true, 
        'message' => 'logged in with success'
    ], 200);
    }

    public function login_assistant(Request $request)
    {
        // dd($request->email);
        $request->validate([
            'email' => 'required',
            'password' => 'required|min:5',
        ]);
        $credentials = $request->only('email', 'password');
        if (!Auth::attempt($credentials))
            return response()->json([
                'message' => 'Unauthorized',
                'success' => false,
            ], 401);

        $assistant = auth()->user();
        $token =  $assistant->createToken('my-app-token')->plainTextToken;
        $assistant->remember_token = $token;
        $assistant->save();

        return response()->json([
            'token' => $token,
         'assistant' => new ResourcesUser($assistant), 'success' => true, 'message' => 'logged in with success'], 200);
    }





    public function logout()
    {
        $user = auth()->user();
        if ($user->tokens()->delete()) {
            return response()->json(['data' => [], 'status' => true, 'message' => 'logged Out with success'], 200);
        } else {
            return response()->json(['data' => [], 'status' => true, 'message' => 'Somthings wrong !'], 422);
        }
    }


    public function docters()
    {
        $users = User::all()->where('role', 'docter');

        return ResourcesUser::collection($users);
    }

    public function patients()
    {
        $users = User::all()->where('role', 'patient');

        return ResourcesUser::collection($users);
    }

    public function patients_assistant()
    {
        $users = User::all()->where('role', 'patient');

        return ResourcesUser::collection($users);
    }
    public function currentUser(Request $request) {
        return $request->user();
    }
}
