<?php

use Illuminate\Database\Migrations\Migration;
use Illuminate\Database\Schema\Blueprint;
use Illuminate\Support\Facades\Schema;

class CreateCuestionario1Table extends Migration
{
    /**
     * Run the migrations.
     *
     * @return void
     */
    public function up()
    {
        Schema::create('cuestionario1', function (Blueprint $table) {
            $table->id();
            $table->string('razon_social');
            $table->string('direccion');
            $table->string('telefono_fijo');
            $table->string('nombres_apellidos_encuestado');
            $table->string('celular');
            $table->string('correo');
            $table->string('cargo');
            $table->string('nombre_graduado');

            $table->unsignedBigInteger('alumno_id');
            $table->foreign('alumno_id')->references('id')->on('alumnos');

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
        Schema::dropIfExists('cuestionario1');
    }
}
