package com.example.developer.controllers;

import com.example.developer.dto.ClientDTO;
import com.example.developer.models.Client;
import com.example.developer.services.ClientService;
import jakarta.validation.Valid;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.servlet.ModelAndView;

import java.util.List;

@Controller
public class AuthController {
    private final ClientService clientService;

    @Autowired
    public AuthController(ClientService clientService) {
        this.clientService = clientService;
    }

    @GetMapping("/register")
    public String showRegistrationForm(Model model) {
        ClientDTO clientDTO = new ClientDTO();
        model.addAttribute("user", clientDTO);
        return "register";
    }
    @GetMapping("/login")
    public String login() {
        return "login-page";
    }
    @PostMapping("/register/save")
    public String registerSave(@Valid @ModelAttribute("user") ClientDTO clientDTO, BindingResult bindingResult, Model model) {
        Client existingClient = clientService.findByEmail(clientDTO.getEmail());
        if (existingClient != null && existingClient.getEmail() != null && !existingClient.getEmail().isEmpty())  {
            bindingResult.rejectValue("email", null, "Пользователь с такой почтой уже зарегистрирован");

        }
        if (bindingResult.hasErrors()) {
            model.addAttribute("user", clientDTO);
            return "register";
        }
        clientService.saveClient(clientDTO);
        return "redirect:/index.html#complexes";
    }
    @GetMapping("/index")
    public String index() {
        return "redirect:/index.html#apartments";
    }
}
