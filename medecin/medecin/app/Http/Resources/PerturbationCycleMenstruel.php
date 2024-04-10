<?php

namespace App\Http\Resources;

use Illuminate\Http\Resources\Json\JsonResource;
use Illuminate\Support\Facades\DB;

class PerturbationCycleMenstruel extends JsonResource
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
            'irregulariteDuCycle' => $this->irregulariteDuCycle,
            'modificationTotalDesRegles' => $this->modificationTotalDesRegles,
            'interruptionTotalDesRegles' => $this->interruptionTotalDesRegles,
            'secheressePeauMuquese' => $this->secheressePeauMuquese,
            'bouffeeDeChaleur' => $this->bouffeeDeChaleur,



        ];
    }
}
