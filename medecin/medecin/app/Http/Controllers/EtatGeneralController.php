<?php

namespace App\Http\Controllers;

use App\Http\Requests\EtatGeneralRequest;
use App\Models\EtatGeneral;
use Illuminate\Http\Request;
use App\Http\Resources\EtatGeneral as EtatGeneralResources;
use App\Http\Resources\User as UserResources;

class EtatGeneralController extends Controller
{
    /**
     * Display a listing of the resource.
     *
     * @return \Illuminate\Http\Response
     */
    public function index()
    {
        // return EtatGeneralResources::collection(EtatGeneral::all());
        $etatgeneral = auth()->user()->etatgeneral()->get();
        $user = auth()->user();

        return response()->json(
            [
                'data' => [
                    'etatgeneral' => EtatGeneralResources::collection($etatgeneral),
                ],
                'user' => new UserResources($user),
                'sucsses' => true,
                'message' => 'your generals etat list ',

            ],
            200
        );
    }

    /**
     * Store a newly created resource in storage.
     *
     * @param  \Illuminate\Http\Request  $request
     * @return \Illuminate\Http\Response
     */
    public function store(EtatGeneralRequest $request)
    {

        $etatgeneral = auth()->user()->etatgeneral()->create($request->all());
        if ($etatgeneral) {
            return response()->json(
                [
                    [
                        'data' => new EtatGeneralResources($etatgeneral),
                        'user' => new UserResources($etatgeneral->user)
                    ],
                    'status' => 'success',
                    'message' => 'Etat general added with success'
                ],
                201
            );
        }
    }

    /**
     * Display the specified resource.
     *
     * @param  int  $id
     * @return \Illuminate\Http\Response
     */
    public function show($id)
    {
        $etatgeneral =  auth()->user()->etatgeneral()->findOrFail($id);
        if ($etatgeneral)
            return new EtatGeneralResources($etatgeneral);
        else
            return [
                'data' => [],
                'message' => 'this is not yours'
            ];
    }

    /**
     * Update the specified resource in storage.
     *
     * @param  \Illuminate\Http\Request  $request
     * @param  int  $id
     * @return \Illuminate\Http\Response
     */
    public function update(EtatGeneralRequest $request, EtatGeneral $etatgeneral)
    {
        $etatgeneral =  auth()->user()->etatgeneral()->findOrFail($etatgeneral->id);

        // dd($post);
        if ($etatgeneral->update($request->all())) {
            return response()->json(
                [
                    'data' => [
                        'etatgeneral' => new EtatGeneralResources($etatgeneral),
                        'user' => new UserResources($etatgeneral->user),
                    ],
                    'sucsses' => true,
                    'message' => 'etat general modifier avec succes',

                ],
                200
            );
        }
    }

    /**
     * Remove the specified resource from storage.
     *
     * @param  int  $id
     * @return \Illuminate\Http\Response
     */
    public function destroy(EtatGeneral $etatgeneral)
    {
        $etatgeneral =  auth()->user()->etatgeneral()->findOrFail($etatgeneral->id);
        // dd($etatgeneral);

        // dd($post);
        if ($etatgeneral->delete()) {
            return response()->json(
                [
                    'data' => [
                        'etatgeneral' => $etatgeneral,
                    ],
                    'msg' => 'etat deleted',
                    'success' => 1

                ],
                200
            );
        }
    }


    public function user_etat_generals()
    {
        $etatgeneral = auth()->user()->etatgeneral()->get();
        $user = auth()->user();

        return response()->json(
            [
                'data' => [
                    'etatgeneral' => EtatGeneralResources::collection($etatgeneral),
                ],
                'user' => new UserResources($user),
                'sucsses' => true,
                'message' => 'your generals etat list ',

            ],
            200
        );
    }
}
