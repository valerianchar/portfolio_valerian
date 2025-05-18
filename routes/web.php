<?php

use Illuminate\Support\Facades\Route;
use Inertia\Inertia;

Route::get('/', function () {
    return Inertia::render('Accueil');
})->name('accueil')

;Route::get('/curriculum-vitae', function () {
    return Inertia::render('CV');
})->name('curriculum-vitae');
