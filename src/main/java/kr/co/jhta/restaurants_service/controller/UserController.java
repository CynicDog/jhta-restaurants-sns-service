package kr.co.jhta.restaurants_service.controller;

import kr.co.jhta.restaurants_service.controller.command.UserCommand;
import kr.co.jhta.restaurants_service.service.OtpService;
import kr.co.jhta.restaurants_service.service.UserService;
import kr.co.jhta.restaurants_service.util.EmailSender;
import kr.co.jhta.restaurants_service.vo.Otp;
import org.jboss.logging.Logger;
import org.springframework.http.MediaType;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import javax.validation.Valid;

@Controller
@RequestMapping("/user")
public class UserController {

    Logger logger = Logger.getLogger(UserController.class);

    private final EmailSender emailSender;
    private final UserService userService;
    private final OtpService otpService;

    public UserController(EmailSender emailSender, UserService userService, OtpService otpService) {
        this.emailSender = emailSender;
        this.userService = userService;
        this.otpService = otpService;
    }

    @GetMapping("/signup")
    public String signupForm(Model model) {
        model.addAttribute("userCommand", new UserCommand());
        return "user/signup-form";
    }

    @ResponseBody
    @PostMapping(value = "/signup", consumes = "application/json")
    public ResponseEntity signup(@RequestBody UserCommand userCommand) {

        // database constraint validation

        return null;
    }

    @GetMapping("/otp")
    public ResponseEntity otp(@RequestParam("email") String email) {

        Otp otp = otpService.issueOtp(email);

        return ResponseEntity.ok().body("Otp got successfully issued");
    }

    @GetMapping("/login")
    public String loginForm() {
        return "user/login";
    }
}
