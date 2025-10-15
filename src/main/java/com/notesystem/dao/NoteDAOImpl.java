package com.notesystem.dao;

import com.notesystem.model.Note;
import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.query.Query;

import java.util.List;
public class NoteDAOImpl implements NoteDAO {
    
    private SessionFactory sessionFactory;
    
    public void setSessionFactory(SessionFactory sessionFactory) {
        this.sessionFactory = sessionFactory;
    }
    
    @Override
    public void save(Note note) {
        sessionFactory.getCurrentSession().save(note);
    }
    
    @Override
    public Note findById(Long id) {
        Session session = sessionFactory.getCurrentSession();
        Query<Note> query = session.createQuery("FROM Note n LEFT JOIN FETCH n.uploadedBy WHERE n.id = :id", Note.class);
        query.setParameter("id", id);
        List<Note> notes = query.getResultList();
        return notes.isEmpty() ? null : notes.get(0);
    }
    
    @Override
    public List<Note> findAll() {
        Session session = sessionFactory.getCurrentSession();
        Query<Note> query = session.createQuery("FROM Note n LEFT JOIN FETCH n.uploadedBy", Note.class);
        return query.getResultList();
    }
    
    @Override
    public List<Note> findByStatus(String status) {
        Session session = sessionFactory.getCurrentSession();
        Query<Note> query = session.createQuery("FROM Note n LEFT JOIN FETCH n.uploadedBy WHERE n.status = :status", Note.class);
        query.setParameter("status", status);
        return query.getResultList();
    }
    
    @Override
    public List<Note> findByUserId(Long userId) {
        Session session = sessionFactory.getCurrentSession();
        Query<Note> query = session.createQuery("FROM Note n LEFT JOIN FETCH n.uploadedBy WHERE n.uploadedBy.id = :userId", Note.class);
        query.setParameter("userId", userId);
        return query.getResultList();
    }
    
    @Override
    public void update(Note note) {
        sessionFactory.getCurrentSession().update(note);
    }
    
    @Override
    public void delete(Long id) {
        Session session = sessionFactory.getCurrentSession();
        Note note = session.get(Note.class, id);
        if (note != null) {
            session.delete(note);
        }
    }
}