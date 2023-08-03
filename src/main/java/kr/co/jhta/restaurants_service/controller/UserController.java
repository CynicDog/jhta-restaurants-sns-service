package kr.co.jhta.restaurants_service.controller;

import kr.co.jhta.restaurants_service.controller.command.UserCommand;
import org.jboss.logging.Logger;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import javax.validation.ConstraintViolation;
import javax.validation.Valid;
import javax.validation.Validation;
import javax.validation.Validator;
import java.util.Set;

@Controller
@RequestMapping("/user")
public class UserController {

    Logger logger = Logger.getLogger(UserController.class);

    @GetMapping("/signup")
    public String signupForm(Model model) {
        model.addAttribute("userCommand", new UserCommand());
        return "user/signup-form";
    }

    @PostMapping("/signup")
    public String signup(@Valid UserCommand userCommand,
                         BindingResult bindingResult,
                         Model model) {

        if (bindingResult.hasErrors()) {

            model.addAttribute("userCommand", userCommand);
            return "user/signup-form"; // Return to the form page with error messages
        }

        // do signup operation..

        return "redirect:/user/login"; // Redirect to another page after successful signup
    }

    @GetMapping("/login")
    public String loginForm() {
        return "user/login";
    }


}
