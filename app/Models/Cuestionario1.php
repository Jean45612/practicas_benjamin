<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;

class Cuestionario1 extends Model
{
    use HasFactory;

    protected $table = "cuestionario1";

    protected $fillable = [
        'razon_social',
        'direccion',
        'telefono_fijo',
        'nombres_apellidos_encuestado',
        'celular',
        'correo',
        'cargo',
        'nombre_graduado',
        'alumno_id'
    ];
}
