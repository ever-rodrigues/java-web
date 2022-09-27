package br.utfpr.crudcitys.vision;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;

@Controller
public class CityController {

    @GetMapping("/")
    public String listAll(){
        return "crud.html";
    }
}
