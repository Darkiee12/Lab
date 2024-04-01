package lab3.controllers;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;

import jakarta.servlet.http.HttpServletRequest;


@Controller
public class HomeController {
    @GetMapping("/")
    public String home() {
        return "WEB-INF/views/index.jsp";
    }

    @PostMapping("/results")
    public String getThreeParams(HttpServletRequest request) {
        String param1 = request.getParameter("param1");
        String param2 = request.getParameter("param2");
        String param3 = request.getParameter("param3");
        request.setAttribute("param1", param1);
        request.setAttribute("param2", param2);
        request.setAttribute("param3", param3);

        return "forward:/WEB-INF/views/result.jsp";
    }

    
}
