import {
  Entity,
  PrimaryGeneratedColumn,
  Column,
  ManyToOne,
  JoinColumn,
  Index,
  Unique,
  PrimaryColumn
} from 'typeorm';
import { Course } from '../courses/course.entity';
import { Program } from '../programs/program.entity';

@Entity('course_program')
@Unique('Key', ['courseId', 'programId'])
@Index('FK_CourseProgram_Program', ['programId'])
@Entity()
export class CourseProgram {
  @PrimaryColumn({ type: 'varchar', length: 255, name: 'course_id'})
  courseId: string;

  @PrimaryColumn({ type: 'int', name: 'program_id' })
  programId: number;

  @Column({ type: 'varchar', length: 255, name: 'course_code'})
  courseCode: string;

  @Column({ type: 'int', name: 'course_type_id' })
  courseTypeId: number;

  @ManyToOne(() => Course, (course) => course.coursePrograms, { onDelete: 'CASCADE', onUpdate: 'CASCADE' })
  course: Course;

  @ManyToOne(() => Program, (program) => program.coursePrograms, { onDelete: 'CASCADE', onUpdate: 'CASCADE' })
  program: Program;
}
