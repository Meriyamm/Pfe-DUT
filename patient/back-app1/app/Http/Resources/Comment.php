<?php

namespace App\Http\Resources;

use App\Http\Resources\User as UserResources;


use Illuminate\Http\Resources\Json\JsonResource;

class Comment extends JsonResource
{
    /**
     * Transform the resource into an array.
     *
     * @param  \Illuminate\Http\Request  $request
     * @return array|\Illuminate\Contracts\Support\Arrayable|\JsonSerializable
     */
    public function toArray($request)
    {
        return [
            'Commentaire' => $this->comment,
            'user' => new UserResources($this->user)
        ];
    }
}
