package controller;

import model.Admin;
import model.Host;
import model.Organizer;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import service.HostService;
import service.OrganizerService;

import javax.servlet.http.HttpSession;

@Controller
@RequestMapping(value = "/admin")
public class AdminController {

    @Autowired
    HostService hostService;

    @Autowired
    OrganizerService organizerService;

    @RequestMapping(value = "/addhost", method = RequestMethod.POST)
    public String creatHost(HttpSession session,
                            @RequestParam("username") String username,
                            @RequestParam("password") String password,
                            @RequestParam("phone") String phone,
                            @RequestParam("email") String email) {
        Admin admin = (Admin) session.getAttribute("admin");
        Host host = new Host();
        host.setEmail(email);
        host.setPhone(phone);
        host.setUsername(username);
        host.setPassword(password);
        host.setAdminByAdminId(admin);
        hostService.addHost(host);
        return "admin_home";
    }

    @RequestMapping(value = "/addorganizer", method = RequestMethod.POST)
    public String createOrganizer(HttpSession session,
                                  @RequestParam("username") String username,
                                  @RequestParam("password") String password,
                                  @RequestParam("email") String email) {
        Admin admin = (Admin) session.getAttribute("admin");
        Organizer organizer = new Organizer();
        organizer.setUsername(username);
        organizer.setPassword(password);
        organizer.setEmail(email);
        organizer.setAdminByAdminId(admin);
        organizerService.addOrganizer(organizer);
        return "admin_home";
    }

    @RequestMapping(value = "/get_type", method = RequestMethod.POST)
    public String getType(@RequestParam("createType") String type) {
        if (type.equals("Host")) {
           return "create_host";
        } else if (type.equals("Organizer")) {
            return "create_organizer";
        }
        return "admin_home";
    }

}
