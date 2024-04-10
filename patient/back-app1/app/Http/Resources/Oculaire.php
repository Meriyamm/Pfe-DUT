<?php

namespace App\Http\Resources;

use Illuminate\Http\Resources\Json\JsonResource;
use Illuminate\Support\Facades\DB;

class Oculaire extends JsonResource
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
            'Evaluer en : ' => date('Y-m-d h:m:s', $evaluer_en),
            'Apparution: ' => 'Apparaitre apres ' . $apparution['day'] . ' Jour et ' . $apparution['hour'] . ' heures et ' . $apparution['minute'] . ' minutes . de la date de la derniere cure ',
            // 'sousdocetaxel' => $this->sousdocetaxel ? 'Sous Docetaxel' : 'Non',
            'Rougeur' => $this->Rougeur ? 'Avec Rougeur' : 'Sans Rougeur',
            'larmoiement' => $this->larmoiement ? 'Avec larmoiement' : 'Sans larmoiement',
            'oedem' => $this->oedem ? 'Avec oedem' : 'Sans oedem',
            'sensationDepicotement' => $this->sensationDepicotement ? 'Avec sensation Depicotement' : 'Sans sensation Depicotement',
            'conduireVehicule' => $this->conduireVehicule ? 'conduire Vehicule' : 'Non',
            'lire' => $this->lire ? ' lire' : 'Non',
            'maquiller' => $this->maquiller ? 'se maquiller' : 'Non',
            'Fievre' => $this->Fievre ? 'Avec Fievre' : 'Sans Fievre',

        ];
    }
}
