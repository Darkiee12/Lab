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
        Schema::create('course', function (Blueprint $table) {
            $table->string('id')->primary();
            $table->integer('course_level_id');
            $table->string('name')->nullable();
            $table->string('name_vn');
            $table->integer('credit_theory')->nullable();
            $table->integer('credit_lab')->nullable();
            $table->text('description');
            $table->timestamps();
        });
    }


    /**
     * Reverse the migrations.
     */
    public function down(): void
    {
        Schema::dropIfExists('courses');
    }
};
