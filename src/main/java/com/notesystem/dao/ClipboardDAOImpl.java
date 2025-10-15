package com.notesystem.dao;

import com.notesystem.model.Clipboard;
import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.query.Query;
import org.springframework.beans.factory.annotation.Autowired;

import java.util.List;

public class ClipboardDAOImpl implements ClipboardDAO {
    
    private SessionFactory sessionFactory;
    
    public void setSessionFactory(SessionFactory sessionFactory) {
        this.sessionFactory = sessionFactory;
    }
    
    @Override
    public void save(Clipboard clipboard) {
        sessionFactory.getCurrentSession().save(clipboard);
    }
    
    @Override
    public Clipboard findById(Long id) {
        Session session = sessionFactory.getCurrentSession();
        Query<Clipboard> query = session.createQuery("FROM Clipboard c LEFT JOIN FETCH c.createdBy WHERE c.id = :id", Clipboard.class);
        query.setParameter("id", id);
        List<Clipboard> clipboards = query.getResultList();
        return clipboards.isEmpty() ? null : clipboards.get(0);
    }
    
    @Override
    public Clipboard findByUniqueCode(String uniqueCode) {
        Session session = sessionFactory.getCurrentSession();
        Query<Clipboard> query = session.createQuery("FROM Clipboard c LEFT JOIN FETCH c.createdBy WHERE c.uniqueCode = :uniqueCode", Clipboard.class);
        query.setParameter("uniqueCode", uniqueCode);
        List<Clipboard> clipboards = query.getResultList();
        return clipboards.isEmpty() ? null : clipboards.get(0);
    }
    
    @Override
    public List<Clipboard> findByUserId(Long userId) {
        Session session = sessionFactory.getCurrentSession();
        Query<Clipboard> query = session.createQuery("FROM Clipboard c LEFT JOIN FETCH c.createdBy WHERE c.createdBy.id = :userId ORDER BY c.createdDate DESC", Clipboard.class);
        query.setParameter("userId", userId);
        return query.getResultList();
    }
    
    @Override
    public List<Clipboard> findAll() {
        Session session = sessionFactory.getCurrentSession();
        Query<Clipboard> query = session.createQuery("FROM Clipboard c LEFT JOIN FETCH c.createdBy ORDER BY c.createdDate DESC", Clipboard.class);
        return query.getResultList();
    }
    
    @Override
    public List<Clipboard> findByStatus(String status) {
        Session session = sessionFactory.getCurrentSession();
        Query<Clipboard> query = session.createQuery("FROM Clipboard c LEFT JOIN FETCH c.createdBy WHERE c.status = :status ORDER BY c.createdDate DESC", Clipboard.class);
        query.setParameter("status", status);
        return query.getResultList();
    }
    
    @Override
    public void update(Clipboard clipboard) {
        sessionFactory.getCurrentSession().update(clipboard);
    }
    
    @Override
    public void delete(Long id) {
        Session session = sessionFactory.getCurrentSession();
        Clipboard clipboard = session.get(Clipboard.class, id);
        if (clipboard != null) {
            session.delete(clipboard);
        }
    }
}