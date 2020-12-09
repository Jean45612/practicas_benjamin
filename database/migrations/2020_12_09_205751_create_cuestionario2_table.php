<?php

use Illuminate\Database\Migrations\Migration;
use Illuminate\Database\Schema\Blueprint;
use Illuminate\Support\Facades\Schema;

class CreateCuestionario2Table extends Migration
{
    /**
     * Run the migrations.
     *
     * @return void
     */
    public function up()
    {
        Schema::create('cuestionario2', function (Blueprint $table) {
            $table->id();
            $table->string('nombres_apellidos');
            $table->char('dni',8);
            $table->date('fecha_nacimiento');
            $table->string('sexo');
            $table->string('direccion');
            $table->string('distrito');
            $table->string('provincia');
            $table->string('region');
            $table->string('pais');
            $table->string('telefono_fijo');
            $table->string('celular');
            $table->string('telefono_contacto');
            $table->string('correo1');
            $table->string('correo2');

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
        Schema::dropIfExists('cuestionario2');
    }
}
