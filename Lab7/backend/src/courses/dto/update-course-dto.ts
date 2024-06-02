import { IsInt, IsNotEmpty, IsString } from "class-validator";

export class UpdateCourseDTO{
    @IsInt()
    @IsNotEmpty()
    course_level_id: number;

    @IsNotEmpty()
    @IsString()
    name: string;

    @IsNotEmpty()
    @IsString()
    name_vn: string;

    @IsInt()
    @IsNotEmpty()
    credit_theory: number;

    @IsInt()
    @IsNotEmpty()
    credit_lab: number;

    @IsNotEmpty()
    @IsString() 
    description: string;
}