<?php

namespace App\Http\Requests;

use Illuminate\Foundation\Http\FormRequest;

class PerturbationCycleMenstruelRequest extends FormRequest
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
            'irregulariteDuCycle' => 'required',
            'modificationTotalDesRegles' => 'required',
            'bouffeeDeChaleur' => 'required',
            'secheressePeauMuquese' => 'required',
            'interruptionTotalDesRegles' => 'required',
        ];
    }
}
