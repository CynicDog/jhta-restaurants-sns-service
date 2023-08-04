package kr.co.jhta.restaurants_service.controller.users;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.*;


@Controller
@RequestMapping("/user")
public class UserController {

    @GetMapping("/login")
    public String loginForm() {
        return "user/login";
    }
}
