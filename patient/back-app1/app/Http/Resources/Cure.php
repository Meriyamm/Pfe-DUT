<?php

namespace App\Http\Resources;
use DateTime;


use Illuminate\Http\Resources\Json\JsonResource;

class Cure extends JsonResource
{
    /**
     * Transform the resource into an array.
     *
     * @param  \Illuminate\Http\Request  $request
     * @return array|\Illuminate\Contracts\Support\Arrayable|\JsonSerializable
     */
    public function toArray($request)
    {
        $dateCure = new DateTime($this->dateCure);
        $next = new DateTime($this->dateNextCure);
       
        return [
            'id' => $this->id,
            'last' => $dateCure->format('h:i A  d/m/y'),
            'next' => $next->format('h:i A  d/m/y'),
            'normalnext' => $this->dateNextCure,
            'analyses' => $this->analyses,
        ];
    }
}
