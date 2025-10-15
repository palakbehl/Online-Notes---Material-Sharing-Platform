package com.notesystem.controller;

import com.notesystem.model.Clipboard;
import com.notesystem.model.User;
import com.notesystem.service.ClipboardService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;

import javax.servlet.http.HttpSession;
import java.util.Date;
import java.util.List;

@Controller
@RequestMapping("/clipboard")
public class ClipboardController {
    
    private ClipboardService clipboardService;
    
    @Autowired
    public void setClipboardService(ClipboardService clipboardService) {
        this.clipboardService = clipboardService;
    }
    
    // Show clipboard dashboard
    @GetMapping("/dashboard")
    public String clipboardDashboard(HttpSession session, Model model) {
        User loggedInUser = (User) session.getAttribute("loggedInUser");
        if (loggedInUser == null) {
            return "redirect:/user/login";
        }
        
        List<Clipboard> userClipboards = clipboardService.getClipboardsByUser(loggedInUser.getId());
        model.addAttribute("clipboards", userClipboards);
        model.addAttribute("clipboard", new Clipboard()); // Add empty clipboard object for form binding
        model.addAttribute("user", loggedInUser);
        return "user/clipboardDashboard";
    }
    
    // Create new clipboard entry
    @PostMapping("/create")
    public String createClipboardEntry(@ModelAttribute("clipboard") Clipboard clipboard,
                                      HttpSession session,
                                      Model model) {
        User loggedInUser = (User) session.getAttribute("loggedInUser");
        if (loggedInUser == null) {
            return "redirect:/user/login";
        }
        
        clipboard.setCreatedBy(loggedInUser);
        clipboard.setCreatedDate(new Date());
        
        if (clipboardService.createClipboardEntry(clipboard)) {
            model.addAttribute("success", "Clipboard entry created successfully! Unique code: " + clipboard.getUniqueCode());
        } else {
            model.addAttribute("error", "Failed to create clipboard entry!");
        }
        
        // Refresh the list of clipboards
        List<Clipboard> userClipboards = clipboardService.getClipboardsByUser(loggedInUser.getId());
        model.addAttribute("clipboards", userClipboards);
        model.addAttribute("clipboard", new Clipboard()); // Add new empty clipboard for next form submission
        model.addAttribute("user", loggedInUser);
        return "user/clipboardDashboard";
    }
    
    // View clipboard entry by code
    @GetMapping("/view/{code}")
    public String viewClipboardEntry(@PathVariable("code") String code, 
                                    HttpSession session,
                                    Model model) {
        // User doesn't need to be logged in to view clipboard entries
        Clipboard clipboard = clipboardService.getClipboardByCode(code);
        if (clipboard == null || !"active".equals(clipboard.getStatus())) {
            model.addAttribute("error", "Clipboard entry not found or inactive!");
            return "user/clipboardView";
        }
        
        model.addAttribute("clipboard", clipboard);
        return "user/clipboardView";
    }
    
    // Delete clipboard entry
    @PostMapping("/delete/{id}")
    public String deleteClipboardEntry(@PathVariable("id") Long id,
                                      HttpSession session,
                                      Model model) {
        User loggedInUser = (User) session.getAttribute("loggedInUser");
        if (loggedInUser == null) {
            return "redirect:/user/login";
        }
        
        // Get clipboard by ID
        Clipboard clipboard = clipboardService.getClipboardById(id);
        // Check if clipboard exists and belongs to the logged in user
        if (clipboard != null && clipboard.getCreatedBy() != null && 
            clipboard.getCreatedBy().getId().equals(loggedInUser.getId())) {
            clipboardService.deleteClipboard(id);
            model.addAttribute("success", "Clipboard entry deleted successfully!");
        }
        
        // Refresh the list of clipboards
        List<Clipboard> userClipboards = clipboardService.getClipboardsByUser(loggedInUser.getId());
        model.addAttribute("clipboards", userClipboards);
        model.addAttribute("clipboard", new Clipboard()); // Add new empty clipboard for next form submission
        model.addAttribute("user", loggedInUser);
        return "user/clipboardDashboard";
    }
}