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
        Schema::create('trouble_sexualities', function (Blueprint $table) {
            $table->id();
            $table->boolean('secheresseVaginale');
            $table->boolean('DemangeaisonsGenitales');
            $table->boolean('InconfortIntime');
            $table->boolean('dyspareunie');
            $table->boolean('gynecomastie');
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
        Schema::dropIfExists('trouble_sexualities');
    }
};
