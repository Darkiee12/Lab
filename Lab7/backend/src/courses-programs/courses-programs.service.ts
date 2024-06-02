import { Injectable } from '@nestjs/common';
import { InjectRepository } from '@nestjs/typeorm';
import { CourseProgram } from './course-program.entity';
import { In, Repository } from 'typeorm';
import { Course } from 'src/courses/course.entity';
import { Program } from 'src/programs/program.entity';
import { CreateCourseProgramDTO } from './dto/course-program-dto';

@Injectable()
export class CoursesProgramsService {
  constructor(
    @InjectRepository(CourseProgram)
    private courseProgramRepository: Repository<CourseProgram>,

    @InjectRepository(Course)
    private courseRepository: Repository<Course>,

    @InjectRepository(Program)
    private programRepository: Repository<Program>
  ){}

  async create(courseProgramDto: CreateCourseProgramDTO): Promise<CourseProgram> {
    const courseProgram = new CourseProgram();
    // await this.courseRepository.findOne()
    Object.assign(courseProgram, courseProgramDto);
    return this.courseProgramRepository.save(courseProgram);

  }
}