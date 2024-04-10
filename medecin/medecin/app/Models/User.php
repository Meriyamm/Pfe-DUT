<?php

namespace App\Models;

use Illuminate\Contracts\Auth\MustVerifyEmail;
use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Foundation\Auth\User as Authenticatable;
use Illuminate\Notifications\Notifiable;
use Laravel\Sanctum\HasApiTokens;

class User extends Authenticatable
{
    use HasApiTokens, HasFactory, Notifiable;

    /**
     * The attributes that are mass assignable.
     *
     * @var array<int, string>
     */
    protected $guarded = [];

    /**
     * The attributes that should be hidden for serialization.
     *
     * @var array<int, string>
     */
    protected $hidden = [
        'password',
        'remember_token',
    ];

    /**
     * The attributes that should be cast.
     *
     * @var array<string, string>
     */
    protected $casts = [
        'email_verified_at' => 'datetime',
    ];

    public function etatgeneral()
    {
        return $this->hasMany(EtatGeneral::class);
    }

    public function consipation()
    {
        return $this->hasMany(Consipation::class);
    }
    public function diarrhee()
    {
        return $this->hasMany(Diarrhee::class);
    }
    public function nausee_vomiss()
    {
        return $this->hasMany(NauseeVomissement::class);
    }
    public function mucite()
    {
        return $this->hasMany(Mucite::class);
    }
    public function cutanee()
    {
        return $this->hasMany(Cutanee::class);
    }
    public function arthromylagique()
    {
        return $this->hasMany(Arthromyalgique::class);
    }

    public function perturbationcycle()
    {
        return $this->hasMany(PerturbationCycleMenstruel::class);
    }
    public function troublesexuality()
    {
        return $this->hasMany(TroubleSexuality::class);
    }

    public function neuroAnxeityDepretion()
    {
        return $this->hasMany(NeurologiqueAnxietyDepression::class);
    }

    public function symptoms()
    {
        return $this->hasMany(Symptom::class);
    }

    public function oculaire()
    {
        return $this->hasMany(Oculaire::class);
    }

    public function picture()
    {
        return $this->hasOne(Picture::class);
    }

    public function cures()
    {
        return $this->hasMany(Cure::class);
    }

    public function posts()
    {
        return $this->hasMany(Post::class);
    }


    public function comments()
    {
        return $this->hasMany(Comment::class);
    }

    public function suivi_extravations()
    {
        return $this->hasMany(SuiviExtravation::class);
    }

    public function alopecies()
    {
        return $this->hasMany(Alopecie::class);
    }
}
