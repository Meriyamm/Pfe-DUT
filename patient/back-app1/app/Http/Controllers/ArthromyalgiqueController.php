<?php

namespace App\Http\Controllers;

use App\Http\Requests\ArthromyalgiqueRequest;
use App\Http\Resources\Arthromyalgique as ResourcesArthromyalgique;
use App\Models\Arthromyalgique;
use App\Models\Symptom;
use Illuminate\Http\Request;
use App\Http\Resources\User as UserResources;

class ArthromyalgiqueController extends Controller
{
    /**
     * Display a listing of the resource.
     *
     * @return \Illuminate\Http\Response
     */
    public function index()
    {
        $arthromylagique = auth()->user()->arthromylagique()->get();
        $user = auth()->user();

        return response()->json(
            [
                'data' => [
                    'arthromylagique' => ResourcesArthromyalgique::collection($arthromylagique),

                ],
                'user' => new UserResources($user),
                'sucsses' => true,
                'message' => 'tes evaluations pour arthromylagique symptome ',

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
    public function store(ArthromyalgiqueRequest $request)
    {
        $crampesMusculaires = $request->crampesMusculaires;
        $douleurDiffuses = $request->douleurDiffuses;
        $arthralgies = $request->arthralgies;
        $hospital = 0;
        $ordonnace = 0;
        $informer = 0;

        if ($crampesMusculaires || $douleurDiffuses || $arthralgies) {
            $hospital = 1;
        } else {
            $informer = 1;
            $ordonnace = 1;
        }


        $arthromylagique = auth()->user()->arthromylagique()->create($request->all());
        $user = auth()->user();
        $symptom = new Symptom(['toxicite_id' => 5, 'user_id' => $user->id]);
        $arthromy = Arthromyalgique::findOrFail($arthromylagique->id);
        $arthromy->symptoms()->save($symptom);

        if ($arthromylagique && $arthromy) {
            return response()->json(
                [

                    'Toxicite' => $symptom->toxicite()->get('name'),
                    'status' => 'success',
                    'ordonnance' => $ordonnace ? 'yes' : 'no',
                    'informer' => $informer,
                    'grade' => 2,
                    'tox' => " ألم مفصلي",
                    'hospital' => $hospital ? "yes": 'no',
                    'message' => 'evaluation for Arthromylagique added with success'
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
