import { Test, TestingModule } from '@nestjs/testing';
import { CoursesProgramsService } from './courses-programs.service';

describe('CoursesProgramsService', () => {
  let service: CoursesProgramsService;

  beforeEach(async () => {
    const module: TestingModule = await Test.createTestingModule({
      providers: [CoursesProgramsService],
    }).compile();

    service = module.get<CoursesProgramsService>(CoursesProgramsService);
  });

  it('should be defined', () => {
    expect(service).toBeDefined();
  });
});
