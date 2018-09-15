package controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import service.SeminarService;

import static model.Seminar.CATEGORIES;

@Controller
public class IndexController {

    @Autowired
    SeminarService seminarService;

    @RequestMapping(value = "/", method = RequestMethod.GET)
    public String index(ModelMap modelMap, @RequestParam(required = false, name = "category") String category,
                        @RequestParam(required = false, name = "error") String error) {
        modelMap.addAttribute("categories", CATEGORIES);
        if(category == null || category.equals("All")) modelMap.addAttribute("seminars", seminarService.getAvailables());
        else {
            modelMap.addAttribute("seminars", seminarService.getAvailablesByCategory(category));
            modelMap.addAttribute("selected", category);
        }
        if(error != null) modelMap.addAttribute("error", error);
        return "index";
    }

}
