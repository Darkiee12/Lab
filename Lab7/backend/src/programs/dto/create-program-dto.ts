import { IsNotEmpty, IsNumber, IsString } from "class-validator";

export class CreateProgramDTO{
  @IsString()
  @IsNotEmpty()
  readonly name: string;

  @IsNumber()
  @IsNotEmpty()
  readonly duration: number;

  @IsString()
  @IsNotEmpty()
  readonly version: string;

  @IsNumber()
  @IsNotEmpty()
  readonly majorId: number;

  @IsNumber()
  @IsNotEmpty()
  readonly programTypeId: number;

  @IsString()
  @IsNotEmpty()
  readonly validFrom: string;
  
}