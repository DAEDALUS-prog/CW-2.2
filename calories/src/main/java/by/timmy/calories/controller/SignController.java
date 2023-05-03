package by.timmy.calories.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import by.timmy.calories.models.Person;
import by.timmy.calories.repository.PersonRepository;
import by.timmy.calories.service.PersonService;

@Controller
public class SignController {

    @Autowired
    PersonRepository personRepository;

    @Autowired
    PersonService personService;

    @GetMapping("/sign")
    public String signController() {
        return "sign";
    }

    @PostMapping("/sign-up")
    public String signUpPost(@ModelAttribute("person") Person person, Model model) {
        personRepository.save(person);
        showModalPositive(model);
        return "redirect:/";
    }

    @PostMapping("/sign-in") 
    public String signInPost(@RequestParam("email") String email, 
                             @RequestParam("password") String password,
                              Model model) {
        boolean loginSuccessful = personService.checkEmail(email, password);
        if (loginSuccessful) {
            return "redirect:/";
        } 

        return "redirect:/sign";
    }

    @GetMapping("/check-email")
    @ResponseBody
    public boolean checkEmail(@RequestParam("email") String email) {
        Person person = personRepository.findByEmail(email);
        return person != null;
    }

    @GetMapping("/positive")
    public String showModalPositive(Model model) {
        return "blocks/positive_message"; 
    }

    @GetMapping("/negativ")
    public String showModalNegativ(Model model) {
        return "modalPage"; 
    }


    
}
