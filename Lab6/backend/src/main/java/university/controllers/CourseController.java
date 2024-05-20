package university.controllers;

import org.springframework.web.bind.annotation.RestController;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.CrossOrigin;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.DeleteMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;

import university.entities.Course;
import university.services.CourseService;
import java.util.List;
import io.swagger.v3.oas.annotations.Operation;
import io.swagger.v3.oas.annotations.Parameter;
import io.swagger.v3.oas.annotations.responses.ApiResponse;
import io.swagger.v3.oas.annotations.responses.ApiResponses;
import io.swagger.v3.oas.annotations.media.Content;
import io.swagger.v3.oas.annotations.media.Schema;
import org.springframework.web.bind.annotation.PutMapping;


@RestController
@CrossOrigin
@RequestMapping("/api/course")
public class CourseController {
  @Autowired
  private CourseService courseService;

  @Operation(summary = "Get all courses", description = "Get all courses from the system.")
  @ApiResponses(value = {
      @ApiResponse(responseCode = "200", description = "Found the courses", content = {
          @Content(mediaType = "application/json", schema = @Schema(implementation = Course.class)) }),
      @ApiResponse(responseCode = "404", description = "No courses found", content = @Content),
      @ApiResponse(responseCode = "500", description = "Internal server error", content = @Content)
  })

  @GetMapping("/")
  public ResponseEntity<List<Course>> getAllCourses() {
    return ResponseEntity.ok(courseService.getAllCourses());
  }

  @Operation(summary = "Get course by id")
  @ApiResponses(value = {
      @ApiResponse(responseCode = "200", description = "Found the course", content = {
          @Content(mediaType = "application/json", schema = @Schema(implementation = Course.class)) }),
      @ApiResponse(responseCode = "400", description = "Invalid id supplied", content = @Content),
      @ApiResponse(responseCode = "404", description = "Course not found", content = @Content)
  })
  @GetMapping("/{id}")
  public ResponseEntity<Course> getCourseById(
      @Parameter(description = "id of the course to find.") @PathVariable String id) {
    return ResponseEntity.ok(courseService.getCourseById(id));
  }

  @PostMapping("/")
  public ResponseEntity<Course> saveCourse(@RequestBody Course course) {
    return ResponseEntity.ok(courseService.saveCourse(course));
  }

  @Operation(summary = "Update a course by ID", description = "Updates a course in the system based on the provided course ID.")
  @ApiResponses(value = {
      @ApiResponse(responseCode = "200", description = "Course successfully updated", content = {
          @Content(mediaType = "application/json", schema = @Schema(implementation = Course.class)) }),
      @ApiResponse(responseCode = "400", description = "Invalid ID supplied", content = @Content),
      @ApiResponse(responseCode = "404", description = "Course not found", content = @Content),
      @ApiResponse(responseCode = "500", description = "Internal server error", content = @Content)
  })
  
  @PutMapping("/{id}")
  public ResponseEntity<Course> updateCourse(
      @Parameter(description = "ID of the course to update") @PathVariable String id,
      @RequestBody Course course) {
    Course updated = courseService.saveCourse(course);
    if (updated == null) {
      return ResponseEntity.internalServerError().build();
    } else {
      return ResponseEntity.ok(updated);
    }
  }

  @Operation(summary = "Delete a course by ID", description = "Deletes a course from the system based on the provided course ID.")
  @ApiResponses(value = {
      @ApiResponse(responseCode = "200", description = "Course successfully deleted"),
      @ApiResponse(responseCode = "404", description = "Course not found"),
      @ApiResponse(responseCode = "500", description = "Internal server error")
  })
  @DeleteMapping("/{id}")
  public ResponseEntity<Void> deleteCourse(
      @Parameter(description = "ID of the course to delete") @PathVariable String id) {
    courseService.deleteCourse(id);
    return ResponseEntity.ok().build();
  }

}