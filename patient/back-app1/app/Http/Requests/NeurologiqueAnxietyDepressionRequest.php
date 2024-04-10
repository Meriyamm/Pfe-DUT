<?php

namespace App\Http\Requests;

use Illuminate\Foundation\Http\FormRequest;

class NeurologiqueAnxietyDepressionRequest extends FormRequest
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
            'palmoPalantaire' => 'required',
            'periBuccale' => 'required',
            'AtteinteUniOrBilaterale' => 'required',
            'Picotements' => 'required',
            'dysethesies' => 'required',
            'fourmillements' => 'required',
            'Engourdissements' => 'required',
            'SensationDeFroidDouloureux' => 'required',
            'frottement' => 'required',
            'HypoesthesieAuTact' => 'required',
            'difficulterAgravirLesEscaliers' => 'required',
            'difficulterExtentionDoigts' => 'required',
            'ImpactSurActivite' => 'required',
            'enervee' => 'required',
            'peur' => 'required',
            'plaisirCommeAvant' => 'required',
            'Positive' => 'required',
            'SensationDecontracte' => 'required',
            'SensationPaniquee' => 'required',
            'DesintererALapparence' => 'required',

        ];
    }
}
