package com.joel_lah.examen_002.controllers;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import com.joel_lah.examen_002.models.Mesa;
import com.joel_lah.examen_002.models.User;
import com.joel_lah.examen_002.services.MesaServicio;
import com.joel_lah.examen_002.services.UserServicio;

import jakarta.servlet.http.HttpSession;
import jakarta.validation.Valid;

@Controller
@RequestMapping("/mesas")
public class MesaController {

    @Autowired
    private MesaServicio mesaServicio;
    @Autowired
    private UserServicio userServicio;

    // Ver todas mesas creadas por todos lo usuarios
    @GetMapping("/")
    public String home(Model model,  HttpSession session) {
        if (session.getAttribute("user_id") == null) {
            return "redirect:/login"; // Redirige a la página de inicio de sesión
        }
        List<Mesa> mesas = mesaServicio.findAll();
        model.addAttribute("mesas", mesas);
        return "panel_mesas";
    }

    // crear mesa
    @GetMapping("/new")
    public String viewAddMesa(Model model, HttpSession session) {
        if (session.getAttribute("user_id") == null) {
            return "redirect:/login"; // Redirige a la página de inicio de sesión
        }
        model.addAttribute("mesa", new Mesa());
        return "add_mesa";
    }

    @PostMapping("/new")
    public String addMesa(@Valid @ModelAttribute("mesa") Mesa mesa, BindingResult result, HttpSession session) {
        if (result.hasErrors()) {
            return "add_mesa";
        }
        User creator = userServicio.findUserById((Long) session.getAttribute("user_id"));
        mesa.setUser(creator);
        mesaServicio.save(mesa);
        return "redirect:/home";
    }

    // Vista para editar una mesa existente
    @GetMapping("/{id}/edit")
    public String viewEditMesa(@PathVariable Long id, Model model  ,  HttpSession session) {
        if (session.getAttribute("user_id") == null) {
            return "redirect:/login"; // Redirige a la página de inicio de sesión
        }
        Mesa mesa = mesaServicio.findById(id);
        model.addAttribute("mesa", mesa);
        return "edit_mesa";
    }

    @PostMapping("/{id}/edit")
    public String editMesa(@PathVariable Long id, @Valid @ModelAttribute("mesa") Mesa updatedMesa, BindingResult result,
            HttpSession session) {
        if (result.hasErrors()) {
            return "edit_mesa";
        }
        Mesa mesaActualizada = mesaServicio.findById(id);
        mesaActualizada.setGuest_name(updatedMesa.getGuest_name());
        mesaActualizada.setNumber_guest(updatedMesa.getNumber_guest());
        mesaActualizada.setNote(updatedMesa.getNote());

        Long userId = (Long) session.getAttribute("user_id");
        User currentUser = userServicio.findUserById(userId);

        if (mesaActualizada.getUser().getId().equals(currentUser.getId())) {
            mesaServicio.update(mesaActualizada);
        }
        return "redirect:/home";
    }

    // Procesar la solicitud de eliminar una mesa
    @GetMapping("/{id}/delete")
    public String deleteSong(@PathVariable Long id,  HttpSession session) {
        if (session.getAttribute("user_id") == null) {
            return "redirect:/login"; // Redirige a la página de inicio de sesión
        }
        mesaServicio.delete(id);
        return "redirect:/home";
    }

}
