<?php

namespace App\Http\Resources;

use DateTime;
use Illuminate\Http\Resources\Json\JsonResource;
use App\Http\Resources\User as UserResources;


class Symptom extends JsonResource
{
    /**
     * Transform the resource into an array.
     *
     * @param  \Illuminate\Http\Request  $request
     * @return array|\Illuminate\Contracts\Support\Arrayable|\JsonSerializable
     */
    public function toArray($request)
    {
        $date = new DateTime($this->symptomable->created_at);
        return [
            // 'user' => new UserResources($this->user),
            'tox' => $this->toxicite->name,
            'img' => $this->toxicite->img,
            'symp' => substr($this->symptomable_type, 11),
            'created_at' => $date->format('d-m-Y h:m:s'),
            'grade' => $this->symptomable->grade

        ];
    }
}
