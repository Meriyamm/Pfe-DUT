<?php

namespace App\Http\Resources;

use DateTime;
use Illuminate\Http\Resources\Json\JsonResource;

class Diarrhee extends JsonResource
{
    /**
     * Transform the resource into an array.
     *
     * @param  \Illuminate\Http\Request  $request
     * @return array|\Illuminate\Contracts\Support\Arrayable|\JsonSerializable
     */
    public function toArray($request)
    {
        $date = new DateTime($this->dureeDeServeunu);
        $evaluer_en = new DateTime($this->created_at);
        return [
            'Evaluer en : ' => $evaluer_en->format('Y-d-m h:m:s '),
            'nbSellesParJr' => ($this->nbSellesParJr) > 4 ? 'pas normal' : 'normal',
            'saignementDigestif' => $this->saignementDigestif ? 'avec siagnement degestive' : 'sans saignement digestive',
            'dureeDeServeunu' => $date->format('Y-d-m'),
            'fatigue' => $this->fatigue ? 'oui' : 'non',
            'douleurAbdominal' => $this->douleurAbdominal ? 'avec douleurAbdominal' : 'sans douleurAbdominal',
            'entreLesRepas' => $this->entreLesRepas ? ' entreLesRepas' : 'pas entreLesRepas',
            'Déshydratation' => $this->Déshydratation ? 'avec Déshydratation' : 'sans Déshydratation',
            'Dénutrition' => $this->Dénutrition ? 'avec Dénutrition' : 'sans Dénutrition',
            'fievre' => $this->fievre ? 'avec fievre' : 'sans fievre ',
            'grade' => $this->grade,
            'troubleNeurologique' => $this->troubleNeurologique ? 'avec troubleNeurologique' : 'sans troubleNeurologique',
            'urinerPlusFoncerEtmoinsFrequente' => $this->urinerPlusFoncerEtmoinsFrequente ? 'avec urinerPlusFoncerEtmoinsFrequente' : 'sans urinerPlusFoncerEtmoinsFrequente',
        ];
    }
}
