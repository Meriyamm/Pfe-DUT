<?php

namespace App\Http\Controllers;

use App\Http\Resources\TroubleSexuality as ResourcesTroubleSexuality;
use App\Http\Resources\User;
use App\Models\Symptom;
use App\Models\TroubleSexuality;
use Illuminate\Http\Request;

class TroubleSexualityController extends Controller
{
    /**
     * Display a listing of the resource.
     *
     * @return \Illuminate\Http\Response
     */
    public function index()
    {

        $troublesexuality = auth()->user()->troublesexuality()->get();
        $user = auth()->user();

        return response()->json(
            [

                'troublesexuality' => ResourcesTroubleSexuality::collection($troublesexuality),
                'user' => new User($user),
                'sucsses' => true,
                'message' => 'tes evaluations pour la perturbation du cycle menstruel ',

            ],
            200
        );
    }

    /**
     * Show the form for creating a new resource.
     *
     * @return \Illuminate\Http\Response
     */
    public function create()
    {
    }

    /**
     * Store a newly created resource in storage.
     *
     * @param  \Illuminate\Http\Request  $request
     * @return \Illuminate\Http\Response
     */
    public function store(Request $request)
    {
        $secheresseVaginale = $request->secheresseVaginale;
        $DemangeaisonsGenitales = $request->DemangeaisonsGenitales;
        $InconfortIntime = $request->InconfortIntime;
        $dyspareunie = $request->dyspareunie;
        $gynecomastie = $request->gynecomastie;


        $ordonnace = 0;
        $hospital = 0;
        $informer = 0;

        if ($secheresseVaginale || $DemangeaisonsGenitales || $InconfortIntime || $dyspareunie || $gynecomastie) {
            $hospital = 1;
        } else {
            $informer = 1;
            $ordonnace = 1;
        }


        $troublesexualoties = auth()->user()->troublesexuality()->create($request->all());
        $user = auth()->user();
        $symptom = new Symptom(['toxicite_id' => 2, 'user_id' => $user->id]);
        $trouble = TroubleSexuality::findOrFail($troublesexualoties->id);
        $trouble->symptoms()->save($symptom);

        if ($troublesexualoties && $trouble) {
            return response()->json(
                [

                    'Toxicite' => $symptom->toxicite()->get('name'),
                    'status' => 'success',
                    'ordonnance' => $ordonnace ? 'yes' : 'no',
                    'grade' => 2,
                    'tox' => 'الغدد التناسلية',
                    'symp' => 'الاضطرابات الجنسية',
                    'informer' => $informer,
                    'hospital' => $hospital ? 'yes' : 'no',
                    'message' => 'evaluation de les troubles de sexualites added with success'
                ],
                201
            );
        }
    }

    /**
     * Display the specified resource.
     *
     * @param  \App\Models\TroubleSexuality  $troubleSexuality
     * @return \Illuminate\Http\Response
     */
    public function show(TroubleSexuality $troubleSexuality)
    {
        //
    }

    /**
     * Show the form for editing the specified resource.
     *
     * @param  \App\Models\TroubleSexuality  $troubleSexuality
     * @return \Illuminate\Http\Response
     */
    public function edit(TroubleSexuality $troubleSexuality)
    {
        //
    }

    /**
     * Update the specified resource in storage.
     *
     * @param  \Illuminate\Http\Request  $request
     * @param  \App\Models\TroubleSexuality  $troubleSexuality
     * @return \Illuminate\Http\Response
     */
    public function update(Request $request, TroubleSexuality $troubleSexuality)
    {
        //
    }

    /**
     * Remove the specified resource from storage.
     *
     * @param  \App\Models\TroubleSexuality  $troubleSexuality
     * @return \Illuminate\Http\Response
     */
    public function destroy(TroubleSexuality $troubleSexuality)
    {
        //
    }
}
