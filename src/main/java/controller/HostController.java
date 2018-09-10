package controller;

import model.Host;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
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
    @RequestMapping(value = "/edit", method = RequestMethod.GET)
    public String modifyHost(@RequestParam("id") Integer id, ModelMap modelMap,
                             @RequestParam(required = false, name="error") String error) {
        modelMap.addAttribute("host", hostService.get(id));
        if(error != null) modelMap.addAttribute("error", error);
        return "modify_host";
    }

    @RequestMapping(value = "/edit", method = RequestMethod.POST)
    public String modifyHost(@RequestParam("id") Integer id,
                             @RequestParam("password") String password,
                             @RequestParam("repeatpassword") String repeatedPassword,
                             @RequestParam("phone") String phone,
                             @RequestParam("email") String email,
                             ModelMap modelMap, HttpSession session) {
        if(repeatedPassword.equals(password)){
        hostService.modify(id, password, phone, email);
        if(session.getAttribute("admin") != null) return "redirect:/admin/";
        else return "redirect:/organizer/";
        }
        return "redirect:/host/edit?id="+id+"&error="+"Two password entries are inconsistent.";
    }
}
