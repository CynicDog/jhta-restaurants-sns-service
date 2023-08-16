package kr.co.jhta.restaurants_service.controller.users;

import kr.co.jhta.restaurants_service.controller.command.OtpCommand;
import kr.co.jhta.restaurants_service.controller.command.UserCommand;
import kr.co.jhta.restaurants_service.security.domain.SecurityUser;
import kr.co.jhta.restaurants_service.service.OtpService;
import kr.co.jhta.restaurants_service.security.service.UserService;
import kr.co.jhta.restaurants_service.vo.user.Otp;
import org.jboss.logging.Logger;
import org.springframework.http.ResponseEntity;
import org.springframework.security.core.annotation.AuthenticationPrincipal;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;

import javax.servlet.http.HttpSession;

@Controller
@RequestMapping("/customer")
@SessionAttributes("userCommand")
public class CustomerController {

    Logger logger = Logger.getLogger(UserController.class);
    private final UserService userService;
    private final OtpService otpService;

    public CustomerController(UserService userService, OtpService otpService) {
        this.userService = userService;
        this.otpService = otpService;
    }

    @ResponseBody
    @PostMapping(value = "/otp-check", consumes = "application/json")
    public ResponseEntity otpCheck(@RequestBody OtpCommand otpCommand, HttpSession session) {

        UserCommand userCommand = (UserCommand) session.getAttribute("userCommand");

        boolean isValid = otpService.validateOtp(otpCommand);

        if (isValid) {
            userService.insertCustomer(userCommand);
            session.setAttribute("userCommand", null);

            return ResponseEntity.ok("Valid otp!");
        } else {
            return ResponseEntity.badRequest().body("Invalid otp!");
        }
    }

    @ResponseBody
    @GetMapping("/otp")
    public ResponseEntity otpIssue(@RequestParam("email") String email) {

        Otp otp = otpService.issueOtp(email);

        return ResponseEntity.ok().body("Otp got successfully issued");
    }

    @ResponseBody
    @PostMapping(value = "/signup", consumes = "application/json")
    public ResponseEntity signup(@RequestBody UserCommand userCommand, HttpSession session) {

        session.setAttribute("userCommand", userCommand);

        // Perform database constraint validation and other operations
        return null;
    }

    @GetMapping("/signup")
    public String signupForm() {
        return "user/customer/signup-form";
    }

    @GetMapping("/details")
    public String myPage(@AuthenticationPrincipal SecurityUser securityUser, Model model) {


        model.addAttribute("customerEmail", securityUser.getUser().getEmail());


        return "/user/customer/details";
    }
}
