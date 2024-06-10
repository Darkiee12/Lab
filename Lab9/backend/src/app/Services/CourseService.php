<?php
namespace App\Services;
use App\Models\Course;

class CourseService
{
  protected Course $course;

  public function __construct(Course $course)
  {
    $this->course = $course;
  }

  public function getAllCourses()
  {
    return $this->course->all();
  }

  public function createCourse($data)
  {
    return $this->course->create($data);
  }

  public function getCourseById($id)
  {
    return $this->course->find($id);
  }

  public function updateCourse($id, $data)
  {
    $course = $this->course->find($id);
    return $course->update($data);
  }
}