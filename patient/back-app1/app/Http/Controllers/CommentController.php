<?php

namespace App\Http\Controllers;

use App\Http\Requests\CommentRequest;
use App\Http\Resources\Post as ResourcesPost;
use App\Http\Resources\User as ResourcesUser;
use App\Http\Resources\Comment as ResourcesComment;
use App\Models\Comment;
use App\Models\Post;
use App\Models\User;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\DB;

class CommentController extends Controller
{
    /**
     * Display a listing of the resource.
     *
     * @return \Illuminate\Http\Response
     */
    public function index($id)
    {

        $post = Post::FindOrFail($id);
        $patient = $post->user;
        $comments = $post->comments;




        return response()->json(
            [
                'data' => [
                    'post' => new ResourcesPost($post),
                    'comment' =>  ResourcesComment::collection($comments),

                ],
                'post by' => new ResourcesUser($patient),
                'sucsses' => true,

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
    public function store(CommentRequest $request, $post)
    {
        $comment = auth()->user()->comments()->create($request->all());
        $post = Post::FindOrFail($post);
        DB::table('comments')
            ->where('id', $comment->id)
            ->update(array('post_id' => $post->id));

        if ($comment) {
            return response()->json(
                [

                    'status' => 'success',
                    'message' => 'comment creer avec succes'
                ],
                201
            );
        }
    }

    /**
     * Display the specified resource.
     *
     * @param  \App\Models\Comment  $comment
     * @return \Illuminate\Http\Response
     */
    public function show(Comment $comment)
    {
        //
    }

    /**
     * Update the specified resource in storage.
     *
     * @param  \Illuminate\Http\Request  $request
     * @param  \App\Models\Comment  $comment
     * @return \Illuminate\Http\Response
     */
    public function update(Request $request, Comment $comment)
    {
        //
    }

    /**
     * Remove the specified resource from storage.
     *
     * @param  \App\Models\Comment  $comment
     * @return \Illuminate\Http\Response
     */
    public function destroy(Comment $comment)
    {
        //
    }
}
