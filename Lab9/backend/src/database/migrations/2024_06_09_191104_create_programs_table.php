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
        Schema::create('program', function (Blueprint $table) {
            $table->increments('id');
            $table->string('name')->nullable();
            $table->integer('duration')->nullable();
            $table->string('version', 4)->nullable();
            $table->integer('major_id')->nullable();
            $table->integer('program_type_id');
            $table->string('valid_from')->nullable();
            $table->timestamps();
        });
    }

    /**
     * Reverse the migrations.
     */
    public function down(): void
    {
        Schema::dropIfExists('programs');
    }
};
