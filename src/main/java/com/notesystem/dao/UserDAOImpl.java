package com.notesystem.dao;

import com.notesystem.model.User;
import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.query.Query;

import java.util.List;
public class UserDAOImpl implements UserDAO {
    
    private SessionFactory sessionFactory;
    
    public void setSessionFactory(SessionFactory sessionFactory) {
        this.sessionFactory = sessionFactory;
    }
    
    @Override
    public void save(User user) {
        sessionFactory.getCurrentSession().save(user);
    }
    
    @Override
    public User findById(Long id) {
        return sessionFactory.getCurrentSession().get(User.class, id);
    }
    
    @Override
    public User findByEmail(String email) {
        Session session = sessionFactory.getCurrentSession();
        Query<User> query = session.createQuery("FROM User WHERE email = :email", User.class);
        query.setParameter("email", email);
        List<User> users = query.getResultList();
        return users.isEmpty() ? null : users.get(0);
    }
    
    @Override
    public List<User> findAll() {
        Session session = sessionFactory.getCurrentSession();
        Query<User> query = session.createQuery("FROM User", User.class);
        return query.getResultList();
    }
    
    @Override
    public void update(User user) {
        sessionFactory.getCurrentSession().update(user);
    }
    
    @Override
    public void delete(Long id) {
        Session session = sessionFactory.getCurrentSession();
        User user = session.get(User.class, id);
        if (user != null) {
            session.delete(user);
        }
    }
    
    @Override
    public User authenticate(String email, String password) {
        Session session = sessionFactory.getCurrentSession();
        Query<User> query = session.createQuery("FROM User WHERE email = :email AND password = :password", User.class);
        query.setParameter("email", email);
        query.setParameter("password", password);
        List<User> users = query.getResultList();
        return users.isEmpty() ? null : users.get(0);
    }
}