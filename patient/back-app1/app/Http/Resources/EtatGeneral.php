<?php

namespace App\Http\Resources;

use Illuminate\Http\Resources\Json\JsonResource;

class EtatGeneral extends JsonResource
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
            'id' => $this->id,
            'presencePlaintes' => $this->presencePlaintes ? 'exist' : 'not exist',
            'fatigue' => $this->fatigue ? 'yes' : 'no',
            'capaciteTravaille' => $this->capaciteTravaille ? 'I can' : 'I can\'t',
            'activiterQuotidiennes' => $this->activiterQuotidiennes ? 'I can' : 'I can\'t',
            'autonomie' => $this->autonomie ? 'I can' : 'I can\'t',
            'douleur' => $this->douleur ? 'yes' : 'no',
            'anxietyDepression' => $this->anxietyDepression ? 'yes' : 'no',
        ];
    }
}
