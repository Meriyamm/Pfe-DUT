<?php

namespace App\Http\Controllers;

use App\Http\Requests\SuiviRequest;
use App\Http\Resources\Suivi as SuiviResources;
use App\Models\SuiviExtravation;
use App\Http\Resources\User;
use App\Models\Symptom;
use DateTime;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\DB;

class SuiviExtravationController extends Controller
{
    /**
     * Display a listing of the resource.
     *
     * @return \Illuminate\Http\Response
     */
    public function index()
    {
    }

    /**
     * Store a newly created resource in storage.
     *
     * @param  \Illuminate\Http\Request  $request
     * @return \Illuminate\Http\Response
     */
    public function store(SuiviRequest $request)
    {
        if ($request->grave || $request->fievre) $grade = 3;
        else $grade = 1;
        
        $suiviExtra  = auth()->user()->suivi_extravations()->create($request->all());
        DB::table('suivi_extravations')
            ->where('id', $suiviExtra->id)
            ->update(array('grade' => $grade));
        $user = auth()->user();
        $symptom = new Symptom(['toxicite_id' => 3, 'user_id' => $user->id]);
        $SExtra = SuiviExtravation::findOrFail($suiviExtra->id);
        $SExtra->symptoms()->save($symptom);
        
        if ($suiviExtra && $SExtra) {
            return response()->json(
                [
                    // 'data' => [
                    //     new SuiviResources($suiviExtra),
                    //     new User($user),

                    // ],
                    'suivigrade' => $grade,
                    'Toxicite' => $symptom->toxicite()->get('name'),
                    'symp' => 'متابعة التسرب الجلدي السام للخلايا',
                    'tox' => 'سمية الجلد',
                    'status' => true,
                    'message' => 'Suivi Extravation enregistrer'
                ],
                201
            );
        }
    }
    /**
     * Display the specified resource.
     *
     * @param  \App\Models\SuiviExtravation  $suiviExtravation
     * @return \Illuminate\Http\Response
     */
    public function show(SuiviExtravation $suiviExtravation)
    {
        //
    }

    /**
     * Update the specified resource in storage.
     *
     * @param  \Illuminate\Http\Request  $request
     * @param  \App\Models\SuiviExtravation  $suiviExtravation
     * @return \Illuminate\Http\Response
     */
    public function update(Request $request, SuiviExtravation $suiviExtravation)
    {
        //
    }

    /**
     * Remove the specified resource from storage.
     *
     * @param  \App\Models\SuiviExtravation  $suiviExtravation
     * @return \Illuminate\Http\Response
     */
    public function destroy(SuiviExtravation $suiviExtravation)
    {
        //
    }
}
