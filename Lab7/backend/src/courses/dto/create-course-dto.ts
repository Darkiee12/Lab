import { IsIn, IsInt, IsNotEmpty, IsNumber, IsString } from "class-validator";

export class CreateCourseDTO {
  @IsString()
  @IsNotEmpty()
  readonly id: string;

  @IsString()
  @IsNotEmpty()
  readonly name: string;

  @IsString()
  @IsNotEmpty()
  readonly nameVn: string;

  @IsInt()
  @IsNotEmpty()
  readonly courseLevelId: number;

  @IsInt()
  @IsNotEmpty()
  readonly creditTheory: number;

  @IsInt()
  @IsNotEmpty()
  readonly creditLab: number;

  @IsString()
  @IsNotEmpty()
  readonly description: string;
}
