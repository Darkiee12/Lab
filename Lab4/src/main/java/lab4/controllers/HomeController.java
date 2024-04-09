package lab4.controllers;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;

import jakarta.servlet.http.HttpServletRequest;


@Controller
public class HomeController {
    @GetMapping("/")
    public String home() {
        return "WEB-INF/views/emailList.jsp";
    }

    @PostMapping("/results")
    public String getThreeParams(HttpServletRequest request) {
        String email = request.getParameter("email");
        String firstname = request.getParameter("firstname");
        String lastname = request.getParameter("lastname");
        request.setAttribute("email", email);
        request.setAttribute("firstname", firstname);
        request.setAttribute("lastname", lastname);
        return "forward:/WEB-INF/views/emailResult.jsp";
    }

    
}
