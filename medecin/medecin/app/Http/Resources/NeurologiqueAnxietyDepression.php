<?php

namespace App\Http\Resources;

use Illuminate\Http\Resources\Json\JsonResource;
use Illuminate\Support\Facades\DB;

class NeurologiqueAnxietyDepression extends JsonResource
{
    /**
     * Transform the resource into an array.
     *
     * @param  \Illuminate\Http\Request  $request
     * @return array|\Illuminate\Contracts\Support\Arrayable|\JsonSerializable
     */
    public function toArray($request)
    {
        $evaluer_en = strtotime($this->created_at);
        $date = DB::table('cures')->latest('dateCure')->first();
        $date = strtotime($date->dateCure);
        $apparution = dateDiff($evaluer_en, $date);
        return [
            'id' => $this->id,
            'Evaluer en' => date('y-m-d h:i:s', $evaluer_en),
            'Apparution: ' => 'Apparaitre apres ' . $apparution['day'] . ' Jour et ' . $apparution['hour'] . ' heures et ' . $apparution['minute'] . ' minutes . de la date de la derniere cure ',
            'palmoPalantaire' => $this->palmoPalantaire ? 'palmo-Palantaire' : 'none',
            'periBuccale' => $this->periBuccale ? 'peri Buccale' : 'none',
            'AtteinteUniOrBilaterale' => $this->AtteinteUniOrBilaterale ? 'Atteinte Uni Or Bilaterale' : 'none',
            'Picotements' => $this->Picotements ? 'Picotements' : 'none',
            'dysethesies' => $this->dysethesies ? 'dysethesies' : 'none',
            'fourmillements' => $this->fourmillements ? 'fourmillements' : 'none',
            'Engourdissements' => $this->Engourdissements ? 'Engourdissements' : 'none',
            'SensationDeFroidDouloureux' => $this->SensationDeFroidDouloureux ? 'SensationDeFroidDouloureux' : 'none',
            'frottement' => $this->frottement ? 'frottement' : 'none',
            'HypoesthesieAuTact' => $this->HypoesthesieAuTact ? 'HypoesthesieAuTact' : 'none',
            'difficulterAgravirLesEscaliers' => $this->difficulterAgravirLesEscaliers ? 'difficulterAgravirLesEscaliers' : 'none',
            'difficulterExtentionDoigts' => $this->difficulterExtentionDoigts ? 'difficulterExtentionDoigts' : 'none',
            'ImpactSurActivite' => $this->ImpactSurActivite ? 'ImpactSurActivite' : 'none',
            'enervee' => $this->enervee ? 'enervee' : 'none',
            'peur' => $this->peur ? 'peur' : 'none',
            'plaisirCommeAvant' => $this->plaisirCommeAvant ? 'plaisirCommeAvant' : 'none',
            'Positive' => $this->Positive ? 'Positive' : 'none',
            'SensationDecontracte' => $this->SensationDecontracte ? 'SensationDecontracte' : 'none',
            'SensationPaniquee' => $this->SensationPaniquee ? 'SensationPaniquee' : 'none',
            'DesintererALapparence' => $this->DesintererALapparence ? 'DesintererALapparence' : 'none',

        ];
    }
}
