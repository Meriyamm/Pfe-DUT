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
        Schema::create('mucitees', function (Blueprint $table) {
            $table->id();
            $table->string('momentApparition');
            $table->boolean('douleur');
            $table->string('priseAlimentaire');
            $table->string('voix');
            $table->string('deglutition');
            $table->string('langue');
            $table->string('salive');
            $table->string('muqueuse');
            $table->string('gencive');
            $table->string('dents');
            $table->string('levres');
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
        Schema::dropIfExists('mucitees');
    }
};
