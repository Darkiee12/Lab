package lab5.controller;

import java.io.IOException;
import java.io.PrintWriter;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestParam;

import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

@Controller
public class HomeController {
  private String message;

  public void init() {
    message = "Hello World!";
  }

  @GetMapping("/hello-servlet")
  public String doGet(HttpServletRequest request, HttpServletResponse response) throws IOException {
    response.setContentType("text/html");
    PrintWriter out = response.getWriter();
    out.println("<html><body>");
    out.println("<h1>" + message + "</h1>");
    out.println("</body></html>");
    return "WEB-INF/views/index.jsp";
  }

  @GetMapping("/login")
  public String doGetLogin() {
      return "WEB-INF/views/login.jsp";
  }

  @GetMapping("/CourseList")
  public String doGetCourseList(@RequestParam String param) {
      return "WEB-INF/views/CourseList.jsp";
  }
  
  @GetMapping("/DeleteCourse")
  public String doGetDeleteCourse(@RequestParam String param) {
      return "WEB-INF/views/DeleteCourse.jsp";
  }

  @GetMapping("/DeleteStudent")
  public String doGetDeleteStudent(@RequestParam String param) {
      return "WEB-INF/views/DeleteStudent.jsp";
  }

  @GetMapping("/EditCourse")
  public String doGetEditCourse(@RequestParam String param) {
      return "WEB-INF/views/EditCourse.jsp";
  }

  @GetMapping("/EditStudent")
  public String doGetEditStudent(@RequestParam String param) {
      return "WEB-INF/views/EditStudent.jsp";
  }

  @GetMapping("/StudentList")
  public String doGetStudentList(@RequestParam String param) {
      return "WEB-INF/views/StudentList.jsp";
  }

  @GetMapping("/Registration")
  public String doGetRegistration(@RequestParam String param) {
      return "WEB-INF/views/Registration.jsp";
  }
  

}
