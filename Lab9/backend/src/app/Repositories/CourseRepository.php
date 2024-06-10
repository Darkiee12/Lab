<?php
namespace App\Repositories;
use App\Models\Course;
class CourseRepository
{
  protected Course $course;
  public function all()
  {
    return Course::all();
  }
  public function createCourse($data)
  {
    return $this->course->create($data);
  }
  public function find($id)
  {
    return Course::find($id);
  }
  public function updateCourse($id, $data)
  {
    $course = $this->course->find($id);
    return $course->update($data);
  }
}