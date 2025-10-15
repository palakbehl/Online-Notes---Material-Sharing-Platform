package com.notesystem.service;

import com.notesystem.dao.UserDAO;
import com.notesystem.model.User;
import org.springframework.transaction.annotation.Transactional;

import java.util.List;

@Transactional
public class UserServiceImpl implements UserService {
    
    private UserDAO userDAO;
    
    public void setUserDAO(UserDAO userDAO) {
        this.userDAO = userDAO;
    }
    
    @Override
    public boolean registerUser(User user) {
        try {
            user.setStatus("active");
            user.setRole("user");
            userDAO.save(user);
            return true;
        } catch (Exception e) {
            e.printStackTrace();
            return false;
        }
    }
    
    @Override
    public User loginUser(String email, String password) {
        return userDAO.authenticate(email, password);
    }
    
    @Override
    public User getUserById(Long id) {
        return userDAO.findById(id);
    }
    
    @Override
    public List<User> getAllUsers() {
        return userDAO.findAll();
    }
    
    @Override
    public boolean updateUser(User user) {
        try {
            userDAO.update(user);
            return true;
        } catch (Exception e) {
            e.printStackTrace();
            return false;
        }
    }
    
    @Override
    public boolean deleteUser(Long id) {
        try {
            userDAO.delete(id);
            return true;
        } catch (Exception e) {
            e.printStackTrace();
            return false;
        }
    }
    
    @Override
    public User findByEmail(String email) {
        return userDAO.findByEmail(email);
    }
    
    @Override
    public boolean activateUser(Long id) {
        try {
            User user = userDAO.findById(id);
            if (user != null) {
                user.setStatus("active");
                userDAO.update(user);
                return true;
            }
            return false;
        } catch (Exception e) {
            e.printStackTrace();
            return false;
        }
    }
    
    @Override
    public boolean deactivateUser(Long id) {
        try {
            User user = userDAO.findById(id);
            if (user != null) {
                user.setStatus("inactive");
                userDAO.update(user);
                return true;
            }
            return false;
        } catch (Exception e) {
            e.printStackTrace();
            return false;
        }
    }
}