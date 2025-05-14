<?php

use Illuminate\Support\Facades\Route;
use Inertia\Inertia;

Route::get('/', function () {
    return Inertia::render('Accueil');
})->name('accueil')

;Route::get('/cursus-vitae', function () {
    return Inertia::render('CV');
})->name('cursus-vitae');
