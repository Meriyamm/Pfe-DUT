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
        Schema::create('symptoms', function (Blueprint $table) {
            $table->id();
            $table->integer('toxicite_id');
            $table->foreignId('user_id')->constrained()->ondelete('cascade');
            $table->string('symptomable_id')->ondelete('cascade');
            $table->string('symptomable_type');
            // $table->foreign('toxicite_id')->references('id')->on('toxicites')->onDelete('cascade');
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
        Schema::dropIfExists('symptoms');
    }
};
