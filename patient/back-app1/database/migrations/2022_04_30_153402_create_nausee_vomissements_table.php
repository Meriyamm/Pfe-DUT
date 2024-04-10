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
        Schema::create('nausee_vomissements', function (Blueprint $table) {
            $table->id();
            $table->boolean('fievre');
            $table->integer('nbEpisodesParJr');
            $table->integer('nbrRepasParJr');
            $table->boolean('Déshydratation');
            $table->boolean('troubleNeurologique');
            $table->boolean('urinerPlusFoncerEtmoinsFrequente');
            $table->boolean('taraitementPrecis')->default(0);
            $table->boolean('AmelioreSoustaraitement')->default(0);
            $table->integer('grade')->nullable();
            $table->integer('user_id');
            $table->foreign('user_id')->references('id')->on('users')->onDelete('cascade');
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
        Schema::dropIfExists('nausee_vomissements');
    }
};
