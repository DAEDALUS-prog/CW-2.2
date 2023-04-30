package by.timmy.calories.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import by.timmy.calories.models.Person;
import by.timmy.calories.repository.PersonRepository;
import by.timmy.calories.service.RandomFoodJokeAPI;

@Controller
public class HomeController extends RandomFoodJokeAPI {

    private boolean statusPersonSignIn = false;
    //по факту false, проверка вошел ли пользователь в аккаунт;
    
    @RequestMapping(value = "/greeting")
    public String homeController(@RequestParam(name = "name", required = false, defaultValue = "World") String name, Model model) {
       model.addAttribute("name", name);
       return "greeting";
    }

    @Autowired
    private PersonRepository personRepository;

    @GetMapping("/")
    public String indexController(Model model) {
        // RandomFoodJokeAPI foodJokeAPI = new RandomFoodJokeAPI();
        // String joke = foodJokeAPI.getJoke();
        String joke = null;
        model.addAttribute("joke", joke);

        Iterable<Person> persons = personRepository.findAll();
        model.addAttribute("persons", persons);
        return "index";
    }

    @GetMapping("/about-us")
    public String aboutUsController() {
        return "about-us";
    }

    @GetMapping("/settings")
    public String settingsController() {
        if (!statusPersonSignIn) {
            return "settings-standart";
        } 
        return "settings";
    }

    @GetMapping("/profile")
    public String profileController(Model model) {
        if (!statusPersonSignIn) {
            return "redirect:/sign";
        }
        return "profile";
    }
}
