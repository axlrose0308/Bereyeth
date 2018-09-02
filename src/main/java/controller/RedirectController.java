package controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

@Controller
@RequestMapping(value = "/redirect")
public class RedirectController {

    @RequestMapping(value = "/", method = RequestMethod.GET)
    public String index() {
        return "index";
    }

    @RequestMapping(value = "/admin", method = RequestMethod.GET)
    public String admin() {
        return "admin_login";
    }

    @RequestMapping(value = "/host", method = RequestMethod.GET)
    public String host() {
        return "host_login";
    }

    @RequestMapping(value = "/organizer", method = RequestMethod.GET)
    public String orgnizer() {
        return "organizer_login";
    }
}
