package com.notesystem.service;

import com.notesystem.model.Note;
import java.util.List;

public interface NoteService {
    boolean uploadNote(Note note);
    List<Note> getAllNotes();
    List<Note> getApprovedNotes();
    List<Note> getPendingNotes();
    List<Note> getNotesByUser(Long userId);
    Note getNoteById(Long id);
    boolean approveNote(Long id);
    boolean rejectNote(Long id);
    boolean deleteNote(Long id);
}