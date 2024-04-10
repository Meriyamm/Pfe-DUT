<?php

namespace App\Http\Resources;

use Illuminate\Http\Resources\Json\JsonResource;
use Illuminate\Support\Facades\DB;

class Arthromyalgique extends JsonResource
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

            'Evaluer en : ' => date('Y-m-d h:m:s', $evaluer_en),
            'Apparution: ' => 'Apparaitre apres ' . $apparution['day'] . ' Jour et ' . $apparution['hour'] . ' heures et ' . $apparution['minute'] . ' minutes . de la date de la derniere cure ',
            // 'sousdocetaxel' => $this->sousdocetaxel ? 'Sous Docetaxel' : 'Non',
            'crampesMusculaires' => $this->crampesMusculaires ? 'Avec crampes Musculaires' : 'Sans Crampes Musculaires',
            'Douleur' => $this->douleurDiffuses ? 'Avec Douleur' : 'Sans Douleur',
            'arthralgies' => $this->arthralgies ? 'Avec arthralgie' : 'Sans arthralgie',
            'hanches' => $this->epaules ? 'dans les epaules' : 'Non',
            'hanches' => $this->hanches ? 'dans les hanches' : 'Non',
            'Douleur' => $this->membres ? 'dans les membres' : 'Non',

        ];
    }
}
