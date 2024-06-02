import { Injectable, NotFoundException } from '@nestjs/common';
import { InjectRepository } from '@nestjs/typeorm';
import { Program } from './program.entity';
import { Repository } from 'typeorm';

@Injectable()
export class ProgramsService {
  constructor(
    @InjectRepository(Program)
    private programsRepository: Repository<Program>,
  ){}

  async create(program){
    await this.programsRepository.save(program);
  }

  async findAll(){
    return await this.programsRepository.find();
  }

  async findOne(id: number): Promise<Program> {
    const program = await this.programsRepository.findOne({where: {id}});
    if(!program) throw new NotFoundException(`Program with id ${id} not found`);
    return program;
  }

  async update(id: number, program: Program){
    await this.programsRepository.update(id, program);
  }

  async remove(id: number){
    await this.programsRepository.delete(id);
  }
}
