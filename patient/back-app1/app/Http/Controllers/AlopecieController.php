<?php

namespace App\Http\Controllers;

use App\Http\Requests\AlopecieRequest;
use App\Http\Resources\Alopecie as AlopecieResources;
use App\Http\Resources\User;
use App\Models\Alopecie;
use App\Models\Cutanee;
use App\Models\Symptom;
use DateTime;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\DB;

class AlopecieController extends Controller
{
    /**
     * Display a listing of the resource.
     *
     * @return \Illuminate\Http\Response
     */
    public function index()
    {
        //
    }

    /**
     * Store a newly created resource in storage.
     *
     * @param  \Illuminate\Http\Request  $request
     * @return \Illuminate\Http\Response
     */
    public function store(AlopecieRequest $request)
    {

        $alopecie  = auth()->user()->alopecies()->create($request->all());
        $user = auth()->user();
        $symptom = new Symptom(['toxicite_id' => 3, 'user_id' => $user->id]);
        $alop = Alopecie::findOrFail($alopecie->id);
        $alop->symptoms()->save($symptom);

        if ($alopecie && $alop) {
            return response()->json(
                [
                    'data' => [
                        new AlopecieResources($alopecie),
                        new User($user),

                    ],
                    'status' => true,
                    'message' => 'Alopecie enregistrer'
                ],
                201
            );
        }
    }

    /**
     * Display the specified resource.
     *
     * @param  \App\Models\Alopecie  $alopecie
     * @return \Illuminate\Http\Response
     */
    public function show(Alopecie $alopecie)
    {
        //
    }

    /**
     * Update the specified resource in storage.
     *
     * @param  \Illuminate\Http\Request  $request
     * @param  \App\Models\Alopecie  $alopecie
     * @return \Illuminate\Http\Response
     */
    public function update(Request $request, Alopecie $alopecie)
    {
        //
    }

    /**
     * Remove the specified resource from storage.
     *
     * @param  \App\Models\Alopecie  $alopecie
     * @return \Illuminate\Http\Response
     */
    public function destroy(Alopecie $alopecie)
    {
        //
    }
}
