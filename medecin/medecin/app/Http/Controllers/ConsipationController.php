<?php

namespace App\Http\Controllers;

use App\Http\Requests\ConsipationRequest;
use Illuminate\Http\Request;
use App\Http\Resources\User as UserResources;
use App\Http\Resources\Consipation as ConsipationResources;
use App\Models\Consipation;
use App\Models\Symptom;
use DateInterval;
use DateTime;
use Illuminate\Support\Facades\DB;

class ConsipationController extends Controller
{
    /**
     * Display a listing of the resource.
     *
     * @return \Illuminate\Http\Response
     */
    public function index()
    {
        $etatgeneral = auth()->user()->consipation()->get();
        $user = auth()->user();

        return response()->json(
            [
                'data' => [
                    'consipation' => ConsipationResources::collection($etatgeneral),
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
    public function store(ConsipationRequest $request)
    {
        $user = auth()->user();
        $indice1 = $request->douleurEtCrampe;
        $indice2 = $request->saignementDigestif;
        $indice3 = $request->vomissement;
        $indice4 = $request->fievre;
        $indice5 = $request->apparition;
        $indice6= $request->frequenceSelles;
        if ($indice1 || $indice2 || $indice3 || $indice4) $grade = 3;
        else if ($indice6 =='persistante') $grade = 2;
        else $grade = 1;

        // $date = new DateTime('2020-01-15 10:41:12');
        // $date->add(new DateInterval('P21D')); // P1D means a period of 1 day
        // dd($date->format('Y-m-d h:m'));
        // dd(date('Y-m-d', strtotime($date . '+ 21 days')));

        // $request->grade = $grade;
        // dd($request->grade);
        $consipation = auth()->user()->consipation()->create($request->all());
        DB::table('consipations')
            ->where('id', $consipation->id)
            ->update(array('grade' => $grade));

        // $consipation =  DB::table('consipations')
        //     ->where('id', $consipation->id)
        //     ->get();

        $symptom = new Symptom(['toxicite_id' => 1,'user_id' => $user->id]);
        $consip = Consipation::findOrFail($consipation->id);
        $consip->symptoms()->save($symptom);



        if ($consipation && $consip) {
            return response()->json(
                [
                   //[
                        // 'data' => [
                            'constipation grade' => $grade,
                            'Toxicite' => $symptom->toxicite()->get('name'),

                        // ],
                        'Symptom' => 'إمساك',
                        'tox' => 'سمية الجهاز الهضمي',
                        'user' => new UserResources($consipation->user),
                   //],
                    'status' => 'success',
                    'message' => 'evaluation for consipation added with success'
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
