<?php

namespace App\Http\Resources;

use Illuminate\Http\Resources\Json\JsonResource;
use Illuminate\Support\Facades\DB;

class mucitee extends JsonResource
{
    /**
     * Transform the resource into an array.
     *
     * @param  \Illuminate\Http\Request  $request
     * @return array|\Illuminate\Contracts\Support\Arrayable|\JsonSerializable
     */
    public function toArray($request)
    {
        $priseAlimentaire = ($this->priseAlimentaire == 1) ? "modifier" : (($this->priseAlimentaire == 0)  ? "impossible" : "Normal");
        $evaluer_en = strtotime($this->created_at);
        $date = DB::table('cures')->latest('dateCure')->first();
        $date = strtotime($date->dateCure);

        $momentApparition = dateDiff($evaluer_en, $date);

        return [
            'Evaluer en' => date('Y-m-d h:m:s', $evaluer_en),
            'Apparu apres la cure avec : ' => $momentApparition,
            'douleur' => $this->douleur,
            'priseAlimentaire' => $priseAlimentaire,
            'voix' => $this->voix,
            'deglutition' => $this->deglutition,
            'langue' => $this->langue,
            'salive' => $this->salive,
            'muqueuse' => $this->muqueuse,
            'gencive' => $this->gencive,
            'dents' => $this->dents,
            'levres' => $this->levres,
            'score' => $this->score,
            'grade' => $this->grade,
        ];
    }
}
