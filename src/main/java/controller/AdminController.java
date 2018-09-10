package controller;

import exception.ModifyException;
import model.Admin;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import service.HostService;
import service.OrganizerService;

import javax.persistence.criteria.CriteriaBuilder;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

@Controller
@RequestMapping(value = "/admin")
public class AdminController {


    @Autowired
    HostService hostService;

    @Autowired
    OrganizerService organizerService;

    @RequestMapping(value = "/", method = RequestMethod.GET)
    public String home(ModelMap modelMap) {
        modelMap.addAttribute("hosts", hostService.getAll());
        modelMap.addAttribute("organizers", organizerService.getAll());
        return "admin_home";
    }

    @RequestMapping(value = "/add_host", method = RequestMethod.POST)
    public String creatHost(HttpSession session,
                            ModelMap modelMap,
                            @RequestParam("username") String username,
                            @RequestParam("password") String password,
                            @RequestParam("phone") String phone,
                            @RequestParam("email") String email) {
        try {
            hostService.addHost(session, username, password, phone, email);
            return "redirect:/admin/";
        } catch (ModifyException e) {
            modelMap.addAttribute("error", e.getMessage());
            return "create_host";
        }

    }

    @RequestMapping(value = "/delete_host", method = RequestMethod.GET)
    public String deleteHost(@RequestParam("id") Integer id) {
        hostService.delete(id);
        return "redirect:/admin/";
    }

    @RequestMapping(value = "/add_organizer", method = RequestMethod.POST)
    public String createOrganizer(HttpSession session,
                                  ModelMap modelMap,
                                  @RequestParam("username") String username,
                                  @RequestParam("password") String password,
                                  @RequestParam("email") String email) {
        try {
            organizerService.add(session, username, password, email);
            return "redirect:/admin/";
        } catch (ModifyException e) {
            modelMap.addAttribute("error", e.getMessage());
            return "create_organizer";
        }

    }

    @RequestMapping(value = "/modify_organizer", method = RequestMethod.GET)
    public String modifyOrganizer(@RequestParam("id") Integer id, ModelMap modelMap, @RequestParam(required = false, name = "error") String error) {
        modelMap.addAttribute("organizer", organizerService.get(id));
        if(error != null) modelMap.addAttribute("error", error);
        return "modify_organizer";
    }

    @RequestMapping(value = "/modify_organizer", method = RequestMethod.POST)
    public String saveChangedOrganizer(@RequestParam("id") Integer id,
                                       @RequestParam("password") String password,

                                       @RequestParam("repeatpassword") String repeatpassword,
                                       @RequestParam("phone") String phone,
                                       @RequestParam("email") String email, HttpSession session) {
        if (password.equals(repeatpassword)) {
            Admin admin = (Admin) session.getAttribute("admin");
            organizerService.modify(id, password, email, admin, phone);
            return "redirect:/admin/";
        }
        return "redirect:/admin/modify_organizer?id=" + id + "&error=" + "Two password entries are inconsistent.";
    }

    @RequestMapping(value = "/delete_organizer", method = RequestMethod.GET)
    public String deleteOrganizer(@RequestParam("id") Integer id) {
        organizerService.delete(id);
        return "redirect:/admin/";
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
