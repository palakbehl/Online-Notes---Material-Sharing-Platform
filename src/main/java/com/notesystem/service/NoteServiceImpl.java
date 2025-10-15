package com.notesystem.service;

import com.notesystem.dao.NoteDAO;
import com.notesystem.model.Note;
import org.springframework.transaction.annotation.Transactional;

import java.util.List;

@Transactional
public class NoteServiceImpl implements NoteService {
    
    private NoteDAO noteDAO;
    
    public void setNoteDAO(NoteDAO noteDAO) {
        this.noteDAO = noteDAO;
    }
    
    @Override
public boolean uploadNote(Note note) {
        try {
            note.setStatus("pending");
            noteDAO.save(note);
            return true;
        } catch (Exception e) {
            e.printStackTrace();
            return false;
        }
    }
    
    @Override
    public List<Note> getAllNotes() {
        return noteDAO.findAll();
    }
    
    @Override
    public List<Note> getApprovedNotes() {
        return noteDAO.findByStatus("approved");
    }
    
    @Override
    public List<Note> getPendingNotes() {
        return noteDAO.findByStatus("pending");
    }
    
    @Override
    public List<Note> getNotesByUser(Long userId) {
        return noteDAO.findByUserId(userId);
    }
    
    @Override
    public Note getNoteById(Long id) {
        return noteDAO.findById(id);
    }
    
    @Override
    public boolean approveNote(Long id) {
        try {
            Note note = noteDAO.findById(id);
            if (note != null) {
                note.setStatus("approved");
                noteDAO.update(note);
                return true;
            }
            return false;
        } catch (Exception e) {
            e.printStackTrace();
            return false;
        }
    }
    
    @Override
    public boolean rejectNote(Long id) {
        try {
            Note note = noteDAO.findById(id);
            if (note != null) {
                note.setStatus("rejected");
                noteDAO.update(note);
                return true;
            }
            return false;
        } catch (Exception e) {
            e.printStackTrace();
            return false;
        }
    }
    
    @Override
    public boolean deleteNote(Long id) {
        try {
            noteDAO.delete(id);
            return true;
        } catch (Exception e) {
            e.printStackTrace();
            return false;
        }
    }
}