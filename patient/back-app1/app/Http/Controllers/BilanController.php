<?php

namespace App\Http\Controllers;

use App\Http\Resources\Toxicites as ToxicitesResources;
use App\Http\Resources\User as UserResources;
use App\Http\Resources\Symptom as SymptomResources;
use App\Models\Symptom;
use Illuminate\Http\Request;

class BilanController extends Controller
{
    public function index()
    {
        $user = auth()->user();
        // $symptomps = Symptom::get()->where('user_id', $user->id);
        $symptomps = auth()->user()->symptoms()->orderBy('id', 'DESC')->get();
        return response()->json(
            [
                'bilan' => SymptomResources::collection($symptomps),
                'success' => true,
                'message' => 'your bilan',


            ],
            200
        );
    }
    public function users_bilan()
    {
        // $user = (User::all()->where('role', 'patient'));
        $symptomps = Symptom::get();

        // dd(UserResources::collection($symptomps));



        return response()->json(
            [

                'bilan' => SymptomResources::collection($symptomps),
                'sucsses' => true,
                'message' => 'your bilan',

            ],
            200
        );
    }
}
