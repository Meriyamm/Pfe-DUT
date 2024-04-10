<?php

namespace App\Http\Requests;

use Illuminate\Foundation\Http\FormRequest;

class CutaneeRequest extends FormRequest
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
            'organe_id' => 'required',
            // 'SurfaceAtteinte%' => 'required',
            // 'douleur' => 'required',
            // 'prurit' => 'required',
            // 'rougeur' => 'required',
            // 'fievre' => 'required',
            // 'ImpactSurActivite' => 'required',
            // 'metalineExcessive' => 'required',
            // 'SousDocetaxel' => 'required',
            // 'oedem' => 'required',
            // 'photosensibilite' => 'required',
            // 'hyperpigmentation' => 'required'
        ];
    }
}
