<?php

use Illuminate\Support\Facades\Route;

/*
|--------------------------------------------------------------------------
| Web Routes
|--------------------------------------------------------------------------
|
| Here is where you can register web routes for your application. These
| routes are loaded by the RouteServiceProvider within a group which
| contains the "web" middleware group. Now create something great!
|
*/


Route::get('contact', function () {
    return 'c\'est moi le contact';
});

Route::get('{n}', function ($n) {
    return 'Je suis a la page ' . $n . '!';
})->name('home');
