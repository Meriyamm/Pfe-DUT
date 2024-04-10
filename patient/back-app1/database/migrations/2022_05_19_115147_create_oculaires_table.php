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
        Schema::create('oculaires', function (Blueprint $table) {
            $table->id();
            // $table->boolean('sousdocetaxel');
            $table->boolean('Rougeur');
            $table->boolean('larmoiement');
            $table->boolean('oedem');
            $table->boolean('sensationDepicotement');
            $table->boolean('conduireVehicule');
            $table->boolean('lire');
            $table->boolean('maquiller');
            $table->boolean('Fievre');
            // $table->integer('user_id');
            $table->foreignId('user_id')->onDelete('cascade');
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
        Schema::dropIfExists('oculaires');
    }
};
