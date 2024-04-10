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
        Schema::create('cutanees', function (Blueprint $table) {
            $table->id();
            $table->integer('SurfaceAtteinte')->nullable();
            $table->dateTime('delaiApparution')->nullable();
            $table->boolean('douleur')->nullable();
            $table->boolean('prurit')->nullable();
            $table->boolean('rougeur')->nullable();
            $table->boolean('brulure')->nullable();
            $table->boolean('fievre')->nullable();
            $table->string('surInfection')->nullable();
            $table->boolean('ImpactSurActivite')->nullable();
            $table->boolean('Dysesthésie')->nullable();
            $table->boolean('oedemMainEtpieds')->nullable();
            $table->boolean('infiltrationOedeme')->nullable();
            $table->boolean('photosensibilite')->nullable();
            $table->boolean('hyperpigmentation')->nullable();
            $table->integer('organe_id');
            $table->integer('user_id');
            $table->integer('grade')->nullable();
            //$table->foreignId('organe_id')->onDelete('cascade');
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
        Schema::dropIfExists('cutanees');
    }
};
