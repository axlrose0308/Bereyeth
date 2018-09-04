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
        Admin admin = adminService.login(username, password);
        modelMap.addAttribute("admin", admin);
        modelMap.addAttribute("hosts", hostService.getAll());
        modelMap.addAttribute("organizers",organizerService.getAll());
        return "admin_home";
    }

    @RequestMapping(value = "/host", method = RequestMethod.POST)
    public String getHost(@RequestParam("username") String username,
                          @RequestParam("password") String password,
                          ModelMap modelMap) {
        Host host = hostService.login(username, password);
        modelMap.addAttribute("host", host);
        return "host_home";
    }

    @RequestMapping(value = "/organizer", method = RequestMethod.POST)
    public String getOrganizer(@RequestParam("username") String username,
                               @RequestParam("password") String password,
                               ModelMap modelMap) {
        Organizer organizer = organizerService.login(username, password);
        modelMap.addAttribute("organizer", organizer);
        return "organizer_home";
    }
}
