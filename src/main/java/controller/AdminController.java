package controller;

import model.Admin;
import model.Host;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import service.HostService;

import javax.servlet.http.HttpSession;

@Controller
@RequestMapping(value = "/admin")
public class AdminController {

    @Autowired
    HostService hostService;

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
