package com.notesystem.dao;

import com.notesystem.model.Clipboard;
import java.util.List;

public interface ClipboardDAO {
    void save(Clipboard clipboard);
    Clipboard findById(Long id);
    Clipboard findByUniqueCode(String uniqueCode);
    List<Clipboard> findByUserId(Long userId);
    List<Clipboard> findAll();
    List<Clipboard> findByStatus(String status);
    void update(Clipboard clipboard);
    void delete(Long id);
}