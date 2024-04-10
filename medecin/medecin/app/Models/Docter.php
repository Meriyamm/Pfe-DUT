<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;
use Illuminate\Notifications\Notifiable;
use Laravel\Sanctum\HasApiTokens;

class Docter extends Model
{
    use HasApiTokens, HasFactory, Notifiable;

    protected $guarded = [];

    public function comments()
    {
        return $this->hasMany(Comment::class);
    }
}
