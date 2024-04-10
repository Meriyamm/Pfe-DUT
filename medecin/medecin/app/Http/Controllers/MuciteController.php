<?php

namespace App\Http\Controllers;

use App\Models\mucitee;
use App\Http\Requests\MuciteRequest;
use App\Http\Requests\StoreMuciteRequest;
use App\Http\Requests\UpdateMuciteRequest;
use App\Models\Symptom;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\DB;
use App\Http\Resources\User as UserResources;
use App\Http\Resources\mucitee as MuciteResources;

class MuciteController extends Controller
{
    /**
     * Display a listing of the resource.
     *
     * @return \Illuminate\Http\Response
     */
    public function index()
    {
        $mucite = auth()->user()->mucitee()->get();
        $user = auth()->user();

        return response()->json(
            [
                'data' => [
                    'mucite' => MuciteRessources::collection($mucite),

                ],
                'user' => new UserResources($user),
                'sucsses' => true,
                'message' => 'tes evaluations pour mucite symptome ',

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
        //
    }

    /**
     * Store a newly created resource in storage.
     *
     * @param  \App\Http\Requests\StoreMuciteRequest  $request
     * @return \Illuminate\Http\Response
     */
    public function store(MuciteRequest $request)
    {
        $user = auth()->user();
        $indice1 = $request->douleur;
        $indice2 = $request->priseAlimentaire;
        $indice4 = $request->voix;
        $indice5 = $request->deglutition;
        $indice6 = $request->langue;
        $indice7 = $request->salive;
        $indice8 = $request->muqueuse;
        $indice9 = $request->gencive;
        $indice10 = $request->dents;
        $indice11 = $request->levres;
        if ($indice4 == 'normale') $score1 = 1;
        else if ($indice4 == 'seche/rauque') $score1 = 2;
        else $score1 = 3;
        
        if ($indice5 == 'normale') $score2 = 1;
        else if ($indice5 == 'douloureuse') $score2 = 2;
        else $score2 = 3;

        if ($indice6 == 'rose&humide') $score3 = 1;
        else if ($indice6 == 'pateuse&pale') $score3 = 2;
        else $score3 = 3;

        if ($indice7 == 'transparente') $score4 = 1;
        else if ($indice7 == 'epaisse&visqueuse') $score4 = 2;
        else $score4 = 3;

        if ($indice8 == 'rose&humide') $score5 = 1;
        else if ($indice8 == 'inflammation') $score5 = 2;
        else $score5 = 3;
 
        if ($indice9 == 'rose&ferme') $score6 = 1;
        else if ($indice9 == 'inflammatoire&oedeme') $score6 = 2;
        else $score6 = 3;
        
        if ($indice10 == 'propre') $score7 = 1;
        else if ($indice10 == 'plaques localisees') $score7 = 2;
        else $score7 = 3;

        if ($indice11 == 'rose&lise') $score8 = 1;
        else if ($indice11 == 'seche&fissure') $score8 = 2;
        else $score8 = 3;

        $score = $score1 + $score2 + $score3 + $score4 + $score5 + $score6 + $score7 + $score8;
        $formeModere = ($score > 8 && $score <= 16);
        $formeSevere = ($score > 16);

        if ($formeSevere || $indice2 == 'impossible') $grade = 3;
        else if ($formeModere || $indice1 || $indice2 == 'modifiee') $grade = 2;
        else $grade = 1;
        
        



        $mucite = auth()->user()->mucitee()->create($request->all());
        DB::table('mucitees')
            ->where('id', $mucite->id)
            ->update(array('grade' => $grade));



        $symptom = new Symptom(['toxicite_id' => 1]);
        $muc = mucitee::findOrFail($mucite->id);
        $muc->symptoms()->save($symptom);



        if ($mucite && $muc) {
            return response()->json(
                [
                    //'data' => [
                        'mucite grade' => $grade,
                        'Toxicite type ' => $symptom->toxicite()->get('name'),
                        'tox' => 'سمية الجهاز الهضمي',

                    //],
                    'Symptom' => 'التهاب الغشاء المخاطي',
                    'user' => new UserResources($mucite->user),
                    'status' => 'success',
                    'message' => 'evaluation for mucite added with success'
                ],
                201
            );
        }
    }

    /**
     * Display the specified resource.
     *
     * @param  \App\Models\Mucite  $mucite
     * @return \Illuminate\Http\Response
     */
    public function show(Mucite $mucite)
    {
        //
    }

    /**
     * Show the form for editing the specified resource.
     *
     * @param  \App\Models\Mucite  $mucite
     * @return \Illuminate\Http\Response
     */
    public function edit(Mucite $mucite)
    {
        //
    }

    /**
     * Update the specified resource in storage.
     *
     * @param  \App\Http\Requests\UpdateMuciteRequest  $request
     * @param  \App\Models\Mucite  $mucite
     * @return \Illuminate\Http\Response
     */
    public function update(UpdateMuciteRequest $request, Mucite $mucite)
    {
        //
    }

    /**
     * Remove the specified resource from storage.
     *
     * @param  \App\Models\Mucite  $mucite
     * @return \Illuminate\Http\Response
     */
    public function destroy(Mucite $mucite)
    {
        //
    }
}
