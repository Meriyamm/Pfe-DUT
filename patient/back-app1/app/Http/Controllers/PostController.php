<?php

namespace App\Http\Controllers;

use App\Http\Requests\PostRequest;
use App\Http\Resources\Post as PostResources;
use App\Http\Resources\User as UserResources;
use App\Models\Post;
use Illuminate\Http\Request;

class PostController extends Controller
{
    /**
     * Display a listing of the resource.
     *
     * @return \Illuminate\Http\Response
     */
    public function index()
    {
        $posts = auth()->user()->posts()->orderBy('id', 'DESC')->get();
        $user = auth()->user();
        // dd($user);
        return response()->json([

            'data' => PostResources::collection($posts),
            'user' => $user->name
        ]
            //$posts
         , 200);
        ////////////////////
        // $list = new Post();
        // $list = $list->getAll();
        // //$list['article_content']=html_entity_decode($list['article_content']);
        // // foreach ($list as $item){
        // //     $item['article_content']=strip_tags($item['article_content']);
        // //     $item['article_content']=$Content = preg_replace("/&#?[a-z0-9]+;/i"," ",$item['article_content']); 
        // // }
        // return response()->json($list);

        //return PostResources::collection(Post::all());
    }

    /**
     * Store a newly created resource in storage.
     *
     * @param  \Illuminate\Http\Request  $request
     * @return \Illuminate\Http\Response
     */
    public function store(Request $request)
    {
        // $request->merge(['user_id' => auth()->user()->id]);
        // // dd(auth()->user()->id);
        $post = auth()->user()->posts()->create($request->all());
        if ($post) {
            return response()->json(
                [
                    [
                        'data' => new PostResources($post),
                        'by_user' => new UserResources($post->user),
                    ],
                    'status' => 'success',
                    'message' => 'Post creer avec succes'
                ],
                201
            );
        }
    }

    /**
     * Display the specified resource.
     *
     * @param  \App\Models\Post  $post
     * @return \Illuminate\Http\Response
     */
    public function show($id)
    {
        $post = Post::findOrFail($id);
        return response()->json([

            'data' => new PostResources($post),
            'by :' => new UserResources($post->user),

        ], 200);
    }

    /**
     * Update the specified resource in storage.
     *
     * @param  \Illuminate\Http\Request  $request
     * @param  \App\Models\Post  $post
     * @return \Illuminate\Http\Response
     */
    public function update(Post $post, PostRequest $request)
    {
        $post =  auth()->user()->posts()->findOrFail($post->id);
        // dd($post);
        if ($post->update($request->all())) {
            return response()->json(
                [
                    'success' => true,
                    'message' => 'post modifier avec succes'
                ],
                200
            );
        }
    }

    /**
     * Remove the specified resource from storage.
     *
     * @param  \App\Models\Post  $post
     * @return \Illuminate\Http\Response
     */
    public function destroy(Post $post)
    {
        $post =  auth()->user()->posts()->findOrFail($post->id);
        if ($post->delete()) {
            return response()->json(
                [
                    'success' => true,
                    'message' => 'post supprimer avec succes'
                ],
                200
            );
        }
    }

    public function user_posts()
    {
        $posts = auth()->user()->posts()->get();
        $user = auth()->user();
        // dd($user);
        return response()->json([
            'data' => PostResources::collection($posts),
            'user' => new UserResources($user)

        ], 200);
    }
}
