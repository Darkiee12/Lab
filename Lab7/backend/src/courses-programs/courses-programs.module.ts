import { Module } from '@nestjs/common';
import { CoursesProgramsService } from './courses-programs.service';
import { CoursesProgramsController } from './courses-programs.controller';
import { TypeOrmModule } from '@nestjs/typeorm';
import { Course } from 'src/courses/course.entity';
import { Program } from 'src/programs/program.entity';
import { CourseProgram } from './course-program.entity';

@Module({
  imports: [TypeOrmModule.forFeature([Course, Program, CourseProgram])],
  providers: [CoursesProgramsService],
  controllers: [CoursesProgramsController]
})
export class CoursesProgramsModule {}
