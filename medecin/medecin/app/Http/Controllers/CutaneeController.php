<?php

namespace App\Http\Controllers;

use App\Http\Requests\CutaneeRequest;
use App\Http\Resources\Cutanee as ResourcesCutanee;
use App\Http\Resources\Symptom as ResourcesSymptom;
use App\Http\Resources\User as UserResources;
use App\Models\Alopecie;
use App\Models\Cutanee;
use App\Models\Symptom;
use DateTime;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\DB;

class CutaneeController extends Controller
{
    /**
     * Display a listing of the resource.
     *
     * @return \Illuminate\Http\Response
     */
    public function index()
    {
        $cutanee = auth()->user()->cutanee()->get();
        $user = auth()->user();

        return response()->json(
            [

                'Cutanees' => ResourcesCutanee::collection($cutanee),
                'user' => new UserResources($user),
                'sucsses' => true,
                'message' => 'tes evaluations pour Cutannee symptome ',

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
    public function store(CutaneeRequest $request)
    {
        $user = auth()->user();
        $rashCutanee = 0;
        $mainEtpieds = 0;
        $ongles = 0;

        $organe = $request->organe_id;
        // grading depend to the organe
        // visage et tronc //1
        // plis // 2
        // région axillaire //3, sous-mammaire //4, périnéale//5
        //organe_id 1,2,3,4,5  => rash cutanee ;

        $SurfaceAtteinte = $request->SurfaceAtteinte;  // necessiare pour le grading du rash cutanee
        /*
            indice1 is of type integer so we gonna make some rules,
            1 => moins 10%
            2 => between 10 and 30%
            3 => >30%
        */
        $surInfection = $request->surInfection; //rash cutanee
        $douleur = $request->douleur;
        $fievre = $request->fievre;
        $Dysesthesie = $request->Déshydratation;
        $prurit = $request->prurit;
        $rougeur = $request->rougeur;
        $brulure = $request->brulure;
        $ImpactSurActivite = $request->ImpactSurActivite;
        // $infiltrationOedeme = $request->infiltrationOedeme;
        $oedemMainEtpieds = $request->oedemMainEtpieds;
        // $photosensibilite = $request->photosensibilite;
        // $hyperpigmentation = $request->hyperpigmentation;


        if ($organe == 1 || $organe == 2 || $organe == 3 || $organe == 4 || $organe == 5) {
            if ($SurfaceAtteinte == 3|| $fievre || $surInfection != 'aucun')
                $grade = 3;
            else if ($SurfaceAtteinte == 2 && $ImpactSurActivite )
                $grade = 2;
            else $grade = 1;

            $rashCutanee = 1;
        } else if ($organe == 6) {
            if ($oedemMainEtpieds || $douleur || $ImpactSurActivite || $fievre || $Dysesthesie)
                $grade = 3;
            else if ($rougeur || $ImpactSurActivite)
                $grade = 2;
            else
                $grade = 1;

            $mainEtpieds = 1;
        } else if ($organe = 7) {
            if ($rougeur || $prurit ||  $douleur || $brulure)
                $grade = 3;
            else
                $grade = 1;

            $ongles = 1;
        }

        $cutanee = auth()->user()->cutanee()->create($request->all());
        DB::table('cutanees')
            ->where('id', $cutanee->id)
            ->update(array('grade' => $grade));

        $user = auth()->user();
        $symptom = new Symptom(['toxicite_id' => 3, 'user_id' => $user->id]);
        $cut = Cutanee::findOrFail($cutanee->id);
        $cut->symptoms()->save($symptom);



        if ($cutanee && $cut && $rashCutanee) {

            return response()->json(
                [

                    'RashcutaneeGrade' => $grade,
                    'organe' => $cutanee->organe->name,
                    'Toxicite' => $symptom->toxicite()->get('name'),
                    'tox' => 'سمية الجلد',
                    'succes' => true,


                ],
                201
            );
        } else if ($cutanee && $cut && $mainEtpieds) {
            return response()->json(
                [

                    'MAinsEtpiedsCutaneeGrade' => $grade,
                    'organe' => $cutanee->organe->name,
                    'Toxicite' => $symptom->toxicite()->get('name'),
                    'tox' => 'سمية الجلد',
                    'succes' => true,


                ],
                201
            );
        } else if ($cutanee && $cut && $ongles) {
            return response()->json(
                [

                    'OnglesCutaneeGrade' => $grade,
                    // 'organe' => $cutanee->organe->name,
                    'organe' => 'الأظافر',
                    'Toxicite' => $symptom->toxicite()->get('name'),
                    'tox' => 'سمية الجلد',
                    'succes' => true,
                ],
                201
            );
        }
    }

    /**
     * Display the specified resource.
     *
     * @param  \App\Models\Cutanee  $cutanee
     * @return \Illuminate\Http\Response
     */
    public function show(Cutanee $cutanee)
    {
        //
    }

    /**
     * Show the form for editing the specified resource.
     *
     * @param  \App\Models\Cutanee  $cutanee
     * @return \Illuminate\Http\Response
     */
    public function edit(Cutanee $cutanee)
    {
        //
    }

    /**
     * Update the specified resource in storage.
     *
     * @param  \Illuminate\Http\Request  $request
     * @param  \App\Models\Cutanee  $cutanee
     * @return \Illuminate\Http\Response
     */
    public function update(Request $request, Cutanee $cutanee)
    {
        //
    }

    /**
     * Remove the specified resource from storage.
     *
     * @param  \App\Models\Cutanee  $cutanee
     * @return \Illuminate\Http\Response
     */
    public function destroy(Cutanee $cutanee)
    {
        //
    }
}
