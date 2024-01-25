package com.joel_lah.examen_002.controllers;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.validation.ObjectError;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.joel_lah.examen_002.models.Mesa;
import com.joel_lah.examen_002.models.User;
import com.joel_lah.examen_002.services.MesaServicio;
import com.joel_lah.examen_002.services.UserServicio;

import jakarta.servlet.http.HttpSession;
import jakarta.validation.Valid;

@Controller
public class UserController {

  @Autowired
  private UserServicio userService;
  @Autowired
  private MesaServicio mesaServicio;

  @GetMapping("/")
  public String panel() {
    return "home";
  }

  @GetMapping("/home")
  public String home(Model model, HttpSession session) {
    if (session.getAttribute("user_id") == null) {
      return "redirect:/login"; // Redirige a la página de inicio de sesión
    }

    Long userId = (Long) session.getAttribute("user_id");
    User currentUser = userService.findUserById(userId);
    List<Mesa> mesas = mesaServicio.findByUser(currentUser);
    model.addAttribute("user", currentUser);
    model.addAttribute("mesas", mesas);
    return "index";
  }

  // Para hacer uso de sesion
  // @Secured("IS_ANONYMOUS")
  @GetMapping("/login")
  public String login() {
    return "login";
  }

  @PostMapping("/login")
  public String loginUser(
      @RequestParam("email") String email,
      @RequestParam("password") String password,
      Model model,
      HttpSession session) {
    if (!userService.authenticateUser(email, password)) {
      model.addAttribute("error", "Credenciales inválidas");
      return "login";
    }
    User authUser = userService.findByEmail(email);
    session.setAttribute("user_id", authUser.getId());
    return "redirect:/home";
  }

  // Para registros
  // @Secured("IS_ANONYMOUS")
  @GetMapping("/register")
  public String Register(@ModelAttribute("user") User user) {
    return "register";
  }

  @PostMapping("/register")
  public String createUser(
      @Valid @ModelAttribute("user") User user,
      BindingResult result,
      HttpSession session) {
    User unique = userService.findByEmail(user.getEmail());
    if (unique != null) {
      ObjectError error = new ObjectError("email", "Email ya se encuentra en uso");
      result.addError(error);
    }
    if (!user.getPassword().contentEquals(user.getPasswordConfirmation())) {
      ObjectError error = new ObjectError("passwordConfirmation", "Las contraseñas no coinciden");
      result.addError(error);
    }
    if (result.hasErrors()) {
      return "register";
    }
    User newUser = userService.registerUser(user);
    session.setAttribute("user_id", newUser.getId());
    return "redirect:/home";
  }

  // Para hacer cerrar sesion
  @GetMapping("/logout")
  public String logout(HttpSession session) {
    session.removeAttribute("user_id");
    return "redirect:/login";
  }
}