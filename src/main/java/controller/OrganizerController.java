package controller;

import com.sun.org.apache.xpath.internal.operations.Mod;
import com.sun.org.apache.xpath.internal.operations.Or;
import model.Host;
import model.Organizer;
import model.Seminar;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import service.HostService;
import service.SeminarService;

import javax.jws.WebParam;
import javax.servlet.http.HttpSession;
import java.sql.Date;
import java.sql.Time;

@Controller
@RequestMapping(value = "/organizer")
public class OrganizerController {
    @Autowired
    SeminarService seminarService;
    @Autowired
    HostService hostService;

    @RequestMapping(value = {"/","/seminars"}, method = RequestMethod.GET )
    public String getSeminars(HttpSession session, ModelMap modelMap) {
        Organizer organizer = (Organizer) session.getAttribute("organizer");
        modelMap.addAttribute("seminars", seminarService.getAllByOrganiserId(organizer));
        return "organizer_home";
    }

    @RequestMapping(value = {"/seminars/add"}, method = RequestMethod.GET )
    public String addSeminar(ModelMap modelMap) {
        modelMap.addAttribute("availableHosts", seminarService.getAvailableHosts());
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
                              @RequestParam("hostId")Integer hostId,
                              HttpSession session
                              ){
        Organizer organizer = (Organizer) session.getAttribute("organizer");
        Host host = hostService.get(hostId);
        Seminar seminar = new Seminar(location, time, subject, description, duration, capacity, organizer, host, date);
        seminarService.addSeminar(seminar);
        return "redirect:/organizer/";
    }
}
