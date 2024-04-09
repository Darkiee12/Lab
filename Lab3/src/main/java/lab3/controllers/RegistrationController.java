package lab3.controllers;

import java.io.FileNotFoundException;
import java.io.IOException;
import java.util.Arrays;
import java.util.List;
import java.util.stream.Collectors;
import org.springframework.core.io.ClassPathResource;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import com.fasterxml.jackson.databind.ObjectMapper;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import lab3.models.Major;
import lab3.models.Programme;
import lab3.models.Course;

@Controller
public class RegistrationController {
  private Programme programme;

  @GetMapping("/registerform")
  public String register(HttpServletRequest request) {
    ObjectMapper objectMapper = new ObjectMapper();
    try {
      ClassPathResource cpr = new ClassPathResource("./detail.json");
      Programme programme = objectMapper.readValue(cpr.getInputStream(), Programme.class);
      this.programme = programme;
      request.setAttribute("programme", programme);
    } catch (FileNotFoundException e) {
      e.printStackTrace();
      return "error";
    } catch (IOException e) {
      e.printStackTrace();
      return "error";
    } catch (Exception e) {
      e.printStackTrace();
      return "error";
    }
    return "WEB-INF/views/RegisterForm.jsp";
  }

  @GetMapping("/majors={selectedMajor}")
  public void majors(@PathVariable String selectedMajor, HttpServletResponse response) throws IOException {
    System.out.println("Requested major: " + selectedMajor);
    Major major = programme.getMajor(selectedMajor);
    List<Course> courses = major.getCourses();
    StringBuilder htmlBuilder = new StringBuilder();
    for (Course course : courses) {
      htmlBuilder.append("<div class=\"flex items-center w-full p-[10px] rounded-[5px]\">")
          .append("<input type='checkbox' name='course' id='").append(course.getName()).append("' value='")
          .append(course.getCode()).append("'")
          .append(" onClick=\"showDetail('").append(major.getCode()).append("','").append(course.getCode())
          .append("')\">")
          .append("<label class='mb-2 ml-4'>").append(course.getName()).append("</label>")
          .append("</div>");

    }
    response.setContentType("text/html");
    response.getWriter().write(htmlBuilder.toString());
  }

  @GetMapping("/majors={majorCode}/courses={courseCode}")
  public void courses(@PathVariable String majorCode, @PathVariable String courseCode, HttpServletResponse response)
      throws IOException {
    System.out.println("Requested course: " + courseCode);
    System.out.println("Requested major: " + majorCode);
    Course course = programme.getMajorFromCode(majorCode).getCourseFromCode(courseCode);
    StringBuilder htmlBuilder = new StringBuilder();
    htmlBuilder.append("<div class='w-full h-full'>")
        .append("<div class='flex justify-center'>")
        .append("<img src='").append(course.getImage()).append("' class='w-[200px] h-[200px] rounded-full'>")
        .append("</div>")
        .append("<p class='text-2xl font-bold text-center'>").append(course.getName()).append("</p>")
        .append("<p class=''>Instructor: ").append(course.getInstructor()).append("</p>")
        .append("<p class=''>Description:</p>")
        .append("<p class=''>").append(course.getDescription()).append("</p>")
        .append("</div>");
    response.setContentType("text/html");
    response.getWriter().write(htmlBuilder.toString());
  }

  @PostMapping("/registerresult")
  public String registerresul(HttpServletRequest request) {
    String name = request.getParameter("name");
    String id = request.getParameter("id");
    String email = request.getParameter("email");
    String major = request.getParameter("major");
    List<String> courses = Arrays
        .asList(request.getParameterValues("course"))
        .stream()
        .map(code -> {
          return this.programme.getMajor(major).getCourseFromCode(code).getName();
        })
        .collect(Collectors.toList());

    request.setAttribute("name", name);
    request.setAttribute("id", id);
    request.setAttribute("email", email);
    request.setAttribute("major", major);
    request.setAttribute("courses", courses);
    return "forward:/WEB-INF/views/ResultRegister.jsp";
  }

}
