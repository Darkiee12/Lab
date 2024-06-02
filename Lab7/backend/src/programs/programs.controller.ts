import { Body, Controller, Delete, Get, HttpStatus, Param, ParseIntPipe, Post, Put, Scope } from '@nestjs/common';
import { ProgramsService } from './programs.service';
import { CreateProgramDTO } from './dto/create-program-dto';
import { Program } from './program.entity';
import { ApiBody, ApiTags } from '@nestjs/swagger';

@Controller({
  path: "programs",
  scope: Scope.REQUEST
})
@ApiTags('programs')
export class ProgramsController {
  constructor(private readonly programsService: ProgramsService){}
  @Post()
  @ApiBody({type: CreateProgramDTO})
  async create(@Body() createProgramDTO: CreateProgramDTO){
    await this.programsService.create(createProgramDTO);
  }
  
  @Get()
  async findAll() {
    return await this.programsService.findAll();
  }

  @Get(":id")
  async findOne(
    @Param(
      'id',
      new ParseIntPipe({ errorHttpStatusCode: HttpStatus.NOT_ACCEPTABLE }),
    ) id: number
  ): Promise<Program> {
    return await this.programsService.findOne(id);
  }

  @Put(":id")
  async update(id: number, @Body() program: Program) {
    return await this.programsService.update(id, program);
  }

  @Delete(":id")
  async delete(id: number) {
    return await this.programsService.remove(id);
  }

}
