package controller;

import exception.HostUnavailableException;
import exception.RegisteredException;
import model.Attendee;
import model.Host;
import model.Organizer;
import model.Seminar;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpHeaders;
import org.springframework.http.HttpStatus;
import org.springframework.http.MediaType;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import service.AttendeeService;
import service.HostService;
import service.OrganizerService;
import service.SeminarService;
import util.PdfUtil;

import javax.servlet.http.HttpSession;
import java.util.List;

import static model.Seminar.CATEGORIES;

@Controller
@RequestMapping(value = "/seminar")
public class SeminarController {

    @Autowired
    HostService hostService;

    @Autowired
    SeminarService seminarService;

    @Autowired
    AttendeeService attendeeService;

    @Autowired
    OrganizerService organizerService;

    @RequestMapping(value = "/details", method = RequestMethod.GET)
    public String details(@RequestParam("id") Integer id, @RequestParam(required = false, name = "error") String error,
                          ModelMap modelMap) {
        modelMap.addAttribute("seminar", seminarService.get(id));
        if (error != null) modelMap.addAttribute("error", error);
        return "seminar_detail";
    }

    @RequestMapping(value = "/register", method = RequestMethod.POST)
    public String register(@RequestParam("email") String email,
                           @RequestParam("nameTag") String nameTag,
                           @RequestParam("seminarId") Integer seminarId,
                           ModelMap modelMap) {

        Seminar seminar = seminarService.get(seminarId);
        Attendee attendee = new Attendee(email, nameTag, seminar);
        try {
            String code = attendeeService.add(attendee);
            modelMap.addAttribute("attendee", attendee);
            modelMap.addAttribute("seminar", seminar);
            modelMap.addAttribute("code", code);
            return "registered";
        } catch (RegisteredException e) {
            return "redirect:/seminar/details?id=" + seminarId + "&error=" + e.getMessage();
        }

    }

    @RequestMapping(value = "/attendees", method = RequestMethod.GET)
    public String viewAttendees(@RequestParam("seminarId") Integer seminarId, ModelMap modelMap) {
        List<Attendee> attendees = seminarService.getAttendees(seminarId);
        modelMap.addAttribute("attendees", attendees);
        modelMap.addAttribute("seminar", seminarService.get(seminarId));
        return "attendees";
    }

    @RequestMapping(value = "/attendees/edit", method = RequestMethod.GET)
    public String editAttendee(@RequestParam("id") Integer id,
                               @RequestParam(required = false, name="seminarId") Integer seminarId, ModelMap modelMap
                                ) {
        if(seminarId != null) modelMap.addAttribute("seminarId", seminarId);
        modelMap.addAttribute("attendee_editted", attendeeService.get(id));

        return "modify_attendee";
    }

    @RequestMapping(value = "/attendees/edit", method = RequestMethod.POST)
    public String editAttendee(@RequestParam("id") Integer id, @RequestParam("name")String nameTag,
                                @RequestParam(required = false, name = "seminarId")Integer seminarId,
                                HttpSession session) {
        String path;
        if(session.getAttribute("admin") != null) path = "/admin/";
        else path = "/organizer/";
        attendeeService.modify(id, nameTag);
        if(seminarId != null) return "redirect:/seminar/attendees?seminarId="+seminarId;
        return "redirect:" + path;
    }

    @RequestMapping(value = "/attendees/delete", method = RequestMethod.GET)
    public String viewAttendees(@RequestParam(required = false, name = "id") Integer attendeeId,
                                @RequestParam(required = false, name = "seminarId") Integer seminarId,
                                @RequestParam(required = false, name = "code") String code, ModelMap modelMap) {
        if (attendeeId != null) {
            attendeeService.delete(attendeeId);
            return "redirect:/seminar/attendees?seminarId=" + seminarId;
        }
        else {
            Seminar seminar = attendeeService.delete(code);
            if(seminar == null) {
                modelMap.addAttribute("error", "No registration of code " + code);
                return "redirect:/";
            }
            modelMap.addAttribute("seminar", seminar);
            return "cancel_registration";
        }
    }

