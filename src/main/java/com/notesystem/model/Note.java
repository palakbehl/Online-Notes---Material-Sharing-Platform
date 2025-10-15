package com.notesystem.model;

import javax.persistence.*;
import java.util.Date;

@Entity
@Table(name = "notes")
public class Note {
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private Long id;
    
    @Column(nullable = false)
    private String title;
    
    @Column(length = 1000)
    private String description;
    
    @Column(name = "file_path")
    private String filePath;
    
    @Column(name = "file_link")
    private String fileLink;
    
    @Column(nullable = false)
    private String status; // "pending" or "approved"
    
    @Temporal(TemporalType.TIMESTAMP)
    @Column(name = "upload_date")
    private Date uploadDate;
    
    @ManyToOne(fetch = FetchType.LAZY)
    @JoinColumn(name = "uploaded_by")
    private User uploadedBy;
    
    // Default constructor
    public Note() {}
    
    // Constructor with parameters
    public Note(String title, String description, String filePath, String fileLink, String status, Date uploadDate, User uploadedBy) {
        this.title = title;
        this.description = description;
        this.filePath = filePath;
        this.fileLink = fileLink;
        this.status = status;
        this.uploadDate = uploadDate;
        this.uploadedBy = uploadedBy;
    }
    
    // Getters and Setters
    public Long getId() {
        return id;
    }
    
    public void setId(Long id) {
        this.id = id;
    }
    
    public String getTitle() {
        return title;
    }
    
    public void setTitle(String title) {
        this.title = title;
    }
    
    public String getDescription() {
        return description;
    }
    
    public void setDescription(String description) {
        this.description = description;
    }
    
    public String getFilePath() {
        return filePath;
    }
    
    public void setFilePath(String filePath) {
        this.filePath = filePath;
    }
    
    public String getFileLink() {
        return fileLink;
    }
    
    public void setFileLink(String fileLink) {
        this.fileLink = fileLink;
    }
    
    public String getStatus() {
        return status;
    }
    
    public void setStatus(String status) {
        this.status = status;
    }
    
    public Date getUploadDate() {
        return uploadDate;
    }
    
    public void setUploadDate(Date uploadDate) {
        this.uploadDate = uploadDate;
    }
    
    public User getUploadedBy() {
        return uploadedBy;
    }
    
    public void setUploadedBy(User uploadedBy) {
        this.uploadedBy = uploadedBy;
    }
}