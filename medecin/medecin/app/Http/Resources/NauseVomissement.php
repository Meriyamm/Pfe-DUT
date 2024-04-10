<?php

namespace App\Http\Resources;

use DateTime;
use Illuminate\Http\Resources\Json\JsonResource;
use Illuminate\Support\Facades\DB;


function dateDiff($date1, $date2)
{
    $diff = abs($date1 - $date2); // abs pour avoir la valeur absolute, ainsi éviter d'avoir une différence négative
    $retour = array();

    $tmp = $diff;
    $retour['second'] = $tmp % 60;

    $tmp = floor(($tmp - $retour['second']) / 60);
    $retour['minute'] = $tmp % 60;

    $tmp = floor(($tmp - $retour['minute']) / 60);
    $retour['hour'] = $tmp % 24;

    $tmp = floor(($tmp - $retour['hour'])  / 24);
    $retour['day'] = $tmp;

    return $retour;
}

class NauseVomissement extends JsonResource
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

        $apparition = dateDiff($evaluer_en, $date);
        return [
            'Evaluer en : ' => date('Y-m-d h:m:s', $evaluer_en),
            'jour apres Cure : ' => $apparition,
            'momentApparition ' => $this->momentApparition ,
            'nbEpisodesParJr' => $this->nbEpisodesParJr,
            'DureeParJr'=>$this->DureeParJr,
            'nbrRepasParJr' => $this->nbrRepasParJr,
            'Déshydratation' => $this->Déshydratation ? 'avec Déshydratation' : 'sans Déshydratation',
            'fievre' => $this->fievre ? 'avec fievre' : 'sans fievre ',
            'grade' => $this->grade,
            'urinerPlusFoncer' => $this->urinerPlusFoncer ? 'avec urinerPlusFoncer' : 'sans urinerPlusFoncer',
            'urinermoinsFrequente' => $this->urinermoinsFrequente ? 'avec urinermoinsFrequente' : 'sans urinerPlusFoncer',
            'taraitementPrecis' => $this->taraitementPrecis ? 'avec taraitementPrecis' : 'sans taraitementPrecis',
            'AmelioreSoustaraitement' => $this->AmelioreSoustaraitement ? ' Ameliore Sous taraitement' : 'Ameliore sans taraitement',

        ];
    }
}
