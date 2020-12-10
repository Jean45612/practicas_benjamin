<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;

class Cuestionario2 extends Model
{
    use HasFactory;

    protected $table = "cuestionario2";

    protected $fillable = [
        'nombres_apellidos',
        'dni',
        'fecha_nacimiento',
        'sexo',
        'direccion',
        'distrito',
        'provincia',
        'region',
        'pais',
        'telefono_fijo',
        'celular',
        'telefono_contacto',
        'correo1',
        'correo2',
        'alumno_id'
    ];
}
