package university.controllers;
import org.springframework.web.bind.annotation.RestController;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.CrossOrigin;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import io.swagger.v3.oas.annotations.Operation;
import io.swagger.v3.oas.annotations.Parameter;
import io.swagger.v3.oas.annotations.responses.ApiResponse;
import io.swagger.v3.oas.annotations.responses.ApiResponses;
import io.swagger.v3.oas.annotations.media.Content;
import io.swagger.v3.oas.annotations.media.Schema;
import university.entities.CourseProgram;
import university.services.CourseProgramService;

@RestController
@CrossOrigin
@RequestMapping("/api/courseprogram")
public class CourseProgramController {
  @Autowired
  private CourseProgramService courseProgramService;

  @Operation(summary = "Create a new course program")
  @ApiResponses(value = {
      @ApiResponse(responseCode = "200", description = "Course program saved successfully", content = {
        @Content(mediaType = "application/json", schema = @Schema(implementation = CourseProgram.class))}),
      @ApiResponse(responseCode = "400", description = "Error saving course program", content = @Content),
      @ApiResponse(responseCode = "409", description = "Course program already exists", content = @Content),
      @ApiResponse(responseCode = "429", description =  "Too many requests", content = @Content)
  })
  @PostMapping("/")
  public ResponseEntity<CourseProgram> saveCourseProgram(@Parameter(description = "Save a program") @RequestBody CourseProgram entity) {
    CourseProgram courseProgram = courseProgramService.saveCourseProgram(entity);
    if (courseProgram != null) {
      return ResponseEntity.ok(courseProgram);
    } else {
      return ResponseEntity.badRequest().build();
    }
  }
}
