package controller;

import model.Host;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import service.HostService;
import service.SeminarService;

import javax.servlet.http.HttpSession;

@Controller
@RequestMapping(value = "/host")
public class HostController {

    @Autowired
    HostService hostService;

    @RequestMapping(value = "/", method = RequestMethod.GET)
    public String index(ModelMap modelMap, HttpSession session) {
        Host host = (Host) session.getAttribute("host");
        modelMap.addAttribute("seminars", hostService.getRelateSeminars(host));
        return "host_home";
    }
}
