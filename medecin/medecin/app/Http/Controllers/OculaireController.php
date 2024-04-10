<?php

namespace App\Http\Controllers;

use App\Http\Requests\OculaireRequest;
use App\Http\Resources\Oculaire as ResourcesOculaire;
use App\Http\Resources\User as UserResources;
use App\Models\Oculaire;
use App\Models\Symptom;
use Illuminate\Http\Request;

class OculaireController extends Controller
{
    /**
     * Display a listing of the resource.
     *
     * @return \Illuminate\Http\Response
     */
    public function index()
    {
        $oculaire = auth()->user()->oculaire()->get();
        $user = auth()->user();

        return response()->json(
            [

                'oculaire' => ResourcesOculaire::collection($oculaire),
                'user' => new UserResources($user),
                'sucsses' => true,
                'message' => 'tes evaluations pour la toxicitee oculaire ',

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
    public function store(OculaireRequest $request)
    {
        $Rougeur = $request->Rougeur;
        $larmoiement = $request->larmoiement;
        $oedem = $request->oedem;
        $sensationDepicotement = $request->sensationDepicotement;
        $conduireVehicule = $request->conduireVehicule;
        $lire = $request->lire;
        $maquiller = $request->maquiller;
        $Fievre = $request->Fievre;


        $ordonnace = 0;
        $hospital = 0;
        $informer = 0;
        // $Rougeur || $larmoiement || $oedem || $sensationDepicotement ||
        if ( !$conduireVehicule || !$lire || !$maquiller || $Fievre) {
            $hospital = 1;
        } else {
            $informer = 1;
            $ordonnace = 1;
        }
        if ( $hospital == 1){
           $grade = 2;
        } else {
            $grade = 1;
        }

        $oculaire = auth()->user()->oculaire()->create($request->all());
        $user = auth()->user();
        $symptom = new Symptom(['toxicite_id' => 6, 'user_id' => $user->id]);
        $ocul = Oculaire::findOrFail($oculaire->id);
        $ocul->symptoms()->save($symptom);

        if ($oculaire && $ocul) {
            return response()->json(
                [

                    'Toxicite' => $symptom->toxicite()->get('name'),
                    'status' => 'success',
                    'grade' => $grade,
                    'symp' => 'البصر',
                    'ordonnance' => $ordonnace ? 'yes' : 'no',
                    'informer' => $informer,
                    'hospital' => $hospital ? 'yes' : 'no',
                    'message' => 'evaluation for oculaire added with success'
                ],
                201
            );
        }
    }

    /**
     * Display the specified resource.
     *
     * @param  \App\Models\Oculaire  $oculaire
     * @return \Illuminate\Http\Response
     */
    public function show(Oculaire $oculaire)
    {
        //
    }

    /**
     * Update the specified resource in storage.
     *
     * @param  \Illuminate\Http\Request  $request
     * @param  \App\Models\Oculaire  $oculaire
     * @return \Illuminate\Http\Response
     */
    public function update(Request $request, Oculaire $oculaire)
    {
        //
    }

    /**
     * Remove the specified resource from storage.
     *
     * @param  \App\Models\Oculaire  $oculaire
     * @return \Illuminate\Http\Response
     */
    public function destroy(Oculaire $oculaire)
    {
        //
    }
}
