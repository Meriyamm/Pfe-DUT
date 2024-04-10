<?php

namespace App\Http\Resources;

use Illuminate\Http\Resources\Json\JsonResource;
use Illuminate\Support\Facades\DB;

class Cutanee extends JsonResource
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
        $organe = $this->organe_id;
        if ($organe == 1 || $organe == 2 || $organe == 3 || $organe == 4 || $organe == 5) {
            return [
                'ToxiciteCutaneeOrgane' => $this->organe->name,
                'Evaluer en : ' => date('Y-m-d h:m:s', $evaluer_en),
                'Apparution: ' => 'Apparaitre apres ' . $apparution['day'] . ' Jour et ' . $apparution['hour'] . ' heures et ' . $apparution['minute'] . ' minutes .',
                'photosensibilite' => $this->photosensibilite,
                'hyperpigmentation' => $this->hyperpigmentation,
                'infiltrationOedeme' => $this->infiltrationOedeme,
                'grade' => $this->grade,
                'RashCutanne' => [
                    'SurfaceAtteinte en %' => $this->SurfaceAtteinte,
                    'surInfection' => $this->surInfection,
                    'fievre' => $this->fievre? "oui": "non",
                    'ImpactSurActivite' => $this->ImpactSurActivite ? "oui": "non",
                ],
            ];
        } else if ($organe == 6) {
            return [
                'ToxiciteCutaneeOrgane' => $this->organe->name,
                'Evaluer en : ' => date('Y-m-d h:m:s', $evaluer_en),
                'Apparution: ' => 'Apparaitre apres ' . $apparution['day'] . ' Jour et ' . $apparution['hour'] . ' heures et ' . $apparution['minute'] . ' minutes .',
                'photosensibilite' => $this->photosensibilite,
                'hyperpigmentation' => $this->hyperpigmentation,
                'infiltrationOedeme' => $this->infiltrationOedeme,
                'grade' => $this->grade,
                'MainsPieds' => [
                    'oedemMainEtpieds' => $organe,
                    'douleur' => $organe,
                    'ImpactSurActivite' => $organe,
                    'fievre' => $organe,
                    'Dysesthésie' => $organe,
                    'rougeur' => $organe,
                ],
            ];
        } else {
            return [
                'ToxiciteCutaneeOrgane' => $this->organe->name,
                'Evaluer en : ' => date('Y-m-d h:m:s', $evaluer_en),
                'Apparution: ' => 'Apparaitre apres ' . $apparution['day'] . ' Jour et ' . $apparution['hour'] . ' heures et ' . $apparution['minute'] . ' minutes .',
                'photosensibilite' => $this->photosensibilite,
                'hyperpigmentation' => $this->hyperpigmentation,
                'infiltrationOedeme' => $this->infiltrationOedeme,
                'grade' => $this->grade,
                'Ongles' => [
                    'douleur' => $organe,
                    'prurit' => $organe,
                    'rougeur' => $organe,
                    'brulure' => $organe,
                ],

            ];
        }
    }
}
