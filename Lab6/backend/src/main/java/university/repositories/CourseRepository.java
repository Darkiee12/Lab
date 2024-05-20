package university.repositories;
import java.util.List;

import org.springframework.stereotype.Repository;

import university.entities.Course;

import org.springframework.data.jpa.repository.JpaRepository;
import java.util.Optional;

@Repository
public interface CourseRepository extends JpaRepository<Course, String>{
  List<Course> findAll();
  <S extends Course> S save(S entity);
  Optional<Course> findById(String id);
  void deleteById(String id);
}
