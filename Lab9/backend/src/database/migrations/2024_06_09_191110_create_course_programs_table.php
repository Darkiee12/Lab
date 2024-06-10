<?php

use Illuminate\Database\Migrations\Migration;
use Illuminate\Database\Schema\Blueprint;
use Illuminate\Support\Facades\Schema;

return new class extends Migration
{
    /**
     * Run the migrations.
     */
    public function up()
    {
        Schema::create('course_program', function (Blueprint $table) {
            $table->string('course_id');
            $table->integer('program_id');
            $table->string('course_code');
            $table->integer('course_type_id');
            $table->timestamps();

            $table->unique(['course_id', 'program_id']);
            $table->foreign('course_id')->references('id')->on('course')->onDelete('cascade')->onUpdate('cascade');
            $table->foreign('program_id')->references('id')->on('program')->onDelete('cascade')->onUpdate('cascade');
        });
    }


    /**
     * Reverse the migrations.
     */
    public function down(): void
    {
        Schema::dropIfExists('course_programs');
    }
};
