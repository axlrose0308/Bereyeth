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

    @RequestMapping(value = {"/seminars/add"}, method = RequestMethod.GET)
    public String addSeminar(ModelMap modelMap, @RequestParam(required=false, name="error") String error) {
        modelMap.addAttribute("availableHosts", hostService.getAll());
        modelMap.addAttribute("error", error);
        modelMap.addAttribute("categories", CATEGORIES);
        return "create_seminar";
    }

    @RequestMapping(value = {"/seminars/add"}, method = RequestMethod.POST)
    public String saveSeminar(@RequestParam("location") String location,
                              @RequestParam("time") String time,
                              @RequestParam("subject") String subject,
                              @RequestParam("description") String description,
                              @RequestParam("duration") String duration,
                              @RequestParam("capacity") int capacity,
                              @RequestParam("holdDate") String date,
                              @RequestParam("hostId") Integer hostId,
                              @RequestParam("category") String category,
                              HttpSession session, ModelMap modelMap
    ) {
        Organizer organizer = (Organizer) session.getAttribute("organizer");
        Host host = hostService.get(hostId);
        Seminar seminar = new Seminar(location, time, subject, description, duration, capacity, organizer, host, date, category);
        try {
            seminarService.addSeminar(seminar);
        } catch (HostUnavailableException e) {
            return "redirect:/organizer/seminars/add?error="+e.getMessage();
        }
        return "redirect:/organizer/";
    }

    @RequestMapping(value = {"/seminars/delete"}, method = RequestMethod.GET)
    public String deleteSeminar(@RequestParam("seminarId") Integer id) {
        seminarService.deleteSeminar(id);
        return "redirect:/organizer/";
    }

    @RequestMapping(value = {"/seminars/edit"}, method = RequestMethod.GET)
    public String edit(@RequestParam("seminarId") Integer id, ModelMap modelMap,
                       @RequestParam(required = false, name="error") String error) {
        Seminar seminar = seminarService.get(id);
        modelMap.addAttribute("seminar", seminar);
        modelMap.addAttribute("availableHosts", hostService.getAll());
        modelMap.addAttribute("categories", CATEGORIES);
        if(error != null && !error.equals("")) modelMap.addAttribute("error", error);
        return "modify_seminar";
    }



    @RequestMapping(value = {"/seminars/edit"}, method = RequestMethod.POST)
    public String edit(@RequestParam("seminarId") Integer seminarId,
                       @RequestParam("location") String location,
                       @RequestParam("time") String time,
                       @RequestParam("subject") String subject,
                       @RequestParam("description") String description,
                       @RequestParam("duration") String duration,
                       @RequestParam("capacity") int capacity,
                       @RequestParam("holdDate") String holdDate,
                       @RequestParam("hostId") Integer hostId,
                       @RequestParam("category") String category) {
        try {
            seminarService.updateSeminar(seminarId, location, time, subject, description, duration, capacity, holdDate, hostId, category);
        } catch (HostUnavailableException e) {
            return "redirect:/organizer/seminars/edit?seminarId="+seminarId+"&error="+e.getMessage();
        }
        return "redirect:/organizer/seminars";
    }
}
