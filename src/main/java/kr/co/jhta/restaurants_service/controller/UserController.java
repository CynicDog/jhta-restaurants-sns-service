package kr.co.jhta.restaurants_service.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

@Controller
@RequestMapping("/user")
public class UserController {

    @PostMapping("/register")
    public String add(@RequestParam("email") String email,
                      @RequestParam("password") String password
//    other properties of user information
    ) {

        return "redirect:/user/login";
    }

    @GetMapping("/login")
    public String loginForm() {
        return "user/login";
    }


}
