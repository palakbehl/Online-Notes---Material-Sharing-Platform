package com.notesystem.controller;

import com.notesystem.model.Note;
import com.notesystem.model.User;
import com.notesystem.service.NoteService;
import com.notesystem.service.UserService;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.multipart.MultipartFile;

import javax.servlet.http.HttpSession;
import java.io.File;
import java.io.IOException;
import java.nio.file.Files;
import java.nio.file.Path;
import java.nio.file.Paths;
import java.util.Date;
import java.util.List;

@Controller
@RequestMapping("/user")
public class UserController {
    
    private UserService userService;
    private NoteService noteService;
    
    public void setUserService(UserService userService) {
        this.userService = userService;
    }
    
    public void setNoteService(NoteService noteService) {
        this.noteService = noteService;
    }
    
    // Show registration form
    @GetMapping("/register")
    public String showRegistrationForm(Model model) {
        model.addAttribute("user", new User());
        return "user/register";
    }
    
    // Process registration
    @PostMapping("/register")
    public String registerUser(@ModelAttribute("user") User user, Model model) {
        // Check if email already exists
        if (userService.findByEmail(user.getEmail()) != null) {
            model.addAttribute("error", "Email already registered!");
            return "user/register";
        }
        
        // Save user
        if (userService.registerUser(user)) {
            model.addAttribute("success", "Registration successful! Please login.");
            return "user/login";
        } else {
            model.addAttribute("error", "Registration failed!");
            return "user/register";
        }
    }
    
    // Show login form
    @GetMapping("/login")
    public String showLoginForm(Model model) {
        model.addAttribute("user", new User());
        return "user/login";
    }
    
    // Process login
    @PostMapping("/login")
    public String loginUser(@RequestParam("email") String email,
                            @RequestParam("password") String password,
                            HttpSession session,
                            Model model) {
        User user = userService.loginUser(email, password);
        if (user != null && "active".equals(user.getStatus())) {
            session.setAttribute("loggedInUser", user);
            if ("admin".equals(user.getRole())) {
                return "redirect:/admin/dashboard";
            } else {
                return "redirect:/user/dashboard";
            }
        } else {
            model.addAttribute("error", "Invalid credentials or account inactive!");
            return "user/login";
        }
    }
    
    // User dashboard
    @GetMapping("/dashboard")
    public String userDashboard(HttpSession session, Model model) {
        User loggedInUser = (User) session.getAttribute("loggedInUser");
        if (loggedInUser == null) {
            return "redirect:/user/login";
        }
        
        List<Note> approvedNotes = noteService.getApprovedNotes();
        model.addAttribute("notes", approvedNotes);
        model.addAttribute("user", loggedInUser);
        return "user/dashboard";
    }
    
    // Show upload form
    @GetMapping("/upload")
    public String showUploadForm(HttpSession session, Model model) {
        User loggedInUser = (User) session.getAttribute("loggedInUser");
        if (loggedInUser == null) {
            return "redirect:/user/login";
        }
        
        model.addAttribute("note", new Note());
        return "user/uploadNotes";
    }
    
    // Process note upload
    @PostMapping("/upload")
    public String uploadNote(@ModelAttribute("note") Note note,
                             @RequestParam("file") MultipartFile file,
                             HttpSession session,
                             Model model) {
        User loggedInUser = (User) session.getAttribute("loggedInUser");
        if (loggedInUser == null) {
            return "redirect:/user/login";
        }
        
        try {
            // Handle file upload
            if (!file.isEmpty()) {
                String uploadDir = "uploads/";
                File dir = new File(uploadDir);
                if (!dir.exists()) {
                    dir.mkdirs();
                }
                
                String fileName = System.currentTimeMillis() + "_" + file.getOriginalFilename();
                Path path = Paths.get(uploadDir + fileName);
                Files.write(path, file.getBytes());
                
                note.setFilePath(fileName);
            }
            
            note.setUploadedBy(loggedInUser);
            note.setUploadDate(new Date());
            
            if (noteService.uploadNote(note)) {
                model.addAttribute("success", "Note uploaded successfully! Waiting for approval.");
            } else {
                model.addAttribute("error", "Failed to upload note!");
            }
        } catch (IOException e) {
            e.printStackTrace();
            model.addAttribute("error", "File upload failed!");
        }
        
        return "user/uploadNotes";
    }
    
    // View notes
    @GetMapping("/view")
    public String viewNotes(HttpSession session, Model model) {
        User loggedInUser = (User) session.getAttribute("loggedInUser");
        if (loggedInUser == null) {
            return "redirect:/user/login";
        }
        
        List<Note> approvedNotes = noteService.getApprovedNotes();
        model.addAttribute("notes", approvedNotes);
        return "user/viewNotes";
    }
    
    // Download note
    @GetMapping("/download/{id}")
    public String downloadNote(@PathVariable("id") Long id, 
                               HttpSession session, 
                               Model model) {
        User loggedInUser = (User) session.getAttribute("loggedInUser");
        if (loggedInUser == null) {
            return "redirect:/user/login";
        }
        
        Note note = noteService.getNoteById(id);
        if (note != null && "approved".equals(note.getStatus())) {
            // In a real application, you would stream the file here
            model.addAttribute("note", note);
            return "user/download"; // This would be a download page or direct file streaming
        }
        
        return "redirect:/user/view";
    }
    
    // Logout
    @GetMapping("/logout")
    public String logout(HttpSession session) {
        session.invalidate();
        return "redirect:/user/login";
    }
}