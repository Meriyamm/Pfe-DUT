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
    public function signup(Request $request)
    {
        $request->validate(
            [
                'name' => 'required',
                'dateNaissance' => 'required',
                'ip' => 'required',
                'password' => 'required|min:5'
            ]
        );

        $patient = new User([
            'name' => $request->name,
            'dateNaissance' => $request->dateNaissance,
            'ip' => $request->ip,
            'password' => bcrypt($request->password)
        ]);

        if ($patient->save()) {
            return response()->json([
                'data' => [
                    $patient
                ],
                'sucsses' => true,
                'message' => 'Successfully created user!'
            ], 201);
        }
    }

    public function login(Request $request)
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
        // return response()->json(['data' => [
        //     'token' => $token,
        // ], 'user' => $user, 'status' => true, 'message' => 'logged in with success'], 200);
    }






    public function logout(Request $request)
    {
        $user = auth()->user();
        if ($user->tokens()->delete()) {
            return response()->json(['data' => [], 'status' => true, 'message' => 'logged Out with success'], 200);
        } else {
            return response()->json(['data' => [], 'status' => true, 'message' => 'Somthings wrong !'], 422);
        }
    }


    public function users()
    {
        $users = User::all();

        return ResourcesUser::collection($users);
    }
}
