<?php

namespace App\Http\Controllers;
use App\Models\Course;
use Illuminate\Http\Request;
use OpenApi\Annotations as OA;

class CourseController extends Controller
{
    /**
     * @OA\Get(
     *      path="/courses",
     *      operationId="getCourseList",
     *      tags={"Courses"},
     *      summary="Get list of courses",
     *      description="Returns list of courses",
     *      @OA\Response(
     *          response=200,
     *          description="Successful operation",
     *          @OA\JsonContent(type="array", @OA\Items(ref="#/components/schemas/Course"))
     *      )
     * )
     */
    public function index()
    {
        $courses = Course::all();
        return view('courses.index', compact('courses'));
    }
    /**
     * @OA\Post(
     *      path="/api/courses/create",
     *      operationId="createCourseForm",
     *      tags={"Courses"},
     *      summary="Show course creation form",
     *      description="Display the form for creating a new course",
     *      @OA\Response(
     *          response=200,
     *          description="Successful operation",
     *          @OA\JsonContent(ref="#/components/schemas/Course")
     *      )
     * )
     */
    public function create()
    {
        return view('courses.create');
    }
    /**
     * @OA\Post(
     *      path="/courses",
     *      operationId="createCourse",
     *      tags={"Courses"},
     *      summary="Create a new course",
     *      description="Create a new course record",
     *      @OA\RequestBody(
     *          required=true,
     *          @OA\JsonContent(ref="#/components/schemas/Course")
     *      ),
     *      @OA\Response(
     *          response=200,
     *          description="Successful operation",
     *          @OA\JsonContent(ref="#/components/schemas/Course")
     *      )
     * )
     */
    public function store(Request $request)
    {
        $request->validate([
            'id' => 'required|string|unique:courses',
            'course_level_id' => 'required|integer',
            'name' => 'nullable|string',
            'name_vn' => 'required|string',
            'credit_theory' => 'nullable|integer',
            'credit_lab' => 'nullable|integer',
            'description' => 'required|string',
        ]);

        Course::create($request->all());
        return redirect()->route('courses.index');
    }
    /**
     * @OA\Get(
     *      path="/courses/{course}",
     *      operationId="getCourseById",
     *      tags={"Courses"},
     *      summary="Get a course by ID",
     *      description="Returns a single course",
     *      @OA\Parameter(
     *          name="course",
     *          in="path",
     *          description="ID of the course",
     *          required=true,
     *          @OA\Schema(
     *              type="integer",
     *              format="int64"
     *          )
     *      ),
     *      @OA\Response(
     *          response=200,
     *          description="Successful operation",
     *          @OA\JsonContent(
     *              @OA\Property(
     *                 title="data",
     *                 type="object",
     *                 ref="#/components/schemas/Course"
     *              ),
     *          )
     *      ),
     *      @OA\Response(
     *          response=404,
     *          description="Course not found"
     *      )
     * )
     */
    public function show(Course $course)
    {
        return view('courses.show', compact('course'));
    }
    /**
     * @OA\Get(
     *      path="/api/courses/{course}/edit",
     *      operationId="editCourseForm",
     *      tags={"Courses"},
     *      summary="Show course edit form",
     *      description="Display the form for editing an existing course",
     *      @OA\Parameter(
     *          name="course",
     *          in="path",
     *          description="ID of the course to edit",
     *          required=true,
     *          @OA\Schema(
     *              type="integer",
     *              format="int64"
     *          )
     *      ),
     *      @OA\Response(
     *          response=200,
     *          description="Successful operation",
     *          @OA\JsonContent(ref="#/components/schemas/Course")
     *      ),
     *      @OA\Response(
     *          response=404,
     *          description="Course not found"
     *      )
     * )
     */
    public function edit(Course $course)
    {
        return view('courses.edit', compact('course'));
    }
    /**
     * @OA\Put(
     *      path="/courses/{course}",
     *      operationId="updateCourse",
     *      tags={"Courses"},
     *      summary="Update an existing course",
     *      description="Update an existing course record",
     *      @OA\Parameter(
     *          name="course",
     *          in="path",
     *          description="ID of the course to update",
     *          required=true,
     *          @OA\Schema(
     *              type="integer",
     *              format="int64"
     *          )
     *      ),
     *      @OA\RequestBody(
     *          required=true,
     *          @OA\JsonContent(ref="#/components/schemas/Course")
     *      ),
     *      @OA\Response(
     *          response=200,
     *          description="Successful operation",
     *          @OA\JsonContent(ref="#/components/schemas/Course")
     *      ),
     *      @OA\Response(
     *          response=404,
     *          description="Course not found"
     *      )
     * )
     */
    public function update(Request $request, Course $course)
    {
        $request->validate([
            'course_level_id' => 'required|integer',
            'name' => 'nullable|string',
            'name_vn' => 'required|string',
            'credit_theory' => 'nullable|integer',
            'credit_lab' => 'nullable|integer',
            'description' => 'required|string',
        ]);

        $course->update($request->all());
        return redirect()->route('courses.index');
    }
    /**
     * @OA\Delete(
     *      path="/courses/{course}",
     *      operationId="deleteCourse",
     *      tags={"Courses"},
     *      summary="Delete a course",
     *      description="Deletes a single course",
     *      @OA\Parameter(
     *          name="course",
     *          in="path",
     *          description="ID of the course to delete",
     *          required=true,
     *          @OA\Schema(
     *              type="integer",
     *              format="int64"
     *          )
     *      ),
     *      @OA\Response(
     *          response=200,
     *          description="Course deleted successfully"
     *      ),
     *      @OA\Response(
     *          response=404,
     *          description="Course not found"
     *      )
     * )
     */
    public function destroy(Course $course)
    {
        $course->delete();
        return redirect()->route('courses.index');
    }
}
