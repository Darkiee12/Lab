import { Module } from '@nestjs/common';
import { ProgramsService } from './programs.service';
import { TypeOrmModule } from '@nestjs/typeorm';
import { Program } from './program.entity';
import { ProgramsController } from './programs.controller';

@Module({
  imports: [TypeOrmModule.forFeature([Program])],
  providers: [ProgramsService],
  controllers: [ProgramsController],
  exports: [ProgramsService]
})
export class ProgramModule {}
