import { MiddlewareConsumer, Module, NestModule } from '@nestjs/common';
import { AppController } from './app.controller';
import { AppService } from './app.service';
import { ProgramsController } from './programs/programs.controller';
import { ProgramModule } from './programs/programs.module';
import { TypeOrmModule } from '@nestjs/typeorm';
import { DataSource } from 'typeorm';
import { ProgramsService } from './programs/programs.service';
import { CoursesModule } from './courses/courses.module';
import { CoursesService } from './courses/courses.service';
import { CoursesController } from './courses/courses.controller';
import { LoggerMiddleware } from './common/middleware/logger/logger.middleware';
import { DevConfigService } from './common/providers/DevConfigService';
import { CoursesProgramsModule } from './courses-programs/courses-programs.module';
import { Program } from './programs/program.entity';
import { Course } from './courses/course.entity';
import { CourseProgram } from './courses-programs/course-program.entity';

const devConfig = {
  port: 3000,
};

const proConfig = {
  port: 8080,
};
@Module({
  imports: [
    TypeOrmModule.forRoot({
      type: 'mariadb',
      database: 'university',
      host: 'localhost',
      port: 3306,
      username: 'admin',
      password: '12345',
      synchronize: true,
      entities: [Program, Course, CourseProgram],
    }),
    ProgramModule,
    CoursesModule,
    CoursesProgramsModule,
  ],
  controllers: [AppController],
  providers: [
    AppService,
    {
      provide: DevConfigService,
      useClass: DevConfigService,
    },
    {
      provide: 'CONFIG',
      useFactory: () => {
        return process.env.NODE_ENV === 'development' ? devConfig : proConfig;
      },
    },
  ],
})
export class AppModule implements NestModule {
  constructor(private dataSource: DataSource) {
    console.log('Database: ', this.dataSource.driver.database);
  }

  configure(consumer: MiddlewareConsumer) {
    consumer
      .apply(LoggerMiddleware)
      .forRoutes(ProgramsController, CoursesController);
  }
}
