<?php

namespace App\Models;
use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;
 /**
 * @OA\Schema(
 *     schema="CourseProgram",
 *     type="object",
 *     title="CourseProgram",
 *     description="CourseProgram model schema",
 *     required={"course_id", "program_id", "course_code", "course_type_id"},
 *     @OA\Property(
 *         property="course_id",
 *         type="string",
 *         description="ID of the course",
 *         example="1"
 *     ),
 *     @OA\Property(
 *         property="program_id",
 *         type="string",
 *         description="ID of the program",
 *         example="1"
 *     ),
 *     @OA\Property(
 *         property="course_code",
 *         type="string",
 *         description="Code of the course",
 *         example="CS101"
 *     ),
 *     @OA\Property(
 *         property="course_type_id",
 *         type="integer",
 *         description="ID of the course type",
 *         example=1
 *     )
 * )
 */
class CourseProgram extends Model
{
    use HasFactory;

    protected $table = 'course_program';
    protected $fillable = [
        'course_id',
        'program_id',
        'course_code',
        'course_type_id',
    ];

    public function course()
    {
        return $this->belongsTo(Course::class);
    }

    public function program()
    {
        return $this->belongsTo(Program::class);
    }
}
