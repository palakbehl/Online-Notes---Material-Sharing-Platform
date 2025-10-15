package com.notesystem.model;

import javax.persistence.*;
import java.util.Date;

@Entity
@Table(name = "clipboards")
public class Clipboard {
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private Long id;
    
    @Column(name = "unique_code", nullable = false, unique = true)
    private String uniqueCode;
    
    @Column(name = "document_link", nullable = false, length = 1000)
    private String documentLink;
    
    @Column(name = "description", length = 500)
    private String description;
    
    @Column(name = "status", nullable = false)
    private String status; // "active" or "inactive"
    
    @Temporal(TemporalType.TIMESTAMP)
    @Column(name = "created_date")
    private Date createdDate;
    
    @ManyToOne(fetch = FetchType.LAZY)
    @JoinColumn(name = "created_by")
    private User createdBy;
    
    // Default constructor
    public Clipboard() {}
    
    // Constructor with parameters
    public Clipboard(String uniqueCode, String documentLink, String description, String status, Date createdDate, User createdBy) {
        this.uniqueCode = uniqueCode;
        this.documentLink = documentLink;
        this.description = description;
        this.status = status;
        this.createdDate = createdDate;
        this.createdBy = createdBy;
    }
    
    // Getters and Setters
    public Long getId() {
        return id;
    }
    
    public void setId(Long id) {
        this.id = id;
    }
    
    public String getUniqueCode() {
        return uniqueCode;
    }
    
    public void setUniqueCode(String uniqueCode) {
        this.uniqueCode = uniqueCode;
    }
    
    public String getDocumentLink() {
        return documentLink;
    }
    
    public void setDocumentLink(String documentLink) {
        this.documentLink = documentLink;
    }
    
    public String getDescription() {
        return description;
    }
    
    public void setDescription(String description) {
        this.description = description;
    }
    
    public String getStatus() {
        return status;
    }
    
    public void setStatus(String status) {
        this.status = status;
    }
    
    public Date getCreatedDate() {
        return createdDate;
    }
    
    public void setCreatedDate(Date createdDate) {
        this.createdDate = createdDate;
    }
    
    public User getCreatedBy() {
        return createdBy;
    }
    
    public void setCreatedBy(User createdBy) {
        this.createdBy = createdBy;
    }
}