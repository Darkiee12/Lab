package university.repositories;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;
import org.springframework.stereotype.Repository;

import university.entities.CourseProgram;
import university.entities.CourseProgramId;

@Repository
public interface CourseProgramRepository extends JpaRepository<CourseProgram, CourseProgramId>{
  <S extends CourseProgram> S save(S entity);
}