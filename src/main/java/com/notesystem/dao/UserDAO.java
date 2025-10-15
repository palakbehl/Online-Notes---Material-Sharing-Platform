package com.notesystem.dao;

import com.notesystem.model.User;
import java.util.List;

public interface UserDAO {
    void save(User user);
    User findById(Long id);
    User findByEmail(String email);
    List<User> findAll();
    void update(User user);
    void delete(Long id);
    User authenticate(String email, String password);
}