package controller;

import exception.HostUnavailableException;
import model.Host;
import model.Organizer;
import model.Seminar;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;

import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import service.HostService;
import service.SeminarService;

import javax.servlet.http.HttpSession;

import static model.Seminar.CATEGORIES;

@Controller
@RequestMapping(value = "/organizer")
public class OrganizerController {
    @Autowired
    SeminarService seminarService;
    @Autowired
    HostService hostService;

    @RequestMapping(value = {"/", "/seminars"}, method = RequestMethod.GET)
    public String getSeminars(HttpSession session, ModelMap modelMap) {
        Organizer organizer = (Organizer) session.getAttribute("organizer");
        modelMap.addAttribute("seminars", seminarService.getAllByOrganiserId(organizer));
        modelMap.addAttribute("hosts", hostService.getAll());
        return "organizer_home";
    }

}
