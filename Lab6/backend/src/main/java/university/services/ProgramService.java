package university.services;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.dao.DataAccessException;
import org.springframework.dao.EmptyResultDataAccessException;
import org.springframework.stereotype.Service;
import university.repositories.ProgramRepository;
import university.entities.Program;
import java.util.List;

@Service
public class ProgramService {
  @Autowired
  private ProgramRepository programRepository;

  public List<Program> getAllPrograms() {
    return programRepository.findAll();
  }

  public List<String> getAllProgramName() {
    return programRepository.findAllProgramNames();
  }

  public Program getProgramById(int id) {
    return programRepository.findById(id).orElse(null);
  }

  public Program saveProgram(Program program) {
    return programRepository.save(program);
  }

  public String deleteById(int id) {
    try {
      programRepository.deleteById(id);
      return "Program deleted successfully";
    } catch (EmptyResultDataAccessException ex) {
      return "Error deleting program";
    } catch (DataAccessException ex) {
      return "Error deleting program";
    } catch (Exception ex) {
      return "Error deleting program";
    }
  }
}
