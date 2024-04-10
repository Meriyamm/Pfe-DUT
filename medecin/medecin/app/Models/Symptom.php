<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;

class Symptom extends Model
{
    use HasFactory;

    protected $guarded = [];

    public function symptomable()
    {
        return $this->morphTo();
    }

    public function toxicite()
    {
        return $this->belongsTo(Toxicites::class);
    }
    public function user()
    {
        return $this->belongsTo(User::class);
    }
}
