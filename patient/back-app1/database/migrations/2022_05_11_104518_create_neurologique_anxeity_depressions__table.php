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
        Schema::create('neurologique_anxiety_depressions', function (Blueprint $table) {
            $table->id();
            $table->boolean('palmoPalantaire');
            $table->boolean('periBuccale');
            $table->boolean('AtteinteUniOrBilaterale');
            // those items for the DN4 quiz
            $table->boolean('Picotements');
            $table->boolean('dysethesies');
            $table->boolean('fourmillements');
            $table->boolean('Engourdissements');
            $table->boolean('Demangeaisons');
            $table->boolean('SensationDeFroidDouloureux');
            $table->boolean('frottement'); // La douleur est-­‐elle provoquée ou augmentée par :
            $table->boolean('HypoesthesieAuTact');
            //The end of the DN4 quiz
            $table->boolean('difficulterAgravirLesEscaliers');
            $table->boolean('difficulterExtentionDoigts');
            $table->boolean('ImpactSurActivite');
            //some HADS questions to evaluate depression and anxeity
            $table->boolean('enervee');
            $table->boolean('peur');
            $table->boolean('plaisirCommeAvant'); //Je prends plaisir aux mêmes choses qu’autrefois
            $table->boolean('Positive'); // Je ris facilement et vois le bon côté des choses
            $table->boolean('SensationDecontracte');
            $table->boolean('SensationPaniquee');
            $table->boolean('DesintererALapparence'); 
            //Je ne m’intéresse plus à mon apparence :
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
        Schema::dropIfExists('neurologique_anxiety_depretions');
    }
};
