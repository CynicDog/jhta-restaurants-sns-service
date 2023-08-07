package kr.co.jhta.restaurants_service.controller.users;

import kr.co.jhta.restaurants_service.controller.command.OtpCommand;
import kr.co.jhta.restaurants_service.controller.command.UserCommand;
import kr.co.jhta.restaurants_service.service.OtpService;
import kr.co.jhta.restaurants_service.security.service.CustomerService;
import kr.co.jhta.restaurants_service.util.EmailSender;
import kr.co.jhta.restaurants_service.vo.Otp;
import org.jboss.logging.Logger;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.*;

import javax.servlet.http.HttpSession;

@Controller
@RequestMapping("/customer")
@SessionAttributes("userCommand")
public class CustomerController {

    Logger logger = Logger.getLogger(UserController.class);

    private final EmailSender emailSender;
    private final CustomerService customerService;
    private final OtpService otpService;

    public CustomerController(EmailSender emailSender, CustomerService customerService, OtpService otpService) {
        this.emailSender = emailSender;
        this.customerService = customerService;
        this.otpService = otpService;
    }

    @ResponseBody
    @PostMapping(value = "/otp-check", consumes = "application/json")
    public ResponseEntity otpCheck(@RequestBody OtpCommand otpCommand, HttpSession session) {

        UserCommand userCommand = (UserCommand) session.getAttribute("userCommand");

        boolean isValid = otpService.validateOtp(otpCommand);

        if (isValid) {
            customerService.insertCustomer(userCommand);

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
    public ResponseEntity signup(@RequestBody UserCommand userCommand, HttpSession session) {

        session.setAttribute("userCommand", userCommand);

        // Perform database constraint validation and other operations
        return null;
    }

    @GetMapping("/signup")
    public String signupForm() {
        return "user/customer/signup-form";
    }
}
