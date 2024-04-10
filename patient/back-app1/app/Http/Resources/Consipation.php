<?php

namespace App\Http\Resources;

use Illuminate\Http\Resources\Json\JsonResource;
use Illuminate\Support\Facades\DB;

class Consipation extends JsonResource
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

            'depuis' => $this->apparition . ' jours',
            'frequenceSelles' => $this->frequenceSelles = 'persistante' ? 'pas normal' : 'normal',
            'douleurEtCrampe' => $this->douleurEtCrampe ? 'avec douleur' : 'sans douleur',
            'saignementDigestif' => $this->saignementDigestif ? 'avec siagnement degestive' : 'sans saignement digestive',
            'vomissement' => $this->vomissement ? 'avec vomissement' : 'sans vomissement',
            'fievre' => $this->fievre ? 'avec fievre' : 'sans fievre',
            'grade' => $this->grade
        ];
    }
}