    @RequestMapping("/attendees/download")
    public ResponseEntity<byte[]> download(@RequestParam("id") Integer id){
        Seminar seminar = seminarService.get(id);
        HttpHeaders headers = new HttpHeaders();
        String fileName = "attendees_seminar_no." + seminar.getId() + "_" + seminar.getSubject()+".pdf";

        headers.setContentDispositionFormData("attachment", fileName);
        headers.setContentType(MediaType.APPLICATION_OCTET_STREAM);
        return new ResponseEntity<byte[]>(
                PdfUtil.attendeeNamesPdf(seminarService.getAttendeeNames(seminar.getId()), seminar),
                headers, HttpStatus.OK);
    }

    @RequestMapping(value = {"/add"}, method = RequestMethod.GET)
    public String addSeminar(ModelMap modelMap, @RequestParam(required=false, name="error") String error,
                             HttpSession session) {
        modelMap.addAttribute("availableHosts", hostService.getAll());
        modelMap.addAttribute("error", error);
        modelMap.addAttribute("categories", CATEGORIES);
        if(session.getAttribute("admin") != null) {
            modelMap.addAttribute("organizers", organizerService.getAll());
        }
        return "create_seminar";
    }

    @RequestMapping(value = {"/add"}, method = RequestMethod.POST)
    public String saveSeminar(@RequestParam("location") String location,
                              @RequestParam("time") String time,
                              @RequestParam("subject") String subject,
                              @RequestParam("description") String description,
                              @RequestParam("duration") String duration,
                              @RequestParam("capacity") int capacity,
                              @RequestParam("holdDate") String date,
                              @RequestParam("hostId") Integer hostId,
                              @RequestParam("category") String category,
                              @RequestParam(value = "organizerId", required = false) Integer organizerId,
                              HttpSession session, ModelMap modelMap) {
        String path;
        Organizer organizer;
        if(session.getAttribute("admin") != null) {
            path = "/admin/";
            organizer = organizerService.get(organizerId);
        }
        else {
            path = "/organizer/";
            organizer = (Organizer) session.getAttribute("organizer");
        }

        Host host = hostService.get(hostId);
        Seminar seminar = new Seminar(location, time, subject, description, duration, capacity, organizer, host, date, category);
        try {
            seminarService.addSeminar(seminar);
        } catch (HostUnavailableException e) {
            return "redirect:/seminar/add?error=" + e.getMessage();
        }
        return "redirect:" + path;
    }

    @RequestMapping(value = {"/delete"}, method = RequestMethod.GET)
    public String deleteSeminar(@RequestParam("seminarId") Integer id, HttpSession session) {
        String path;
        seminarService.deleteSeminar(id);
        if(session.getAttribute("admin") != null) path = "/admin/";
        else  path = "/organizer/";
        return "redirect:"+path;
    }

    @RequestMapping(value = {"/edit"}, method = RequestMethod.GET)
    public String edit(@RequestParam("seminarId") Integer id, ModelMap modelMap, HttpSession session,
                       @RequestParam(required = false, name="error") String error) {
        Seminar seminar = seminarService.get(id);
        modelMap.addAttribute("seminar", seminar);
        modelMap.addAttribute("availableHosts", hostService.getAll());
        modelMap.addAttribute("categories", CATEGORIES);
        if(session.getAttribute("admin") != null) modelMap.addAttribute("organizers",
                organizerService.getAll());
        if(error != null && !error.equals("")) modelMap.addAttribute("error", error);
        return "modify_seminar";
    }



    @RequestMapping(value = {"/edit"}, method = RequestMethod.POST)
    public String edit(@RequestParam("seminarId") Integer seminarId,
                       @RequestParam("location") String location,
                       @RequestParam("time") String time,
                       @RequestParam("subject") String subject,
                       @RequestParam("description") String description,
                       @RequestParam("duration") String duration,
                       @RequestParam("capacity") int capacity,
                       @RequestParam("holdDate") String holdDate,
                       @RequestParam("hostId") Integer hostId,
                       @RequestParam("category") String category,
                       @RequestParam(value = "organizerId", required = false) Integer organizerId,
                       HttpSession session) {
        String path;

        try {
            if(session.getAttribute("admin") != null) {
                path = "/admin/";
                seminarService.updateSeminar(seminarId, location, time, subject, description, duration, capacity,
                        holdDate, hostId, category, organizerId);
            }
            else {
                path = "/organizer/";
                seminarService.updateSeminar(seminarId, location, time, subject, description, duration, capacity,
                        holdDate, hostId, category, -1);
            }
        } catch (HostUnavailableException e) {
            return "redirect:/seminar/edit?seminarId="+seminarId+"&error="+e.getMessage();
        }


        return "redirect:" + path;
    }

}
