<?php

namespace App\Http\Resources;

use Illuminate\Http\Resources\Json\JsonResource;



class User extends JsonResource
{
    /**
     * Transform the resource into an array.
     *
     * @param  \Illuminate\Http\Request  $request
     * @return array|\Illuminate\Contracts\Support\Arrayable|\JsonSerializable
     */


    public function toArray($request)
    {
        $dateNaissance = strtotime($this->dateNaissance);
        $now = time();
        $age = dateDiff($now, $dateNaissance);

        if ($this->role == 'patient') {
            return [
                'id' => $this->id,
                'ip' => $this->ip,
                'name' => $this->name,
                'role' => $this->role,
                'age' => (int) ($age['day'] / 365) . ' ans',
                'dateNaissance' => $this->dateNaissance,
                'sexe' => $this->sexe,


            ];
        } else {
            return [
                'ID' => $this->id,
                'email' => $this->email,
                'name' => $this->name,
                'role' => $this->role,
                'sexe' => $this->sexe,
            ];
        }
    }
}
