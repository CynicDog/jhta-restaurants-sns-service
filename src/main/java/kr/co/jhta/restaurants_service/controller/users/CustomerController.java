package kr.co.jhta.restaurants_service.controller.users;

import kr.co.jhta.restaurants_service.controller.command.OtpCommand;
import kr.co.jhta.restaurants_service.controller.command.UserCommand;
import kr.co.jhta.restaurants_service.controller.users.UserController;
import kr.co.jhta.restaurants_service.service.OtpService;
import kr.co.jhta.restaurants_service.service.UserService;
import kr.co.jhta.restaurants_service.util.EmailSender;
import kr.co.jhta.restaurants_service.vo.Otp;
import org.jboss.logging.Logger;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;

@Controller
@RequestMapping("/customer")
public class CustomerController {

    Logger logger = Logger.getLogger(UserController.class);

    private final EmailSender emailSender;
    private final UserService userService;
    private final OtpService otpService;

    public CustomerController(EmailSender emailSender, UserService userService, OtpService otpService) {
        this.emailSender = emailSender;
        this.userService = userService;
        this.otpService = otpService;
    }

    @ResponseBody
    @PostMapping(value = "/otp-check", consumes = "application/json")
    public ResponseEntity otpCheck(
            @RequestBody OtpCommand otpCommand,
            @RequestBody UserCommand userCommand) {

        boolean isValid = otpService.validateOtp(otpCommand);

        if (isValid) {
            userService.insertUser(userCommand);
            return ResponseEntity.ok("Valid otp!");
        } else {
            return ResponseEntity.badRequest().body("Invalid otp!");
        }
    }

    @GetMapping("/otp")
    public ResponseEntity otpIssue(@RequestParam("email") String email) {

        Otp otp = otpService.issueOtp(email);

        return ResponseEntity.ok().body("Otp got successfully issued");
    }

    @ResponseBody
    @PostMapping(value = "/signup", consumes = "application/json")
    public ResponseEntity signup(@RequestBody UserCommand userCommand) {

        // database constraint validation
        return null;
    }

    @GetMapping("/signup")
    public String signupForm(Model model) {
        model.addAttribute("userCommand", new UserCommand());
        return "user/customer/signup-form";
    }
}
