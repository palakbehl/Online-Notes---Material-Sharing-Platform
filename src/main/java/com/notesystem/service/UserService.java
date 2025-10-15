package com.notesystem.service;

import com.notesystem.model.User;
import java.util.List;

public interface UserService {
    boolean registerUser(User user);
    User loginUser(String email, String password);
    User getUserById(Long id);
    List<User> getAllUsers();
    boolean updateUser(User user);
    boolean deleteUser(Long id);
    User findByEmail(String email);
    boolean activateUser(Long id);
    boolean deactivateUser(Long id);
}