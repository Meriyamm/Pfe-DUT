<?php

namespace App\Http\Controllers;

use App\Http\Requests\NauseeVomissementRequest;
use App\Models\Diarrhee;
use App\Models\NauseeVomissement;
use App\Models\Symptom;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\DB;
use App\Http\Resources\User as UserResources;
use App\Http\Resources\NauseVomissement as NVResources;


class NauseeVomissementController extends Controller
{
    /**
     * Display a listing of the resource.
     *
     * @return \Illuminate\Http\Response
     */
    public function index()
    {
        $nausee_vomisse = auth()->user()->nausee_vomiss()->get();
        $user = auth()->user();

        return response()->json(
            [
                'data' => [
                    'nausee_vomisse' => NVResources::collection($nausee_vomisse),

                ],
                'user' => new UserResources($user),
                'sucsses' => true,
                'message' => 'tes evaluations pour diarrhee symptome ',

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
     * @param  \Illuminate\Http\Request  $request
     * @return \Illuminate\Http\Response
     */
    public function store(NauseeVomissementRequest $request)
    {
        $user = auth()->user();
        $indice1 = $request->nbrRepasParJr;
        $indice2 = $request->nbEpisodesParJr;
        $indice4 = $request->fievre;
        $indice6 = $request->Déshydratation;
        $indice8 = $request->troubleNeurologique;
        $indice9 = $request->urinerPlusFoncer;
        $indice10 = $request->urinermoinsFrequente;
        if ($indice4  || $indice6  || $indice8 || $indice9 || $indice10) $grade = 4;
        else if ($indice2 >= 6 || $indice1 < 2) $grade = 3;
        else if ($indice2 <= 5 && $indice2 >= 2) $grade = 2;
        else $grade = 1;



        $nauseeVomi = auth()->user()->nausee_vomiss()->create($request->all());
        DB::table('nausee_vomissements')
            ->where('id', $nauseeVomi->id)
            ->update(array('grade' => $grade));



        $symptom = new Symptom(['toxicite_id' => 1,'user_id' => $user->id]);
        $nau_vo = NauseeVomissement::findOrFail($nauseeVomi->id);
        $nau_vo->symptoms()->save($symptom);



        if ($nauseeVomi && $nau_vo) {
            return response()->json(
                // [
                //    $grade,

                // ],
                [
                   // 'data' => [
                        'nausee_vomissements grade' => $grade,
                        'Toxicite type ' => $symptom->toxicite()->get('name'),
                        'Symptom' => 'التقيؤ',
                        'tox' => 'سمية الجهاز الهضمي',

                    //],
                    'user' => new UserResources($nauseeVomi->user),
                    'status' => 'success',
                    'message' => 'evaluation for nausee/vomissement added with success'
                ],
                201
            );
        }
    }

    /**
     * Display the specified resource.
     *
     * @param  \App\Models\NauseeVomissement  $nauseeVomissement
     * @return \Illuminate\Http\Response
     */
    public function show(NauseeVomissement $nauseeVomissement)
    {
        //
    }

    /**
     * Show the form for editing the specified resource.
     *
     * @param  \App\Models\NauseeVomissement  $nauseeVomissement
     * @return \Illuminate\Http\Response
     */
    public function edit(NauseeVomissement $nauseeVomissement)
    {
        //
    }

    /**
     * Update the specified resource in storage.
     *
     * @param  \Illuminate\Http\Request  $request
     * @param  \App\Models\NauseeVomissement  $nauseeVomissement
     * @return \Illuminate\Http\Response
     */
    public function update(Request $request, NauseeVomissement $nauseeVomissement)
    {
        //
    }

    /**
     * Remove the specified resource from storage.
     *
     * @param  \App\Models\NauseeVomissement  $nauseeVomissement
     * @return \Illuminate\Http\Response
     */
    public function destroy(NauseeVomissement $nauseeVomissement)
    {
        //
    }
}
