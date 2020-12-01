package com.tamdongtam.springbatchhelloworld;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;


@Controller
public class HomeController {

    @GetMapping(value = "/helloworld")
    public String helloWorld(){
        return "helloworld";
    }
}
