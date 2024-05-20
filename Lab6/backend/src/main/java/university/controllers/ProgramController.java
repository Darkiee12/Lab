package university.controllers;
import org.springframework.web.bind.annotation.RestController;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.CrossOrigin;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.DeleteMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import university.entities.Program;
import university.services.ProgramService;
import java.util.List;
import io.swagger.v3.oas.annotations.Operation;
import io.swagger.v3.oas.annotations.Parameter;
import io.swagger.v3.oas.annotations.responses.ApiResponse;
import io.swagger.v3.oas.annotations.responses.ApiResponses;
import io.swagger.v3.oas.annotations.media.Content;
import io.swagger.v3.oas.annotations.media.Schema;

@RestController
@CrossOrigin
@RequestMapping("/api/program")
public class ProgramController {
  @Autowired
  private ProgramService programService;

  @GetMapping("/")
  public ResponseEntity<List<Program>> getAllPrograms () {
    return ResponseEntity.ok(programService.getAllPrograms());
  }

  @GetMapping("/names")
  public ResponseEntity<List<String>> getAllProgramNames() {
    return ResponseEntity.ok(programService.getAllProgramName());
  }

  @Operation(summary = "Get program by id")
  @ApiResponses(value = {
      @ApiResponse(responseCode = "200", description = "Found the program", content = {
          @Content(mediaType = "application/json", schema = @Schema(implementation = Program.class)) }),
      @ApiResponse(responseCode = "400", description = "Invalid id supplied", content = @Content),
      @ApiResponse(responseCode = "404", description = "Program not found", content = @Content)
  })
  @GetMapping("/{id}")
  public ResponseEntity<Program> getCourseById(@Parameter(description = "id of the program to find.") @RequestParam int id) {
    return ResponseEntity.ok(programService.getProgramById(id));
  }

  @Operation(summary = "Create a new program")
  @ApiResponses(value = {
      @ApiResponse(responseCode = "200", description = "Program saved successfully", content = {
        @Content(mediaType = "application/json", schema = @Schema(implementation = Program.class))}),
      @ApiResponse(responseCode = "400", description = "Error saving program", content = @Content),
      @ApiResponse(responseCode = "409", description = "Program already exists", content = @Content),
      @ApiResponse(responseCode = "429", description =  "Too many requests", content = @Content)
  })
  @PostMapping("/")
  public ResponseEntity<String> saveProgram(@RequestBody Program program) {
    Program newProgram = programService.saveProgram(program);
    if (newProgram != null) {
      return ResponseEntity.ok("Program saved successfully");
    } else {
      return ResponseEntity.badRequest().build();
    }
  }

  @Operation(summary = "Delete a program")
  @ApiResponses(value = {
      @ApiResponse(responseCode = "200", description = "Program deleted successfully", content = {
        @Content(mediaType = "application/json", schema = @Schema(implementation = Program.class))}),
      @ApiResponse(responseCode = "400", description = "Error deleting program", content = @Content),
      @ApiResponse(responseCode = "404", description = "Program not found", content = @Content)
  })
  @DeleteMapping("/{id}")
  public ResponseEntity<Void> deleteProgram(@RequestParam int id) {
    String result = programService.deleteById(id);
    if(result == "Error deleting program"){
      return ResponseEntity.badRequest().build();
    } else {
      return ResponseEntity.ok().build();
    }
  }

}