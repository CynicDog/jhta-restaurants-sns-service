package kr.co.jhta.restaurants_service.controller;

import kr.co.jhta.restaurants_service.controller.command.UserCommand;
import kr.co.jhta.restaurants_service.service.UserService;
import kr.co.jhta.restaurants_service.util.EmailSender;
import org.jboss.logging.Logger;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import javax.validation.Valid;

@Controller
@RequestMapping("/user")
public class UserController {

    Logger logger = Logger.getLogger(UserController.class);

    private final EmailSender emailSender;
    private final UserService userService;

    public UserController(EmailSender emailSender, UserService userService) {
        this.emailSender = emailSender;
        this.userService = userService;
    }

    @GetMapping("/signup")
    public String signupForm(Model model) {
        model.addAttribute("userCommand", new UserCommand());
        return "user/signup-form";
    }

    @PostMapping("/signup")
    public String signup(@Valid UserCommand userCommand,
                         BindingResult bindingResult,
                         RedirectAttributes redirectAttributes,
                         Model model) {

        if (bindingResult.hasErrors()) {

            model.addAttribute("userCommand", userCommand);
            return "user/signup-form"; // Return to the form page with error messages
        }

        // TODO: AJAX communication for the validation on the command properties && OTP validation

        return "redirect:/user/login"; // Redirect to the OTP validation page
    }



    @GetMapping("/login")
    public String loginForm() {
        return "user/login";
    }
}
