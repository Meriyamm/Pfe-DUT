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
        Schema::create('cures', function (Blueprint $table) {
            $table->id();
            $table->string('analyses')->nullable();
            $table->dateTime('dateCure');
            $table->dateTime('dateNextCure')->nullable();
            $table->integer('user_id');
            // $table->timestamps();
        });
    }

    /**
     * Reverse the migrations.
     *
     * @return void
     */
    public function down()
    {
        Schema::dropIfExists('cures');
    }
};
