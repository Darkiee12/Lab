import { IsString, IsInt } from 'class-validator';

export class CreateCourseProgramDTO {
  @IsString()
  courseId: string;

  @IsInt()
  programId: number;

  @IsString()
  courseCode: string;

  @IsInt()
  courseTypeId: number;
}