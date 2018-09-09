package controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import service.SeminarService;

@Controller
@RequestMapping(value = "/seminar")
public class SeminarController {

    @Autowired
    SeminarService seminarService;

    @RequestMapping(value = "details", method = RequestMethod.GET)
    public String details() {
        return "";
    }
}
