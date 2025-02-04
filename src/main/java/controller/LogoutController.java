package controller;

import com.mysql.cj.Session;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.support.SessionStatus;

import javax.servlet.http.HttpSession;

@Controller
public class LogoutController {

    @RequestMapping(value = "/logout", method = RequestMethod.GET)
    public String logout(HttpSession session) {
        session.invalidate();
        return "redirect:/";
    }
}
