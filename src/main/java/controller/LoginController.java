package controller;

import model.Admin;
import model.Host;
import model.Organizer;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.SessionAttributes;
import service.AdminService;

import javax.servlet.http.HttpServletRequest;

@Controller
@SessionAttributes("admin")
public class LoginController {

    @Autowired
    AdminService adminService;

    @Autowired
    HttpServletRequest request;

    @RequestMapping(value = "/", method = RequestMethod.GET)
    public String index() {
        return "index";
    }

    @RequestMapping(value = "/admin", method = RequestMethod.GET)
    public String admin() {
        return "admin_login";
    }

    @RequestMapping(value = "/host", method = RequestMethod.GET)
    public String host() {
        return "host_login";
    }

    @RequestMapping(value = "/organizer", method = RequestMethod.GET)
    public String orgnizer() {
        return "organizer_login";
    }

    @RequestMapping(value = "/loginAdmin", method = RequestMethod.POST)
    public String getAdmin(@RequestParam("username") String username,
                           @RequestParam("password") String password,
                           ModelMap modelMap) {
        Admin admin = adminService.login(username, password);
        modelMap.addAttribute("admin",admin);
        return "admin_home";
    }
}
