import {
  Body,
  Controller,
  DefaultValuePipe,
  Get,
  HttpException,
  HttpStatus,
  Inject,
  Param,
  ParseIntPipe,
  Post,
  Put,
  Query,
  Scope,
  UsePipes,
} from '@nestjs/common';
import { CoursesService } from './courses.service';
import { CreateCourseDTO } from './dto/create-course-dto';
import { Course } from './course.entity';
import { ApiBody, ApiHeaders, ApiOperation, ApiQuery, ApiResponse, ApiTags, getSchemaPath } from '@nestjs/swagger';
import { UpdateCourseDTO } from './dto/update-course-dto';
import { ValidationPipe } from '../shared/pipes'
import { Pagination } from 'nestjs-typeorm-paginate';
@ApiTags('courses')
@Controller({
  path: 'courses',
  scope: Scope.REQUEST,
})
export class CoursesController {
  constructor(private readonly coursesService: CoursesService) {}

  @Post()
  @UsePipes(new ValidationPipe())
  @ApiHeaders([{ name: 'content-type', required: true }])
  @ApiOperation({ summary: 'Create a new course', operationId: 'create', tags: ['courses'], description: 'Create a new course'})
  @ApiResponse({
    status: 201,
    description: 'The course has been successfully created.',
  })
  @ApiBody({
    type: CreateCourseDTO,
    description: 'Create a new course',
  })
  async create(@Body() createCourseDTO: CreateCourseDTO) {
    await this.coursesService.create(createCourseDTO);
  }

  @Get()
  @ApiOperation({ summary: 'Retrieve a paginated list of courses'})
  @ApiQuery({ name: 'page', required: false, description: 'Page number', example: 1, type: Number })
  @ApiQuery({ name: 'limit', required: false, description: 'Number of items per page', example: 20, type: Number })
  @ApiResponse({
    status: 200,
    description: 'Successful retrieval of courses',
    schema: {
      type: 'object',
      properties: {
        items: {
          type: 'array',
          items: {$ref: getSchemaPath(Course)}
        },
        meta: {
          type: 'object',
          properties: {
            totalItems: { type: 'number' },
            itemCount: { type: 'number' },
            itemsPerPage: { type: 'number' },
            totalPages: { type: 'number' },
            currentPage: { type: 'number' },
          },
        },
      },
    },
  })
  @ApiResponse({
    status: 500,
    description: 'Server Error',
    schema: {
      properties: {
        message: { type: 'string' },
      }
    }
  })
  async findAll(
    @Query("page", new DefaultValuePipe(1), ParseIntPipe)
    page: number,
    @Query("limit", new DefaultValuePipe(20), ParseIntPipe)
    limit: number,
  ): Promise<Pagination<Course>> {
    try {
      return await this.coursesService.findAll(page, limit);
    } catch (error) {
      throw new HttpException(
        'Server Error',
        HttpStatus.INTERNAL_SERVER_ERROR,
        {
          cause: error.message,
        },
      );
    }
  }

  @Get(':id')
  async findOne(
    @Param(
      'id',
      new ParseIntPipe({ errorHttpStatusCode: HttpStatus.NOT_ACCEPTABLE }),
    )
    id: string,
  ): Promise<Course> {
    try {
      const course = await this.coursesService.findOne(id);
      return course;
    } catch (error) {
      throw new HttpException('Course not found', HttpStatus.NOT_FOUND, {
        cause: error.message,
      });
    }
  }

  @Put(':id')
  async update(
    @Param(
      'id',
      new ParseIntPipe({ errorHttpStatusCode: HttpStatus.NOT_ACCEPTABLE }),
    )
    id: string,
    @Body() course: UpdateCourseDTO,
  ) {
    await this.coursesService.update(id, course);
  }
}
