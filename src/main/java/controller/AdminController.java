package controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import service.HostService;
import service.OrganizerService;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

@Controller
@RequestMapping(value = "/admin")
public class AdminController {

    Integer tempHostId;
    Integer tempOrganizerId;

    @Autowired
    HostService hostService;

    @Autowired
    OrganizerService organizerService;

    @RequestMapping(value = "/add_host", method = RequestMethod.POST)
    public String creatHost(HttpSession session,
                            ModelMap modelMap,
                            @RequestParam("username") String username,
                            @RequestParam("password") String password,
                            @RequestParam("phone") String phone,
                            @RequestParam("email") String email) {
        hostService.addHost(session, username, password, phone, email);
        refreshPageContent(modelMap);
        return "admin_home";
    }

    @RequestMapping(value = "/modify_host", method = RequestMethod.GET)
    public String modifyHost(HttpServletRequest request) {
        tempHostId = Integer.parseInt(request.getParameter("id"));
        return "modify_host";
    }

    @RequestMapping(value = "/save_changed_host", method = RequestMethod.POST)
    public String saveChangedHost(HttpSession session,
                                  @RequestParam("username") String username,
                                  @RequestParam("password") String password,
                                  @RequestParam("repeatpassword") String repeatPassword,
                                  @RequestParam("phone") String phone,
                                  @RequestParam("email") String email,
                                  ModelMap modelMap) {
        if (password.equals(repeatPassword)) {
            hostService.modify(session, tempHostId, username, password, phone, email);
            tempHostId = null;
        }
        refreshPageContent(modelMap);
        return "admin_home";
    }

    @RequestMapping(value = "/delete_host", method = RequestMethod.GET)
    public String deleteHost(HttpServletRequest request,
                             ModelMap modelMap) {
        hostService.delete(Integer.parseInt(request.getParameter("id")));
        refreshPageContent(modelMap);
        return "admin_home";
    }

    @RequestMapping(value = "/add_organizer", method = RequestMethod.POST)
    public String createOrganizer(HttpSession session,
                                  ModelMap modelMap,
                                  @RequestParam("username") String username,
                                  @RequestParam("password") String password,
                                  @RequestParam("email") String email) {
        organizerService.add(session, username, password, email);
        refreshPageContent(modelMap);
        return "admin_home";
    }

    @RequestMapping(value = "/modify_organizer", method = RequestMethod.GET)
    public String modifyOrganizer(HttpServletRequest request) {
        tempOrganizerId = Integer.parseInt(request.getParameter("id"));
        return "modify_organizer";
    }

    @RequestMapping(value = "/save_changed_organizer", method = RequestMethod.POST)
    public String saveChangedOrganizer(HttpSession session,
                                       @RequestParam("username") String username,
                                       @RequestParam("password") String password,
                                       @RequestParam("repeatpassword") String repeatPassword,
                                       @RequestParam("email") String email,
                                       ModelMap modelMap) {
        if (password.equals(repeatPassword)) {
            organizerService.modify(session, tempOrganizerId, username, password, email);
            tempOrganizerId = null;
        }
        refreshPageContent(modelMap);
        return "admin_home";
    }

    @RequestMapping(value = "/delete_organizer", method = RequestMethod.GET)
    public String deleteOrganizer(HttpServletRequest request,
                                  ModelMap modelMap) {
        organizerService.delete(Integer.parseInt(request.getParameter("id")));
        refreshPageContent(modelMap);
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

    private void refreshPageContent(ModelMap modelMap) {
        modelMap.addAttribute("hosts", hostService.getAll());
        modelMap.addAttribute("organizers", organizerService.getAll());
    }

}
