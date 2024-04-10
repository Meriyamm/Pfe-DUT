<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;

class NeurologiqueAnxietyDepression extends Model
{
    use HasFactory;



    protected $guarded = [];


    public function symptoms()
    {
        return $this->morphMany(Symptom::class, 'symptomable');
    }

    public function user()
    {
        return $this->belongsTo(User::class);
    }
}
