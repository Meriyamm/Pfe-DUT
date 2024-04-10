<?php

namespace App\Http\Requests;

use Illuminate\Foundation\Http\FormRequest;

class OculaireRequest extends FormRequest
{
    /**
     * Determine if the user is authorized to make this request.
     *
     * @return bool
     */
    public function authorize()
    {
        return auth()->check();
    }

    /**
     * Get the validation rules that apply to the request.
     *
     * @return array
     */
    public function rules()
    {
        return [
            'Fievre' => 'required',
            // 'sousdocetaxel' => 'required',
            'Rougeur' => 'required',
            'larmoiement' => 'required',
            'oedem' => 'required',
            'conduireVehicule' => 'required',
            'lire' => 'required',
            'maquiller' => 'required'

        ];
    }
}
