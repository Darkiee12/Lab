package university.services;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import university.entities.CourseProgram;
import university.repositories.CourseProgramRepository;

@Service
public class CourseProgramService {
  @Autowired CourseProgramRepository courseProgramRepository;
  public CourseProgram saveCourseProgram(CourseProgram entity) {
    return courseProgramRepository.save(entity);
  }
}
