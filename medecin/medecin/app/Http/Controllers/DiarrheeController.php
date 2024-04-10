<?php

namespace App\Http\Controllers;

use App\Http\Requests\DiarrheeRequest;
use Illuminate\Http\Request;
use App\Http\Resources\User as UserResources;
use App\Http\Resources\Diarrhee as DiarrheeResources;
use App\Models\Diarrhee;
use App\Models\Symptom;
use DateInterval;
use DateTime;
use Illuminate\Support\Facades\DB;

class DiarrheeController extends Controller
{
    /**
     * Display a listing of the resource.
     *
     * @return \Illuminate\Http\Response
     */
    public function index()
    {
        $diarrhee = auth()->user()->diarrhee()->get();
        $user = auth()->user();

        return response()->json(
            [
                'data' => [
                    'diarrhee' => DiarrheeResources::collection($diarrhee),

                ],
                'user' => new UserResources($user),
                'sucsses' => true,
                'message' => 'tes evaluations pour diarrhee symptome ',

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
    public function store(DiarrheeRequest $request)
    {
        $user = auth()->user();
        $indice1 = $request->nbSellesParJr;
        $indice2 = $request->saignementDigestif;
        //$indice3 = $request->dureeDeServeunu;
        $indice4 = $request->fievre;
        $indice3 = $request->fatigue;
        $indice5 = $request->douleurAbdominal;
        $indice6 = $request->Déshydratation;
        $indice7 = $request->Dénutrition;
        $indice8 = $request->troubleNeurologique;
        $indice9 = $request->urinerPlusFoncerEtmoinsFrequente;
        if ($indice2 || $indice3|| $indice4 || $indice5 || $indice6 || $indice7 || $indice8 || $indice9 || $indice1 >= 7) $grade = 3;
        else if ($indice1 < 4) $grade = 1;
        else $grade = 2;




        $diarrhee = auth()->user()->diarrhee()->create($request->all());
        DB::table('diarrhees')
            ->where('id', $diarrhee->id)
            ->update(array('grade' => $grade));



        $symptom = new Symptom(['toxicite_id' => 1,'user_id' => $user->id]);
        $diarr = diarrhee::findOrFail($diarrhee->id);
        $diarr->symptoms()->save($symptom);



        if ($diarrhee && $diarr) {
            return response()->json(
                [
                    
                        'diarrhee grade' => $grade,
                        'Toxicite type ' => $symptom->toxicite()->get('name'),

                    'Symptom' => 'الإسهال',
                    'tox' => 'سمية الجهاز الهضمي',
                    'user' => new UserResources($diarrhee->user),
                    'status' => 'success',
                    'message' => 'evaluation for diarrhee added with success'
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
        //
    }

    /**
     * Update the specified resource in storage.
     *
     * @param  \Illuminate\Http\Request  $request
     * @param  int  $id
     * @return \Illuminate\Http\Response
     */
    public function update(Request $request, $id)
    {
        //
    }

    /**
     * Remove the specified resource from storage.
     *
     * @param  int  $id
     * @return \Illuminate\Http\Response
     */
    public function destroy($id)
    {
        //
    }
}
