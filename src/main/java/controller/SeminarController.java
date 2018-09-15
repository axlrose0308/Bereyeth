package controller;

import exception.RegisteredException;
import model.Attendee;
import model.Seminar;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import service.AttendeeService;
import service.SeminarService;

import javax.servlet.http.HttpSession;
import java.util.List;

@Controller
@RequestMapping(value = "/seminar")
public class SeminarController {

    @Autowired
    SeminarService seminarService;

    @Autowired
    AttendeeService attendeeService;

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
    public String viewAttendees(@RequestParam("id") Integer id,
                                @RequestParam(required = false, name="seminarId") Integer seminarId,ModelMap modelMap
                                ) {
        if(seminarId != null) modelMap.addAttribute("seminarId", seminarId);
        modelMap.addAttribute("attendee_editted", attendeeService.get(id));

        return "modify_attendee";
    }

    @RequestMapping(value = "/attendees/edit", method = RequestMethod.POST)
    public String viewAttendees(@RequestParam("id") Integer id, @RequestParam("name")String nameTag,
    @RequestParam(required = false, name = "seminarId")Integer seminarId) {
        attendeeService.modify(id, nameTag);
        if(seminarId != null) return "redirect:/seminar/attendees?seminarId="+seminarId;
        return "redirect:/admin";
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
            modelMap.addAttribute("seminar", seminar);
            return "cancel_registration";
        }
    }

}
