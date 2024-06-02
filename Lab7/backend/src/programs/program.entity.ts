import { Column, Entity, OneToMany, PrimaryGeneratedColumn, JoinColumn } from 'typeorm';
import { CourseProgram } from '../courses-programs/course-program.entity';

@Entity("program")
export class Program {
  @PrimaryGeneratedColumn()
  id: number;

  @Column({ type: 'varchar', length: 255, nullable: true })
  name: string;

  @Column({ type: 'int', nullable: true })
  duration: number;

  @Column({ type: 'varchar', length: 4, nullable: true })
  version: string;

  @Column({ type: 'int', nullable: true, name: 'major_id'})
  majorId: number;

  @Column({ type: 'int', name: 'program_type_id' })
  programTypeId: number;

  @Column({ type: 'varchar', length: 255, nullable: true, name: 'valid_from'})
  validFrom: string;

  @OneToMany(() => CourseProgram, (courseProgram) => courseProgram.program)
  coursePrograms: CourseProgram[];
}