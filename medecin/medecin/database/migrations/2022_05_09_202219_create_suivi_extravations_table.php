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
        Schema::create('suivi_extravations', function (Blueprint $table) {
            $table->id();
            $table->boolean('fievre');
            $table->boolean('anthracyclines')->nullable();  // c'est un médicament anticancéreux
            $table->boolean('favorable')->nullable();
            $table->boolean('grave');
            $table->integer('grade')->nullable();
            //$table->integer('user_id');
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
        Schema::dropIfExists('suivi_extravations');
    }
};
