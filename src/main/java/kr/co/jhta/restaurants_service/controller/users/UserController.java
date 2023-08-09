package kr.co.jhta.restaurants_service.controller.users;

import kr.co.jhta.restaurants_service.security.service.UserService;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.*;


@Controller
@RequestMapping("/user")
public class UserController {

    private final UserService userService;

    public UserController(UserService userService) {
        this.userService = userService;
    }

    @ResponseBody
    @GetMapping("/check-username")
    public ResponseEntity isUsernameUnique(@RequestParam("username") String username) {

        if (userService.existsDuplicateUsersByUsername(username)) {
            return ResponseEntity.badRequest().body("User already exists with the given username.");
        } else {
            return ResponseEntity.ok().body("Unique email!");
        }
    }

    @ResponseBody
    @GetMapping("/check-email")
    public ResponseEntity isEmailUnique(@RequestParam("email") String email) {

        if (userService.existsDuplicateUsersByEmail(email)) {
            return ResponseEntity.badRequest().body("User already exists with the given email.");
        } else {
            return ResponseEntity.ok().body("Unique email!");
        }
    }

    @ResponseBody
    @GetMapping("/check-phone")
    public ResponseEntity isPhoneUnique(@RequestParam("phone") String phone) {

        if (userService.existsDuplicateUsersByPhone(phone)) {
            return ResponseEntity.badRequest().body("User already exists with the given email.");
        } else {
            return ResponseEntity.ok().body("Unique email!");
        }
    }

    @GetMapping("/login")
    public String loginForm() {
        return "user/login";
    }
}
