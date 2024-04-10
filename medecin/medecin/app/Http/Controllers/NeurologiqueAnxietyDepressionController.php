<?php

namespace App\Http\Controllers;

use App\Http\Requests\NeurologiqueAnxietyDepressionRequest;
use App\Http\Resources\NeurologiqueAnxietyDepression as ResourcesNeurologiqueAnxietyDepression;
use App\Http\Resources\User as ResourcesUser;
use App\Models\NeurologiqueAnxietyDepression;
use App\Models\NeurologiqueAnxietyDepretion;
use App\Models\Symptom;
use Illuminate\Http\Request;

class NeurologiqueAnxietyDepressionController extends Controller
{
    /**
     * Display a listing of the resource.
     *
     * @return \Illuminate\Http\Response
     */
    public function index()
    {
        $NeurologiqueAnxietyDepression = auth()->user()->neuroAnxeityDepretion()->get();
        $user = auth()->user();

        return response()->json(
            [

                'NeurologiqueAnxietyDepression' => ResourcesNeurologiqueAnxietyDepression::collection($NeurologiqueAnxietyDepression),
                'user' => new ResourcesUser($user),
                'sucsses' => true,
                'message' => 'tes evaluations pour la Neurologie symptome ',

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
    public function store(NeurologiqueAnxietyDepressionRequest $request)
    {


        $neurologiqueAnxietyDepretion = auth()->user()->neuroAnxeityDepretion()->create($request->all());
        $user = auth()->user();

        $symptom = new Symptom(['toxicite_id' => 7, 'user_id' => $user->id]);
        $nad = NeurologiqueAnxietyDepression::findOrFail($neurologiqueAnxietyDepretion->id);
        $nad->symptoms()->save($symptom);



        if ($neurologiqueAnxietyDepretion && $nad) {
            return response()->json(
                [

                    'Toxicite type ' => $symptom->toxicite()->get('name'),
                    'Neurologique_ainxeity_depression' => new ResourcesNeurologiqueAnxietyDepression($neurologiqueAnxietyDepretion),
                    'user' => new ResourcesUser($user),
                    'status' => 'success',
                    'grade' => 2,
                    'tox' => 'القلق /الاكتئاب/أعصاب',
                    'message' => 'evaluation for Neurologique ans ainxeity and depression added with success'
                ],
                201
            );
        }
    }

    /**
     * Display the specified resource.
     *
     * @param  \App\Models\NeurologiqueAnxietyDepretion  $neurologiqueAnxietyDepretion
     * @return \Illuminate\Http\Response
     */
    public function show(NeurologiqueAnxietyDepretion $neurologiqueAnxietyDepretion)
    {
        //
    }

    /**
     * Update the specified resource in storage.
     *
     * @param  \Illuminate\Http\Request  $request
     * @param  \App\Models\NeurologiqueAnxietyDepretion  $neurologiqueAnxietyDepretion
     * @return \Illuminate\Http\Response
     */
    public function update(Request $request, NeurologiqueAnxietyDepretion $neurologiqueAnxietyDepretion)
    {
        //
    }

    /**
     * Remove the specified resource from storage.
     *
     * @param  \App\Models\NeurologiqueAnxietyDepretion  $neurologiqueAnxietyDepretion
     * @return \Illuminate\Http\Response
     */
    public function destroy(NeurologiqueAnxietyDepretion $neurologiqueAnxietyDepretion)
    {
        //
    }
}
