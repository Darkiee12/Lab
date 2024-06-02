import { Entity, Column, PrimaryColumn, OneToMany } from 'typeorm';
import { CourseProgram } from '../courses-programs/course-program.entity';
import { ApiProperty } from '@nestjs/swagger';

@Entity()
export class Course {
  @PrimaryColumn({ type: 'varchar', length: 255 })
  @ApiProperty({
    example: 'ITITIU001',
    description: 'The unique identifier of the course.',
    required: true,
    type: 'string',
  })
  id: string;

  @ApiProperty({
    example: 1,
    description: 'The unique identifier of the course level.',
    required: true,
    type: 'number',
  })
  @Column({ type: 'int', name: 'courseLevelId' })
  courseLevelId: number;

  @ApiProperty({
    example: 'Introduction to IT',
    description: 'The name of the course.',
    required: true,
    type: 'string',
  })
  @Column({ type: 'varchar', length: 255, nullable: true })
  name: string;

  @ApiProperty({
    example: 'Giới thiệu về CNTT',
    description: 'The name of the course in Vietnamese.',
    required: true,
    type: 'string',
  })
  @Column({ type: 'varchar', length: 255 })
  nameVn: string;

  @ApiProperty({
    example: 3,
    description: 'The number of credits for the course.',
    required: true,
    type: 'number',
  })
  @Column({ type: 'int', nullable: true })
  creditTheory: number;

  @ApiProperty({
    example: 1,
    description: 'The number of lab credits for the course.',
    required: true,
    type: 'number',
  })
  @Column({ type: 'int', nullable: true })
  creditLab: number;

  @ApiProperty({
    example: 1,
    description: 'The number of self-study credits for the course.',
    required: true,
    type: 'number',
  })
  @Column({ type: 'text' })
  description: string;

  @OneToMany(() => CourseProgram, (courseProgram) => courseProgram.course)
  coursePrograms: CourseProgram[];
}
