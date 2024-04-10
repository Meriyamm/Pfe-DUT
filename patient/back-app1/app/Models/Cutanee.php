<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;

class Cutanee extends Model
{
    use HasFactory;
    protected $guarded = [];

    public function symptoms()
    {
        return $this->morphMany(Symptom::class, 'symptomable');
    }

    public function organe()
    {
        return $this->belongsTo(Organe::class);
    }

    // public function suivi_extravations()
    // {
    //     return $this->hasMany(SuiviExtravation::class);
    // }

    // public function alopecies()
    // {
    //     return $this->hasMany(Alopecie::class);
    // }
}
