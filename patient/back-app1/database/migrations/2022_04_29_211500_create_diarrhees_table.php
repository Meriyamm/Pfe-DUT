<?php

use Illuminate\Database\Migrations\Migration;
use Illuminate\Database\Schema\Blueprint;
use Illuminate\Support\Facades\Schema;

return new class extends Migration
{
    /**
     * Run the migrations.
     *
     * @return void
     */
    public function up()
    {
        Schema::create('diarrhees', function (Blueprint $table) {
            $table->id();
            $table->boolean('fievre');
            $table->integer('nbSellesParJr');
            $table->dateTime('dureeDeServeunu');
            $table->text('AspectSelles');
            $table->boolean('fatigue');
            $table->boolean('douleurAbdominal');
            $table->boolean('entreLesRepas');
            $table->boolean('Déshydratation');
            $table->boolean('Dénutrition');
            $table->boolean('saignementDigestif');
            $table->boolean('troubleNeurologique');
            $table->boolean('urinerPlusFoncerEtmoinsFrequente');
            $table->integer('grade')->nullable();
            $table->integer('user_id');
            $table->timestamps();
        });
    }

    /**
     * Reverse the migrations.
     *
     * @return void
     */
    public function down()
    {
        Schema::dropIfExists('diarrhees');
    }
};
