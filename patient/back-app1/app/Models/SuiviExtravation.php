<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;

class SuiviExtravation extends Model
{
    use HasFactory;

    use HasFactory;

    protected $guarded = [];


    // public function cutanee()
    // {
    //     return $this->belongsTo(Cutanee::class);
    // }

    public function symptoms()
    {
        return $this->morphMany(Symptom::class, 'symptomable');
    }

    public function user()
    {
        return $this->belongsTo(User::class);
    }
}
