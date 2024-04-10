<?php

namespace App\Http\Controllers;

use App\Http\Requests\ToxicitesRequest;
use App\Models\Toxicites;
use Illuminate\Http\Request;
use App\Http\Resources\Toxicites as ResourcesToxicites;

class ToxicitesController extends Controller
{
    /**
     * Display a listing of the resource.
     *
     * @return \Illuminate\Http\Response
     */
    public function index()
    {
        return ResourcesToxicites::collection(Toxicites::all());
    }

    /**
     * Store a newly created resource in storage.
     *
     * @param  \Illuminate\Http\Request  $request
     * @return \Illuminate\Http\Response
     */
    public function store(ToxicitesRequest $request)
    {
        $tox = Toxicites::create($request->all());
        if ($tox) {
            return response()->json(
                [
                    [
                        'data' => new ResourcesToxicites($tox),
                        //  'by_user' => new UserResources($post->user)
                    ],
                    'status' => 'success',
                    'message' => 'Toxicites creer avec succes'
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
    public function update($id, ToxicitesRequest $request)
    {
        $tox = Toxicites::findOrFail($id);
        //   dd($tox);
        if ($tox->update($request->all())) {
            return response()->json(
                [
                    [
                        'data' => new ResourcesToxicites($tox),
                        //  'by_user' => new UserResources($post->user)
                    ],
                    'status' => 'success',
                    'message' => 'Toxicites updated avec succes'
                ],
                201
            );
        }
    }

    /**
     * Remove the specified resource from storage.
     *
     * @param  int  $id
     * @return \Illuminate\Http\Response
     */
    public function destroy($id)
    {
        $tox = Toxicites::findOrFail($id);
        //   dd($tox);
        if ($tox->delete()) {
            return response()->json(
                [
                    [
                        'data' => new ResourcesToxicites($tox),
                    ],
                    'status' => 'success',
                    'message' => 'Toxicites deleted avec succes'
                ],
                200
            );
        } else {
            return response()->json(
                [
                    [
                        'data' => [],
                    ],
                    'status' => 'failed',
                    'message' => 'No toxicites found'
                ],
                201
            );
        }
    }
    public function GetAll(){
        $list = new Toxicites();
        $list = $list->getAllTox();
        //$list['article_content']=html_entity_decode($list['article_content']);
        // foreach ($list as $item){
        //     $item['article_content']=strip_tags($item['article_content']);
        //     $item['article_content']=$Content = preg_replace("/&#?[a-z0-9]+;/i"," ",$item['article_content']); 
        // }
        return response()->json($list);
    }
}
