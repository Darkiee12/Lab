<?php

namespace App\Http\Controllers;

use App\Models\Program;
use Illuminate\Http\Request;

class ProgramController extends Controller
{   
    /**
     * @OA\Get(
     *     path="/programs",
     *     tags={"Programs"},
     *     summary="Get list of programs",
     *     description="Returns a list of programs",
     *     @OA\Response(
     *         response=200,
     *         description="Successful operation",
     *         @OA\JsonContent(type="array", @OA\Items(ref="#/components/schemas/Program"))
     *     )
     * )
     */
    public function index()
    {
        $programs = Program::all();
        return view('programs.index', compact('programs'));
    }
     /**
     * @OA\Get(
     *     path="/programs/create",
     *     tags={"Programs"},
     *     summary="Show form to create a new program",
     *     description="Returns a form to create a new program",
     *     @OA\Response(
     *         response=200,
     *         description="Successful operation",
     *         @OA\JsonContent(
     *             type="object",
     *             example={
     *                 "form_action": "/programs",
     *                 "method": "POST",
     *                 "fields": {
     *                     "name": "string",
     *                     "duration": "integer",
     *                     "version": "string",
     *                     "major_id": "integer",
     *                     "program_type_id": "integer",
     *                     "valid_from": "string"
     *                 }
     *             }
     *         )
     *     )
     * )
     */
    public function create()
    {
        return view('programs.create');
    }
     /**
     * @OA\Post(
     *     path="/programs",
     *     tags={"Programs"},
     *     summary="Create a new program",
     *     operationId="storeProgram",
     *     @OA\RequestBody(
     *         required=true,
     *         @OA\JsonContent(
     *             type="object",
     *             @OA\Property(property="name", type="string", description="Name of the program"),
     *             @OA\Property(property="duration", type="integer", description="Duration of the program"),
     *             @OA\Property(property="version", type="string", maxLength=4, description="Version of the program"),
     *             @OA\Property(property="major_id", type="integer", description="ID of the major"),
     *             @OA\Property(property="program_type_id", type="integer", description="Type ID of the program"),
     *             @OA\Property(property="valid_from", type="string", description="Valid from date")
     *         )
     *     ),
     *     @OA\Response(
     *         response=201,
     *         description="Program created successfully",
     *         @OA\JsonContent(ref="#/components/schemas/Program")
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
            'name' => 'nullable|string',
            'duration' => 'nullable|integer',
            'version' => 'nullable|string|max:4',
            'major_id' => 'nullable|integer',
            'program_type_id' => 'required|integer',
            'valid_from' => 'nullable|string',
        ]);

        Program::create($request->all());
        return redirect()->route('programs.index');
    }
     /**
     * @OA\Get(
     *     path="/programs/{program}",
     *     tags={"Programs"},
     *     summary="Get a program by ID",
     *     description="Returns a single program",
     *     operationId="getProgramById",
     *     @OA\Parameter(
     *         name="program",
     *         in="path",
     *         required=true,
     *         description="ID of the program to retrieve",
     *         @OA\Schema(type="integer")
     *     ),
     *     @OA\Response(
     *         response=200,
     *         description="Successful operation",
     *         @OA\JsonContent(ref="#/components/schemas/Program")
     *     ),
     *     @OA\Response(
     *         response=404,
     *         description="Program not found",
     *         @OA\JsonContent(
     *             type="object",
     *             @OA\Property(property="message", type="string", example="Program not found")
     *         )
     *     )
     * )
     */
    public function show(Program $program)
    {
        return view('programs.show', compact('program'));
    }
     /**
     * @OA\Get(
     *     path="/programs/{program}/edit",
     *     tags={"Programs"},
     *     summary="Edit a program by ID",
     *     description="Returns the data of a single program for editing",
     *     operationId="editProgramById",
     *     @OA\Parameter(
     *         name="program",
     *         in="path",
     *         required=true,
     *         description="ID of the program to edit",
     *         @OA\Schema(type="integer")
     *     ),
     *     @OA\Response(
     *         response=200,
     *         description="Successful operation",
     *         @OA\JsonContent(ref="#/components/schemas/Program")
     *     ),
     *     @OA\Response(
     *         response=404,
     *         description="Program not found",
     *         @OA\JsonContent(
     *             type="object",
     *             @OA\Property(property="message", type="string", example="Program not found")
     *         )
     *     )
     * )
     */
    public function edit(Program $program)
    {
        return view('programs.edit', compact('program'));
    }
    /**
     * @OA\Put(
     *     path="/programs/{program}",
     *     tags={"Programs"},
     *     summary="Update a program by ID",
     *     description="Updates the details of a specific program",
     *     operationId="updateProgramById",
     *     @OA\Parameter(
     *         name="program",
     *         in="path",
     *         required=true,
     *         description="ID of the program to update",
     *         @OA\Schema(type="integer")
     *     ),
     *     @OA\RequestBody(
     *         required=true,
     *         @OA\JsonContent(
     *             type="object",
     *             @OA\Property(property="name", type="string", description="Name of the program"),
     *             @OA\Property(property="duration", type="integer", description="Duration of the program"),
     *             @OA\Property(property="version", type="string", maxLength=4, description="Version of the program"),
     *             @OA\Property(property="major_id", type="integer", description="ID of the major"),
     *             @OA\Property(property="program_type_id", type="integer", description="Type ID of the program"),
     *             @OA\Property(property="valid_from", type="string", description="Valid from date")
     *         )
     *     ),
     *     @OA\Response(
     *         response=200,
     *         description="Successful operation",
     *         @OA\JsonContent(ref="#/components/schemas/Program")
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
     *         description="Program not found",
     *         @OA\JsonContent(
     *             type="object",
     *             @OA\Property(property="message", type="string", example="Program not found")
     *         )
     *     )
     * )
     */
    public function update(Request $request, Program $program)
    {
        $request->validate([
            'name' => 'nullable|string',
            'duration' => 'nullable|integer',
            'version' => 'nullable|string|max:4',
            'major_id' => 'nullable|integer',
            'program_type_id' => 'required|integer',
            'valid_from' => 'nullable|string',
        ]);

        $program->update($request->all());
        return redirect()->route('programs.index');
    }
    /**
     * @OA\Delete(
     *     path="/programs/{program}",
     *     tags={"Programs"},
     *     summary="Delete a program by ID",
     *     description="Deletes a specific program",
     *     operationId="deleteProgramById",
     *     @OA\Parameter(
     *         name="program",
     *         in="path",
     *         required=true,
     *         description="ID of the program to delete",
     *         @OA\Schema(type="integer")
     *     ),
     *     @OA\Response(
     *         response=200,
     *         description="Successful operation",
     *         @OA\JsonContent(
     *             type="object",
     *             @OA\Property(property="message", type="string", example="Program deleted successfully")
     *         )
     *     ),
     *     @OA\Response(
     *         response=404,
     *         description="Program not found",
     *         @OA\JsonContent(
     *             type="object",
     *             @OA\Property(property="message", type="string", example="Program not found")
     *         )
     *     )
     * )
     */
    public function destroy(Program $program)
    {
        $program->delete();
        return redirect()->route('programs.index');
    }
}

