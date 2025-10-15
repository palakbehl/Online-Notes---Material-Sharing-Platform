package com.notesystem.service;

import com.notesystem.dao.ClipboardDAO;
import com.notesystem.model.Clipboard;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.transaction.annotation.Transactional;

import java.util.List;
import java.util.UUID;

@Transactional
public class ClipboardServiceImpl implements ClipboardService {
    
    private ClipboardDAO clipboardDAO;
    
    public void setClipboardDAO(ClipboardDAO clipboardDAO) {
        this.clipboardDAO = clipboardDAO;
    }
    
    @Override
    public boolean createClipboardEntry(Clipboard clipboard) {
        try {
            // Generate unique code if not already set
            if (clipboard.getUniqueCode() == null || clipboard.getUniqueCode().isEmpty()) {
                clipboard.setUniqueCode(generateUniqueCode());
            }
            
            // Set status to active if not set
            if (clipboard.getStatus() == null || clipboard.getStatus().isEmpty()) {
                clipboard.setStatus("active");
            }
            
            clipboardDAO.save(clipboard);
            return true;
        } catch (Exception e) {
            e.printStackTrace();
            return false;
        }
    }
    
    @Override
    public Clipboard getClipboardByCode(String uniqueCode) {
        return clipboardDAO.findByUniqueCode(uniqueCode);
    }
    
    @Override
    public Clipboard getClipboardById(Long id) {
        return clipboardDAO.findById(id);
    }
    
    @Override
    public List<Clipboard> getClipboardsByUser(Long userId) {
        return clipboardDAO.findByUserId(userId);
    }
    
    @Override
    public List<Clipboard> getAllClipboards() {
        return clipboardDAO.findAll();
    }
    
    @Override
    public List<Clipboard> getActiveClipboards() {
        return clipboardDAO.findByStatus("active");
    }
    
    @Override
    public boolean updateClipboard(Clipboard clipboard) {
        try {
            clipboardDAO.update(clipboard);
            return true;
        } catch (Exception e) {
            e.printStackTrace();
            return false;
        }
    }
    
    @Override
    public boolean deleteClipboard(Long id) {
        try {
            clipboardDAO.delete(id);
            return true;
        } catch (Exception e) {
            e.printStackTrace();
            return false;
        }
    }
    
    @Override
    public String generateUniqueCode() {
        // Generate a unique code using UUID and take first 8 characters
        return UUID.randomUUID().toString().substring(0, 8).toUpperCase();
    }
}