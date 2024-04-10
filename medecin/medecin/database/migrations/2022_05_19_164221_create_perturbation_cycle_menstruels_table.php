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
        Schema::create('perturbation_cycle_menstruels', function (Blueprint $table) {
            $table->id();
            $table->boolean('irregulariteDuCycle');
            $table->boolean('modificationTotalDesRegles');
            $table->boolean('interruptionTotalDesRegles');
            $table->boolean('bouffeeDeChaleur');
            $table->boolean('secheressePeauMuquese');
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
        Schema::dropIfExists('perturbation_cycle_menstruels');
    }
};
