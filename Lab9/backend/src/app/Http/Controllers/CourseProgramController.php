<?php

namespace App\Http\Controllers;

use App\Models\CourseProgram;
use Illuminate\Http\Request;

class CourseProgramController extends Controller
{
     /**
     * @OA\Get(
     *     path="/course_programs",
     *     tags={"CoursePrograms"},
     *     summary="Get list of course programs",
     *     description="Returns list of course programs",
     *     @OA\Response(
     *         response=200,
     *         description="successful operation",
     *         @OA\JsonContent(
     *             type="array",
     *             @OA\Items(ref="#/components/schemas/CourseProgram")
     *         )
     *     )
     * )
     */
    public function index()
    {
        $coursePrograms = CourseProgram::all();
        return view('course_programs.index', compact('coursePrograms'));
    }
    /**
     * @OA\Get(
     *     path="/course_programs/create",
     *     tags={"CoursePrograms"},
     *     summary="Show form to create a new course program",
     *     description="Returns a form to create a new course program",
     *     @OA\Response(
     *         response=200,
     *         description="successful operation",
     *         @OA\JsonContent(
     *             type="object",
     *             example={
     *                 "form_action": "/course_programs",
     *                 "method": "POST",
     *                 "fields": {
     *                     "course_id": "string",
     *                     "program_id": "integer",
     *                     "course_code": "string",
     *                     "course_type_id": "integer"
     *                 }
     *             }
     *         )
     *     )
     * )
     */
    public function create()
    {
        return view('course_programs.create');
    }
    /**
     * @OA\Post(
     *     path="/course_programs",
     *     tags={"CoursePrograms"},
     *     summary="Create a new course program",
     *     operationId="storeCourseProgram",
     *     @OA\RequestBody(
     *         required=true,
     *         @OA\JsonContent(
     *             type="object",
     *             @OA\Property(property="course_id", type="string", description="ID of the course"),
     *             @OA\Property(property="program_id", type="integer", description="ID of the program"),
     *             @OA\Property(property="course_code", type="string", description="Code of the course"),
     *             @OA\Property(property="course_type_id", type="integer", description="Type ID of the course")
     *         )
     *     ),
     *     @OA\Response(
     *         response=201,
     *         description="Course program created successfully",
     *         @OA\JsonContent(ref="#/components/schemas/CourseProgram")
     *     ),
     *     @OA\Response(
     *         response=400,
     *         description="Invalid input",
     *         @OA\JsonContent(
     *             type="object",
     *             @OA\Property(property="message", type="string", example="Invalid input")
     *         )
     *     )
     * )
     */
    public function store(Request $request)
    {
        $request->validate([
            'course_id' => 'required|string|exists:courses,id',
            'program_id' => 'required|integer|exists:programs,id',
            'course_code' => 'required|string',
            'course_type_id' => 'required|integer',
        ]);

        CourseProgram::create($request->all());
        return redirect()->route('course_programs.index');
    }
    /**
     * @OA\Get(
     *     path="/course_programs/{course_program}",
     *     tags={"CoursePrograms"},
     *     summary="Get a course program by ID",
     *     description="Returns a single course program",
     *     operationId="getCourseProgramById",
     *     @OA\Parameter(
     *         name="course_program",
     *         in="path",
     *         required=true,
     *         description="ID of the course program to retrieve",
     *         @OA\Schema(type="integer")
     *     ),
     *     @OA\Response(
     *         response=200,
     *         description="Successful operation",
     *         @OA\JsonContent(ref="#/components/schemas/CourseProgram")
     *     ),
     *     @OA\Response(
     *         response=404,
     *         description="Course program not found",
     *         @OA\JsonContent(
     *             type="object",
     *             @OA\Property(property="message", type="string", example="Course program not found")
     *         )
     *     )
     * )
     */
    public function show(CourseProgram $courseProgram)
    {
        return view('course_programs.show', compact('courseProgram'));
    }
     /**
     * @OA\Get(
     *     path="/course_programs/{course_program}/edit",
     *     tags={"CoursePrograms"},
     *     summary="Edit a course program by ID",
     *     description="Returns the data of a single course program for editing",
     *     operationId="editCourseProgramById",
     *     @OA\Parameter(
     *         name="course_program",
     *         in="path",
     *         required=true,
     *         description="ID of the course program to edit",
     *         @OA\Schema(type="integer")
     *     ),
     *     @OA\Response(
     *         response=200,
     *         description="Successful operation",
     *         @OA\JsonContent(ref="#/components/schemas/CourseProgram")
     *     ),
     *     @OA\Response(
     *         response=404,
     *         description="Course program not found",
     *         @OA\JsonContent(
     *             type="object",
     *             @OA\Property(property="message", type="string", example="Course program not found")
     *         )
     *     )
     * )
     */
    public function edit(CourseProgram $courseProgram)
    {
        return view('course_programs.edit', compact('courseProgram'));
    }
    /**
     * @OA\Put(
     *     path="/course_programs/{course_program}",
     *     tags={"CoursePrograms"},
     *     summary="Update a course program by ID",
     *     description="Updates the details of a specific course program",
     *     operationId="updateCourseProgramById",
     *     @OA\Parameter(
     *         name="course_program",
     *         in="path",
     *         required=true,
     *         description="ID of the course program to update",
     *         @OA\Schema(type="integer")
     *     ),
     *     @OA\RequestBody(
     *         required=true,
     *         @OA\JsonContent(
     *             type="object",
     *             @OA\Property(property="course_code", type="string", description="Code of the course"),
     *             @OA\Property(property="course_type_id", type="integer", description="Type ID of the course")
     *         )
     *     ),
     *     @OA\Response(
     *         response=200,
     *         description="Successful operation",
     *         @OA\JsonContent(ref="#/components/schemas/CourseProgram")
     *     ),
     *     @OA\Response(
     *         response=400,
     *         description="Invalid input",
     *         @OA\JsonContent(
     *             type="object",
     *             @OA\Property(property="message", type="string", example="Invalid input")
     *         )
     *     ),
     *     @OA\Response(
     *         response=404,
     *         description="Course program not found",
     *         @OA\JsonContent(
     *             type="object",
     *             @OA\Property(property="message", type="string", example="Course program not found")
     *         )
     *     )
     * )
     */
    public function update(Request $request, CourseProgram $courseProgram)
    {
        $request->validate([
            'course_code' => 'required|string',
            'course_type_id' => 'required|integer',
        ]);

        $courseProgram->update($request->all());
        return redirect()->route('course_programs.index');
    }
    /**
     * @OA\Delete(
     *     path="/course_programs/{course_program}",
     *     tags={"CoursePrograms"},
     *     summary="Delete a course program by ID",
     *     description="Deletes a specific course program",
     *     operationId="deleteCourseProgramById",
     *     @OA\Parameter(
     *         name="course_program",
     *         in="path",
     *         required=true,
     *         description="ID of the course program to delete",
     *         @OA\Schema(type="integer")
     *     ),
     *     @OA\Response(
     *         response=200,
     *         description="Successful operation",
     *         @OA\JsonContent(
     *             type="object",
     *             @OA\Property(property="message", type="string", example="Course program deleted successfully")
     *         )
     *     ),
     *     @OA\Response(
     *         response=404,
     *         description="Course program not found",
     *         @OA\JsonContent(
     *             type="object",
     *             @OA\Property(property="message", type="string", example="Course program not found")
     *         )
     *     )
     * )
     */
    public function destroy(CourseProgram $courseProgram)
    {
        $courseProgram->delete();
        return redirect()->route('course_programs.index');
    }
}
