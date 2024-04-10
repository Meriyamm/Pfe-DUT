<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;

class Organe extends Model
{
    use HasFactory;

    protected $guarded = [];
    public $timestamps = false;

    public function cutanees()
    {
        return $this->hasMany(Cutanee::class);
    }

    public function alopecies()
    {
        return $this->hasMany(Alopecie::class);
    }
}
