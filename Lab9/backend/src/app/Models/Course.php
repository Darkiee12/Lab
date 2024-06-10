<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;
use Illuminate\Database\Eloquent\Relations\BelongsTo;
use Illuminate\Database\Eloquent\Relations\BelongsToMany;

/**
 * @OA\Schema(
 *     schema="Course",
 *     type="object",
 *     title="Course",
 *     description="Course model schema",
 *     required={"id", "course_level_id", "name", "credit_theory", "credit_lab"},
 *     @OA\Property(
 *         property="id",
 *         type="integer",
 *         description="Course ID",
 *         example=1
 *     ),
 *     @OA\Property(
 *         property="course_level_id",
 *         type="integer",
 *         description="ID of the course level",
 *         example=2
 *     ),
 *     @OA\Property(
 *         property="name",
 *         type="string",
 *         description="Name of the course",
 *         example="Introduction to Programming"
 *     ),
 *     @OA\Property(
 *         property="name_vn",
 *         type="string",
 *         description="Name of the course in Vietnamese",
 *         example="Giới thiệu về lập trình"
 *     ),
 *     @OA\Property(
 *         property="credit_theory",
 *         type="integer",
 *         description="Number of theoretical credits",
 *         example=3
 *     ),
 *     @OA\Property(
 *         property="credit_lab",
 *         type="integer",
 *         description="Number of laboratory credits",
 *         example=1
 *     ),
 *     @OA\Property(
 *         property="description",
 *         type="string",
 *         description="Description of the course",
 *         example="This course covers basic concepts of programming including algorithms, data structures, and software engineering principles."
 *     )
 * )
 */
class Course extends Model
{
    use HasFactory;
    protected $primaryKey = 'id';
    protected $table = 'course';
    public $incrementing = false;
    protected $keyType = 'string';

    protected $fillable = [
        'id',
        'course_level_id',
        'name',
        'name_vn',
        'credit_theory',
        'credit_lab',
        'description',
    ];

    public function programs(): BelongsToMany
    {
        return $this->belongsToMany(Program::class, 'course_programs');
    }
}
