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
        Schema::create('consipations', function (Blueprint $table) {
            $table->id();
            $table->string('frequenceSelles');
            $table->boolean('douleurEtCrampe');
            $table->boolean('saignementDigestif');
            $table->boolean('vomissement');
            $table->boolean('fievre');
            $table->date('apparition');
            $table->integer('user_id');
            $table->integer('grade')->nullable();
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
        Schema::dropIfExists('consipations');
    }
};
