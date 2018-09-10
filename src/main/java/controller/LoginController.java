package controller;

import exception.LoginFailException;
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
import service.HostService;
import service.OrganizerService;

import javax.servlet.http.HttpServletRequest;

@Controller
@SessionAttributes(value = {"admin", "host", "organizer"})
@RequestMapping(value = "/login")
public class LoginController {

    @Autowired
    AdminService adminService;

    @Autowired
    HostService hostService;

    @Autowired
    OrganizerService organizerService;

    @Autowired
    HttpServletRequest request;

    @RequestMapping(value = "/admin", method = RequestMethod.POST)
    public String getAdmin(@RequestParam("username") String username,
                           @RequestParam("password") String password,
                           ModelMap modelMap) {
        Admin admin = null;
        try {
            admin = adminService.login(username, password);
            modelMap.addAttribute("admin", admin);
            modelMap.addAttribute("hosts", hostService.getAll());
            modelMap.addAttribute("organizers",organizerService.getAll());
            return "admin_home";
        } catch (LoginFailException e) {
            return loginError("admin_login", modelMap, e.getMessage());
        }

    }

    @RequestMapping(value = "/host", method = RequestMethod.POST)
    public String getHost(@RequestParam("username") String username,
                          @RequestParam("password") String password,
                          ModelMap modelMap) {
        Host host = null;
        try {
            host = hostService.login(username, password);
            modelMap.addAttribute("host", host);
            modelMap.addAttribute("seminars", hostService.getRelateSeminars(host));
            return "host_home";
        } catch (LoginFailException e) {
            return loginError("host_login", modelMap, e.getMessage());
        }

    }


    @RequestMapping(value = "/organizer", method = RequestMethod.POST)
    public String getOrganizer(@RequestParam("username") String username,
                               @RequestParam("password") String password,
                               ModelMap modelMap) {
        Organizer organizer = null;
        try {
            organizer = organizerService.login(username, password);
            modelMap.addAttribute("organizer", organizer);
            return "redirect:/organizer/";
        } catch (LoginFailException e) {

           return loginError("organizer_login", modelMap, e.getMessage());
        }

    }

    private String loginError(String path, ModelMap modelMap, String error){
        modelMap.addAttribute("error", error);
        return path;
    }
}
