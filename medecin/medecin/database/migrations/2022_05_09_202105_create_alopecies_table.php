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
        Schema::create('alopecies', function (Blueprint $table) {
            $table->id();
           // $table->integer('organe_id');
            $table->foreignId('organe_id')->onDelete('cascade');
            $table->dateTime('evaluer_en')->nullable();
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
        Schema::dropIfExists('alopecies');
    }
};
