<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;

class Alopecie extends Model
{
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
    public function organe()
    {
        return $this->belongsTo(Organe::class);
    }

    public function user()
    {
        return $this->belongsTo(User::class);
    }
}
