<?php

namespace App\Http\Resources;

use Illuminate\Http\Resources\Json\JsonResource;

class Alopecie extends JsonResource
{
    /**
     * Transform the resource into an array.
     *
     * @param  \Illuminate\Http\Request  $request
     * @return array|\Illuminate\Contracts\Support\Arrayable|\JsonSerializable
     */
    public function toArray($request)
    {
        $user = auth()->user();
        $evaluer_en = strtotime($this->created_at);
        $date = DB::table('cures')->latest('dateCure')->first();
        $date = strtotime($date->dateCure);
        $apparution = dateDiff($evaluer_en, $date);
        return [
            'Evaluer En' => date('Y-m-d h:i:s', $evaluer_en),
            'Apparution: ' => 'Apparaitre apres ' . $apparution['day'] . ' Jour et ' . $apparution['hour'] . ' heures et ' . $apparution['minute'] . ' minutes . de la date de la derniere cure ',
            'AlopecieOrgane' => $this->organe->name,
            'for' => new UserResources($user),

        ];
    }
}
