package br.utfpr.crudcitys.vision;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.*;
import java.util.HashSet;
import java.util.Set;

@Controller
public class CityController {
    private Set<City> citys;

    public CityController() {
        citys = new HashSet<>();
    }

    @GetMapping("/")
    public String listAll(org.springframework.ui.Model memoria){
        memoria.addAttribute("listCitys",citys);
        return "/crud";
    }
    @PostMapping("/create")
    public String create(City city){
        citys.add(city);
        return "redirect:/";
    }

    @GetMapping("/delete")
    public String delete(@RequestParam String name,
                         @RequestParam String state){
        citys.removeIf(actualCity->actualCity.getName().equals(name) &&
                        actualCity.getState().equals(state));
        return "redirect:/";
    }

    @GetMapping("/prepareToedit")
    public String edit(@RequestParam String name,
                       @RequestParam String state,
                       org.springframework.ui.Model memoria){
        var actualCity= citys
                .stream()
                .filter(city -> city.getName().equals(name)
                && city.getState().equals(state))
                .findAny();

        if(actualCity.isPresent()){
            memoria.addAttribute("actualCity", actualCity.get());
            memoria.addAttribute("listCitys",citys);
        }
            return "/crud";
        }



    @PostMapping("/edit")
    public String alterar(
            @RequestParam String actualName,
            @RequestParam String actualState,
            City city) {

        citys.removeIf(actualCity ->
                actualCity.getName().equals(actualName) &&
                        actualCity.getState().equals(actualState));

        create(city);

        return "redirect:/";
    }
    }
