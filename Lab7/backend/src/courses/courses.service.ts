import { Injectable, NotFoundException, Scope } from '@nestjs/common';
import { InjectRepository } from '@nestjs/typeorm';
import { Repository } from 'typeorm';
import { Course } from './course.entity';
import { UpdateCourseDTO } from './dto/update-course-dto';
import { Pagination, paginate, IPaginationOptions } from 'nestjs-typeorm-paginate';
@Injectable({
  scope: Scope.TRANSIENT
})
export class CoursesService {
  constructor(
    @InjectRepository(Course)
    private coursesRepository: Repository<Course>,
  ){}
  private HARD_LIMIT = 20;
  private async paginate(options: IPaginationOptions, sortAsc: boolean | null = null): Promise<Pagination<Course>> {
    if(sortAsc !== null){
      const query = this.coursesRepository.createQueryBuilder('course');
      sortAsc
        ? query.orderBy('course.id', 'ASC')
        : query.orderBy('course.id', 'DESC');
    }
    return paginate<Course>(this.coursesRepository, options);
  }
  async findOne(id: string): Promise<Course> {
    const course = await this.coursesRepository.findOne({where: {id}});
    if(!course) throw new NotFoundException(`Course with id ${id} not found`);
    return course;
  }

  async create(course){
    await this.coursesRepository.save(course);
  }

  async findAll(page: number, limit: number){
    limit = limit > this.HARD_LIMIT ? this.HARD_LIMIT : limit;
    return this.paginate({page, limit});
  }

  async update(id: string, course: UpdateCourseDTO){
    const toUpdate = await this.coursesRepository.findOne({where: {id}});
    if(!toUpdate) throw new NotFoundException(`Course with id ${id} not found`);
    const updated = Object.assign(toUpdate, course);
    updated.id = id;
    await this.coursesRepository.update(id, updated);
  }

  async remove(id: string){
    await this.coursesRepository.delete(id);
  }
}
