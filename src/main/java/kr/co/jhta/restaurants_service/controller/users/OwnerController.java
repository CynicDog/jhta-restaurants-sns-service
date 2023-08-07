package kr.co.jhta.restaurants_service.controller.users;

import kr.co.jhta.restaurants_service.controller.command.UserCommand;
import kr.co.jhta.restaurants_service.service.OtpService;
import kr.co.jhta.restaurants_service.security.service.CustomerService;
import kr.co.jhta.restaurants_service.util.EmailSender;
import org.jboss.logging.Logger;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;

@Controller
@RequestMapping("/owner")
public class OwnerController {

    Logger logger = Logger.getLogger(UserController.class);

    private final EmailSender emailSender;
    private final CustomerService customerService;
    private final OtpService otpService;

    public OwnerController(EmailSender emailSender, CustomerService customerService, OtpService otpService) {
        this.emailSender = emailSender;
        this.customerService = customerService;
        this.otpService = otpService;
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
        return "user/owner/signup-form";
    }
}
