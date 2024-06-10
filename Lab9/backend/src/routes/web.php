<?php
use Illuminate\Support\Facades\Route;
use App\Http\Controllers\CourseController;
use App\Http\Controllers\ProgramController;
use App\Http\Controllers\CourseProgramController;

Route::get('/', function () {
    return view('welcome');
});
Route::get('courses', [CourseController::class, 'index']);
Route::get('courses/create', [CourseController::class, 'create']);
Route::post('courses', [CourseController::class, 'store']);
Route::get('courses/{course}', [CourseController::class, 'show']);
Route::get('courses/{course}/edit', [CourseController::class, 'edit']);
Route::put('courses/{course}', [CourseController::class, 'update']);
Route::delete('courses/{course}', [CourseController::class, 'destroy']);

Route::get('programs', [ProgramController::class, 'index']);
Route::get('programs/create', [ProgramController::class, 'create']);
Route::post('programs', [ProgramController::class, 'store']);
Route::get('programs/{program}', [ProgramController::class, 'show']);
Route::get('programs/{program}/edit', [ProgramController::class, 'edit']);
Route::put('programs/{program}', [ProgramController::class, 'update']);
Route::delete('programs/{program}', [ProgramController::class, 'destroy']);

Route::get('courses/{course}/programs', [CourseProgramController::class, 'index']);
Route::get('courses/{course}/programs/create', [CourseProgramController::class, 'create']);
Route::post('courses/{course}/programs', [CourseProgramController::class, 'store']);
Route::get('courses/{course}/programs/{program}', [CourseProgramController::class, 'show']);

