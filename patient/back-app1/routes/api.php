<?php

use Illuminate\Http\Request;
use Illuminate\Support\Facades\Route;
use App\Http\Controllers\AuthController;
use App\Http\Controllers\CommentController;
use App\Http\Controllers\ConsipationController;
use App\Http\Controllers\ConversationController;
use App\Http\Controllers\CureController;
use App\Http\Controllers\DiarrheeController;
use App\Http\Controllers\MuciteController;
use App\Http\Controllers\DocterController;
use App\Http\Controllers\EtatGeneralController;
use App\Http\Controllers\NauseeVomissementController;
use App\Http\Controllers\PostController;
use App\Http\Controllers\ToxicitesController;
use App\Http\Controllers\NeurologiqueAnxietyDepressionController;
use App\Http\Controllers\OrganeController;
use App\Http\Controllers\CutaneeController;
use App\http\Controllers\AlopecieController;
use App\Http\Controllers\BilanController;
use App\Http\Controllers\SuiviExtravationController;
use App\Models\EtatGeneral;
use App\Http\Controllers\OculaireController;
use App\Http\Controllers\PerturbationCycleMenstruelController;
use App\Http\Controllers\TroubleSexualityController;
use App\Http\Controllers\ArthromyalgiqueController;


/*
|--------------------------------------------------------------------------
| API Routes
|--------------------------------------------------------------------------
|
| Here is where you can register API routes for your application. These
| routes are loaded by the RouteServiceProvider within a group which
| is assigned the "api" middleware group. Enjoy building your API!
|
*/

function dateDiff($date1, $date2)
{
    $diff = abs($date1 - $date2); // abs pour avoir la valeur absolute, ainsi éviter d'avoir une différence négative
    $retour = array();

    $tmp = $diff;
    $retour['second'] = $tmp % 60;

    $tmp = floor(($tmp - $retour['second']) / 60);
    $retour['minute'] = $tmp % 60;

    $tmp = floor(($tmp - $retour['minute']) / 60);
    $retour['hour'] = $tmp % 24;

    $tmp = floor(($tmp - $retour['hour'])  / 24);
    $retour['day'] = $tmp;

    return $retour;
}



Route::middleware('auth:sanctum')->get('/user', function (Request $request) {
    return $request->user();
});

// Route::group([
//     'prefix' => 'auth'
// ], function () {
//     //  Route::post('login', [AuthController::class, 'login']);
//     Route::post('signup', [AuthController::class, 'signup']);

//     Route::group([
//         'middleware' => 'auth:api'
//     ], function () {
//         Route::get('logout', [AuthController::class, 'logout']);
//         Route::get('user', [AuthController::class, 'user']);
//         Route::get('conversation', [ConversationController::class, 'conversation']);
//     });
//     // Route::get('/home', 'HomeController@index')->name('home');
// });
Route::post('patient/login', [AuthController::class, 'login']);
Route::post('signup', [AuthController::class, 'signup']);
Route::get('atest', function () {
    $now   = time();
    $date2 = strtotime('2022-5-7 16:01:05');
    $date = dateDiff($now, $date2);
    return response()->json($date['hour']);
});
// Route::post('docter/signup', [DocterController::class, 'signup']);
// Route::post('docter/login', [DocterController::class, 'login_docter']);

Route::group(['middleware' => 'auth:sanctum'], function () {
    Route::get('logout', [AuthController::class, 'logout']);
    Route::get('docter/logout', [AuthController::class, 'logout_docter']);
    Route::get('users', [AuthController::class, 'users']);
    //posts
    Route::resource('posts', PostController::class)->except('show', 'create', 'edit');
    Route::get('user/posts', [PostController::class, 'user_posts']);
    Route::get('posts/{id}', [PostController::class, 'show']);

    //etat general
    Route::resource('etatgenerals', EtatGeneralController::class)->except('show', 'create', 'edit');
    //Route::get('etatgeneral', [EtatGeneralController::class, 'index']);
    //consipation
    Route::resource('consipations', ConsipationController::class)->except('show', 'create', 'edit');
    //diarrhees
    Route::resource('diarrhees', DiarrheeController::class)->except('show', 'create', 'edit');
    //nausee_vomissement
    Route::resource('nausee_vomissements', NauseeVomissementController::class)->except('show', 'create', 'edit');
    //mucite
    Route::resource('mucite', MuciteController::class)->except('show', 'create', 'edit');
    //cures
    Route::resource('cures', CureController::class)->except('show', 'create', 'edit');

    // Route::delete('delete/etatGeneral/{id}', [EtatGeneralController::class, 'destroy']);
    // Route::post('etatgeneral', [EtatGeneralController::class, 'store']);
    // Route::post('update/etatGeneral/{id}', [EtatGeneralController::class, 'update']);
    Route::get('user/etatgenerals', [EtatGeneralController::class, 'user_etat_generals']);
    //toxicites
    Route::get('toxicites', [ToxicitesController::class, 'GetAll']);
    Route::post('update/tox/{id}', [ToxicitesController::class, 'update']);
    Route::delete('delete/tox/{id}', [ToxicitesController::class, 'destroy']);
    //Route::get('toxicites', [ToxicitesController::class, 'index']);
    Route::resource('comments', CommentController::class)->except('show', 'create', 'edit');
    Route::resource('cutanees', CutaneeController::class)->except('show', 'create', 'edit');
    //Neurologique Anxiety Depression
    Route::resource('neuro', NeurologiqueAnxietyDepressionController::class)->except('show', 'create', 'edit');

    //see comments
    Route::get('comments/{id}', [CommentController::class, 'index']);
    // consulter le bilan
    Route::get('bilan', [BilanController::class, 'index']);
    //Cutanee | Suivi d'une extravation cutanee s'il existe ;
    Route::post('suiviextravations', [SuiviExtravationController::class, 'store']);
    //Cutanee | Alopecie s'il existe ;
    Route::post('alopecies', [AlopecieController::class, 'store']);
    //arthromyalgiques
    Route::resource('arth', ArthromyalgiqueController::class)->except('show', 'create', 'edit');
    //Ocullaire
    Route::resource('oculaire', OculaireController::class)->except('show', 'create', 'edit');
    //Perturbation du cycle menstruel
    Route::resource('perturb', PerturbationCycleMenstruelController::class)->except('show', 'create', 'edit');
    // trouble sexualites
    Route::resource('sexuality', TroubleSexualityController::class)->except('show', 'create', 'edit');
});
Route::get('toxicites', [ToxicitesController::class, 'GetAll']);

Route::get('comments/{id}', [CommentController::class, 'index']);
Route::post('comment/{id}', [CommentController::class, 'store']);
