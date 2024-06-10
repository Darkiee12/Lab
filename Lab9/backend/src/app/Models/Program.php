<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;

/**
 * @OA\Schema(
 *     schema="Program",
 *     type="object",
 *     title="Program",
 *     description="Program model schema",
 *     required={"name", "program_type_id"},
 *     @OA\Property(
 *         property="name",
 *         type="string",
 *         description="Name of the program",
 *         example="Computer Science"
 *     ),
 *     @OA\Property(
 *         property="duration",
 *         type="integer",
 *         description="Duration of the program in years",
 *         example=4
 *     ),
 *     @OA\Property(
 *         property="version",
 *         type="string",
 *         description="Version of the program",
 *         example="1.0"
 *     ),
 *     @OA\Property(
 *         property="major_id",
 *         type="integer",
 *         description="ID of the major associated with the program",
 *         example=1
 *     ),
 *     @OA\Property(
 *         property="program_type_id",
 *         type="integer",
 *         description="ID of the program type",
 *         example=2
 *     ),
 *     @OA\Property(
 *         property="valid_from",
 *         type="string",
 *         format="date",
 *         description="Date from which the program is valid",
 *         example="2022-01-01"
 *     )
 * )
 */


class Program extends Model
{
    use HasFactory;
    protected $table = 'program';
    protected $fillable = [
        'name',
        'duration',
        'version',
        'major_id',
        'program_type_id',
        'valid_from',
    ];

    public function courses()
    {
        return $this->belongsToMany(Course::class, 'course_program');
    }
}
