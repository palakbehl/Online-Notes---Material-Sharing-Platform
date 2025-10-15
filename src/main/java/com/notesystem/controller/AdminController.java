package com.notesystem.controller;

import com.notesystem.model.Note;
import com.notesystem.model.User;
import com.notesystem.service.NoteService;
import com.notesystem.service.UserService;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;

import javax.servlet.http.HttpSession;
import java.util.List;

@Controller
@RequestMapping("/admin")
public class AdminController {
    
    private UserService userService;
    private NoteService noteService;
    
    public void setUserService(UserService userService) {
        this.userService = userService;
    }
    
    public void setNoteService(NoteService noteService) {
        this.noteService = noteService;
    }
    
    // Admin dashboard
    @GetMapping("/dashboard")
    public String adminDashboard(HttpSession session, Model model) {
        User loggedInUser = (User) session.getAttribute("loggedInUser");
        if (loggedInUser == null || !"admin".equals(loggedInUser.getRole())) {
            return "redirect:/user/login";
        }
        
        List<Note> pendingNotes = noteService.getPendingNotes();
        List<User> allUsers = userService.getAllUsers();
        
        model.addAttribute("pendingNotes", pendingNotes);
        model.addAttribute("users", allUsers);
        model.addAttribute("user", loggedInUser);
        return "admin/adminDashboard";
    }
    
    // Approve note
    @PostMapping("/approveNote/{id}")
    public String approveNote(@PathVariable("id") Long id, HttpSession session) {
        User loggedInUser = (User) session.getAttribute("loggedInUser");
        if (loggedInUser == null || !"admin".equals(loggedInUser.getRole())) {
            return "redirect:/user/login";
        }
        
        noteService.approveNote(id);
        return "redirect:/admin/dashboard";
    }
    
    // Reject note
    @PostMapping("/rejectNote/{id}")
    public String rejectNote(@PathVariable("id") Long id, HttpSession session) {
        User loggedInUser = (User) session.getAttribute("loggedInUser");
        if (loggedInUser == null || !"admin".equals(loggedInUser.getRole())) {
            return "redirect:/user/login";
        }
        
        noteService.rejectNote(id);
        return "redirect:/admin/dashboard";
    }
    
    // Delete note
    @PostMapping("/deleteNote/{id}")
    public String deleteNote(@PathVariable("id") Long id, HttpSession session) {
        User loggedInUser = (User) session.getAttribute("loggedInUser");
        if (loggedInUser == null || !"admin".equals(loggedInUser.getRole())) {
            return "redirect:/user/login";
        }
        
        noteService.deleteNote(id);
        return "redirect:/admin/dashboard";
    }
    
    // Activate user
    @PostMapping("/activateUser/{id}")
    public String activateUser(@PathVariable("id") Long id, HttpSession session) {
        User loggedInUser = (User) session.getAttribute("loggedInUser");
        if (loggedInUser == null || !"admin".equals(loggedInUser.getRole())) {
            return "redirect:/user/login";
        }
        
        userService.activateUser(id);
        return "redirect:/admin/dashboard";
    }
    
    // Deactivate user
    @PostMapping("/deactivateUser/{id}")
    public String deactivateUser(@PathVariable("id") Long id, HttpSession session) {
        User loggedInUser = (User) session.getAttribute("loggedInUser");
        if (loggedInUser == null || !"admin".equals(loggedInUser.getRole())) {
            return "redirect:/user/login";
        }
        
        userService.deactivateUser(id);
        return "redirect:/admin/dashboard";
    }
    
    // Delete user
    @PostMapping("/deleteUser/{id}")
    public String deleteUser(@PathVariable("id") Long id, HttpSession session) {
        User loggedInUser = (User) session.getAttribute("loggedInUser");
        if (loggedInUser == null || !"admin".equals(loggedInUser.getRole())) {
            return "redirect:/user/login";
        }
        
        // Prevent admin from deleting themselves
        if (loggedInUser.getId().equals(id)) {
            return "redirect:/admin/dashboard";
        }
        
        userService.deleteUser(id);
        return "redirect:/admin/dashboard";
    }
}