<?php

namespace App\Http\Resources;

use Illuminate\Http\Resources\Json\JsonResource;

class Toxicites extends JsonResource
{
    /**
     * Transform the resource into an array.
     *
     * @param  \Illuminate\Http\Request  $request
     * @return array|\Illuminate\Contracts\Support\Arrayable|\JsonSerializable
     */
    public function toArray($request)
    {
        // return [
        //     'name' => $this->name,
        //     'description' => $this->description ? $this->description : 'no descrption for now'
        // ];
        return [
            'id' => $this->id,
            'name' => $this->name,
            'description' => $this->description,
            'img' => $this->img,
        ];
    }
}
