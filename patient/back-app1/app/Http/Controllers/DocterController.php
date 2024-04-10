<?php

namespace App\Http\Controllers;

use App\Models\Docter;

use App\Http\Requests\DocterRequest;
use Illuminate\Support\Facades\Auth;
use Illuminate\Http\Request;

class DocterController extends Controller
{
    /**
     * Display a listing of the resource.
     *
     * @return \Illuminate\Http\Response
     */
    public function signup(Request $request)
    {
        $request->validate(
            [
                'name' => 'required',
                'email' => 'required',
                'password' => 'required|min:5'
            ]
        );

        $docter = new Docter([
            'name' => $request->name,
            'email' => $request->email,
            'password' => bcrypt($request->password)
        ]);

        if ($docter->save()) {
            return response()->json([
                'docter' => [
                    $docter
                ],
                'sucsses' => true,
                'message' => 'Successfully created user!'
            ], 201);
        }
    }




    /**
     * Show the form for creating a new resource.
     *
     * @return \Illuminate\Http\Response
     */
    public function login(Request $request)
    {
        $request->validate([
            'ip' => 'required',
            'password' => 'required|min:5',
        ]);

        $credentials = $request->only('ip', 'password');
        if (!Auth::attempt($credentials))
            return response()->json([
                'message' => 'Unauthorized'
            ], 401);

        $user = auth()->docter();
        $token =  $user->createToken('my-app-token')->plainTextToken;
        $user->remember_token = $token;
        $user->save();

        return response()->json(['data' => [
            'token' => $token,
        ], 'user' => $user, 'status' => true, 'message' => 'logged in with success'], 200);
    }
    /**
     * Store a newly created resource in storage.
     *
     * @param  \App\Http\Requests\StoreDocterRequest  $request
     * @return \Illuminate\Http\Response
     */
    public function store(StoreDocterRequest $request)
    {
        //
    }

    /**
     * Display the specified resource.
     *
     * @param  \App\Models\Docter  $docter
     * @return \Illuminate\Http\Response
     */
    public function show(Docter $docter)
    {
        //
    }

    /**
     * Show the form for editing the specified resource.
     *
     * @param  \App\Models\Docter  $docter
     * @return \Illuminate\Http\Response
     */
    public function edit(Docter $docter)
    {
        //
    }

    /**
     * Update the specified resource in storage.
     *
     * @param  \App\Http\Requests\UpdateDocterRequest  $request
     * @param  \App\Models\Docter  $docter
     * @return \Illuminate\Http\Response
     */
    public function update(UpdateDocterRequest $request, Docter $docter)
    {
        //
    }

    /**
     * Remove the specified resource from storage.
     *
     * @param  \App\Models\Docter  $docter
     * @return \Illuminate\Http\Response
     */
    public function destroy(Docter $docter)
    {
        //
    }
}
