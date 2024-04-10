<?php

namespace App\Http\Requests;

use Illuminate\Foundation\Http\FormRequest;

class DiarrheeRequest extends FormRequest
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
            'nbSellesParJr' => 'required',
            'saignementDigestif' => 'required',
            'douleurAbdominal' => 'required',
            'entreLesRepas' => 'required',
            'Déshydratation' => 'required',
            'fatigue'=>'required',
            'Dénutrition' => 'required',
            'troubleNeurologique' => 'required',
            'fievre' => 'required',
            'urinerPlusFoncerEtmoinsFrequente' => 'required',

        ];
    }
}
