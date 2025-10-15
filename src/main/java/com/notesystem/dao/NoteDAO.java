package com.notesystem.dao;

import com.notesystem.model.Note;
import java.util.List;

public interface NoteDAO {
    void save(Note note);
    Note findById(Long id);
    List<Note> findAll();
    List<Note> findByStatus(String status);
    List<Note> findByUserId(Long userId);
    void update(Note note);
    void delete(Long id);
}