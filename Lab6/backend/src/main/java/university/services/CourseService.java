package university.services;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import university.repositories.CourseRepository;
import university.entities.Course;
import java.util.List;
@Service
public class CourseService {
  @Autowired
  private CourseRepository courseRepository;
  
  public List<Course> getAllCourses() {
    return courseRepository.findAll();
  }

  public Course getCourseById(String id) {
    return courseRepository.findById(id).orElse(null);
  }

  public Course saveCourse(Course course) {
    return courseRepository.save(course);
  }

  public void deleteCourse(String id) {
    courseRepository.deleteById(id);
  }
}
