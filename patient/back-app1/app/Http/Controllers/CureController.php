<?php

namespace App\Http\Controllers;
use Carbon\Carbon;

use App\Http\Requests\CureRequest;
use Illuminate\Http\Request;
use App\Http\Resources\Cure as CureResources;
use App\Http\Resources\User as UserResources;
use App\Models\Cure;
use DateInterval;
use DateTime;
use Illuminate\Support\Facades\DB;

class CureController extends Controller
{
    /**
     * Display a listing of the resource.
     *
     * @return \Illuminate\Http\Response
     */
    public function index()
    {
        // return EtatGeneralResources::collection(EtatGeneral::all());
        $cure = auth()->user()->cures()->orderBy('id', 'DESC')->get();
        $user = auth()->user();

        return response()->json(
            [
                
                'cures' => CureResources::collection($cure),
                'user' => new UserResources($user),
                'success' => true,
                'message' => 'your cure list displayed with succes',

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
    // public function store(CureRequest $request)
    // {
    //     $date = new DateTime($request->dateCure);
    //     $date->add(new DateInterval('P21D')); // P1D means a period of 1 day

    //     $cure = auth()->user()->cures()->create($request->only(['dateCure']));
    //     DB::table('cures')
    //         ->where('id', $cure->id)
    //         ->update(array('dateNextCure' => $date));

    //     $dateCure = new DateTime($cure->dateCure);
    //     $currentTime = Carbon::now();
    //     if( $dateCure < $currentTime) { $days = 'passed?';
    //     }else if( $dateCure == $currentTime) { $days = 'today';
    //     }else{
    //     $interval = $date->diff($currentTime);
    //     $days = $interval->format('%a');
    //     }
    //     if ($cure) {
    //         return response()->json(
    //             [
    //                 // [
    //                 //     'data' => [
    //                         'date de la derniere cure' => $dateCure->format('Y-m-d h:m'),
    //                         'date de la prochaine cure' => $date->format('Y-m-d h:m'),
    //                     // ],
    //                     'user' => new UserResources($cure->user),
    //                 // ],
    //                 'reste' => $days,
    //                 'status' => 'success',
    //                 'message' => 'Etat general added with success'
    //             ],
    //             201
    //         );
    //     }
    // }

    public function store(CureRequest $request)
    {
        $date = new DateTime($request->dateCure);
        $date->add(new DateInterval('P21D')); // P1D means a period of 1 day

        $cure = auth()->user()->cures()->create($request->only(['dateCure']));
        DB::table('cures')
            ->where('id', $cure->id)
            ->update(array('dateNextCure' => $date));

        $dateCure = new DateTime($cure->dateCure);
        if ($cure) {
            return response()->json(
                [
                    [
                        'data' => [
                            'date de la derniere cure' => $dateCure->format('Y-m-d h:m'),
                            'date de la prochaine cure' => $date->format('Y-m-d h:m'),
                        ],
                        'user' => new UserResources($cure->user)
                    ],
                    'status' => 'success',
                    'message' => 'Etat general added with success'
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
    }

    /**
     * Update the specified resource in storage.
     *
     * @param  \Illuminate\Http\Request  $request
     * @param  int  $id
     * @return \Illuminate\Http\Response
     */
    public function update(CureRequest $request, Cure $cure)
    {
    }

    /**
     * Remove the specified resource from storage.
     *
     * @param  int  $id
     * @return \Illuminate\Http\Response
     */
    public function destroy(Cure $etatgeneral)
    {
    }
}
