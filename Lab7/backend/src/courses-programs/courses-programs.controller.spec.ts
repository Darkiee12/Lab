import { Test, TestingModule } from '@nestjs/testing';
import { CoursesProgramsController } from './courses-programs.controller';

describe('CoursesProgramsController', () => {
  let controller: CoursesProgramsController;

  beforeEach(async () => {
    const module: TestingModule = await Test.createTestingModule({
      controllers: [CoursesProgramsController],
    }).compile();

    controller = module.get<CoursesProgramsController>(CoursesProgramsController);
  });

  it('should be defined', () => {
    expect(controller).toBeDefined();
  });
});
