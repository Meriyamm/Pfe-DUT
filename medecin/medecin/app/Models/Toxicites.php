<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;

class Toxicites extends Model
{
    use HasFactory;

    protected $guarded = [];
    public function getAllTox( ){
        return $this->get();
    }

    public function symptoms()
    {
        return $this->hasMany(Symptom::class);
    }
}
