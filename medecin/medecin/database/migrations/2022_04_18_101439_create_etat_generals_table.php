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
        Schema::create('etat_generals', function (Blueprint $table) {
            $table->id();
            $table->boolean('presencePlaintes');
            $table->boolean('fatigue');
            $table->boolean('capaciteTravaille');
            $table->boolean('activiterQuotidiennes');
            $table->boolean('autonomie');
            $table->boolean('douleur');
            $table->boolean('anxietyDepression');
            $table->foreignId('user_id')->ondelete('cascade');
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
        Schema::dropIfExists('etat_generals');
    }
};
