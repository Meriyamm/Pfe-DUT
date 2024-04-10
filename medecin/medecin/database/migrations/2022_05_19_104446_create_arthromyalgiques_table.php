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
        Schema::create('arthromyalgiques', function (Blueprint $table) {
            $table->id();
            $table->boolean('crampesMusculaires');
            $table->boolean('douleurDiffuses');
            $table->boolean('arthralgies');
            $table->boolean('hanches');
            $table->boolean('epaules');
            $table->boolean('membres');
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
        Schema::dropIfExists('arthromyalgiques');
    }
};
