package com.notesystem.service;

import com.notesystem.model.Clipboard;
import java.util.List;

public interface ClipboardService {
    boolean createClipboardEntry(Clipboard clipboard);
    Clipboard getClipboardByCode(String uniqueCode);
    Clipboard getClipboardById(Long id);
    List<Clipboard> getClipboardsByUser(Long userId);
    List<Clipboard> getAllClipboards();
    List<Clipboard> getActiveClipboards();
    boolean updateClipboard(Clipboard clipboard);
    boolean deleteClipboard(Long id);
    String generateUniqueCode();
}