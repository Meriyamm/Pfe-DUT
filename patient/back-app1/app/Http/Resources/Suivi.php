<?php

namespace App\Http\Resources;

use DateTime;
use Illuminate\Http\Resources\Json\JsonResource;

class Suivi extends JsonResource
{
    /**
     * Transform the resource into an array.
     *
     * @param  \Illuminate\Http\Request  $request
     * @return array|\Illuminate\Contracts\Support\Arrayable|\JsonSerializable
     */
    public function toArray($request)
    {
        $date = new (new DateTime($request->created_at));
        $date = $date->format('Y-m-d h:i:s');
        return [
            'evaluer en ' => $date,
            'fievre' => $this->fievre ? 'avec fievre ' : 'sans fievre',
            'anthracyclines' => $this->anthracyclines ? 'avec anthracyclines' : 'sans anthracyclines',
            'grave' => $this->grave ? 'etat grave ' : 'etat favorable',
            'favorable' => !$this->favorable ? 'etat favorable ' : 'etat grave'

        ];
    }
}
