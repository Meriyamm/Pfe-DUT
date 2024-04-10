<?php

namespace App\Http\Controllers;

use App\Http\Requests\PerturbationCycleMenstruelRequest;
use App\Http\Resources\PerturbationCycleMenstruel as ResourcesPerturbationCycleMenstruel;
use App\Http\Resources\User;
use App\Models\PerturbationCycleMenstruel;
use App\Models\Symptom;
use Illuminate\Http\Request;

class PerturbationCycleMenstruelController extends Controller
{
    /**
     * Display a listing of the resource.
     *
     * @return \Illuminate\Http\Response
     */
    public function index()
    {
        $perturbationcycle = auth()->user()->perturbationcycle()->get();
        $user = auth()->user();

        return response()->json(
            [

                'perturbationcyclemenstruel' => ResourcesPerturbationCycleMenstruel::collection($perturbationcycle),
                'user' => new User($user),
                'sucsses' => true,
                'message' => 'tes evaluations pour la perturbation du cycle menstruel ',

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
    public function store(PerturbationCycleMenstruelRequest $request)
    {
        $irregulariteDuCycle = $request->irregulariteDuCycle;
        $modidfocationTotaleDesRegles = $request->modidfocationTotaleDesRegles;
        $interruptionTotalDesRegles = $request->interruptionTotalDesRegles;
        $bouffeeDeChaleur = $request->bouffeeDeChaleur;
        $secheressePeauMuquese = $request->secheressePeauMuquese;


        $ordonnace = 0;
        $hospital = 0;
        $informer = 0;

        if ($irregulariteDuCycle || $modidfocationTotaleDesRegles || $interruptionTotalDesRegles || $bouffeeDeChaleur || $secheressePeauMuquese) {
            $hospital = 1;
        } else {
            $informer = 1;
            $ordonnace = 1;
        }
        if ( $hospital == 1){
            $grade = 3;
         } else {
             $grade = 2;
         }


        $perturbationCycleMenstruel = auth()->user()->perturbationcycle()->create($request->all());
        $user = auth()->user();
        $symptom = new Symptom(['toxicite_id' => 2, 'user_id' => $user->id]);
        $perturbationcycle = PerturbationCycleMenstruel::findOrFail($perturbationCycleMenstruel->id);
        $perturbationcycle->symptoms()->save($symptom);

        if ($perturbationCycleMenstruel && $perturbationcycle) {
            return response()->json(
                [

                    'Toxicite' => $symptom->toxicite()->get('name'),
                    'status' => 'success',
                    'tox' => 'الغدد التناسلية',
                    'grade' => $grade,
                    'symp' => 'اضطرابات الدورة الشهرية',
                    'ordonnance' => $ordonnace ? 'yes' : 'no',
                    'informer' => $informer,
                    'hospital' => $hospital ? 'yes' : 'no',
                    'message' => 'evaluation for Perturbation de cycle menstruel added with success'
                ],
                201
            );
        }
    }

    /**
     * Display the specified resource.
     *
     * @param  \App\Models\PerturbationCycleMenstruel  $perturbationCycleMenstruel
     * @return \Illuminate\Http\Response
     */
    public function show(PerturbationCycleMenstruel $perturbationCycleMenstruel)
    {
        //
    }

    /**
     * Update the specified resource in storage.
     *
     * @param  \Illuminate\Http\Request  $request
     * @param  \App\Models\PerturbationCycleMenstruel  $perturbationCycleMenstruel
     * @return \Illuminate\Http\Response
     */
    public function update(Request $request, PerturbationCycleMenstruel $perturbationCycleMenstruel)
    {
        //
    }

    /**
     * Remove the specified resource from storage.
     *
     * @param  \App\Models\PerturbationCycleMenstruel  $perturbationCycleMenstruel
     * @return \Illuminate\Http\Response
     */
    public function destroy(PerturbationCycleMenstruel $perturbationCycleMenstruel)
    {
        //
    }
}
