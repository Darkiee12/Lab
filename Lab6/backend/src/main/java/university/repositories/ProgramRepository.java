package university.repositories;
import java.util.List;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;
import org.springframework.stereotype.Repository;
import university.entities.Program;
import java.util.Optional;

@Repository
public interface ProgramRepository extends JpaRepository<Program, Integer>{
  List<Program> findAll();
  <S extends Program> S save(S entity);
  Optional<Program> findById(int id);
  void deleteById(int id);

  @Query("SELECT p.name FROM Program p")
  List<String> findAllProgramNames();
}
