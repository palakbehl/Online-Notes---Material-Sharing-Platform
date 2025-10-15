-- Online Notes & Study Material Sharing System
-- Database Setup Script

-- Create database (if it doesn't exist)
CREATE DATABASE IF NOT EXISTS notes_sharing_db;
USE notes_sharing_db;

-- Users Table
CREATE TABLE IF NOT EXISTS users (
    id BIGINT AUTO_INCREMENT PRIMARY KEY,
    name VARCHAR(255) NOT NULL,
    email VARCHAR(255) NOT NULL UNIQUE,
    password VARCHAR(255) NOT NULL,
    role VARCHAR(50) NOT NULL,      -- "user" or "admin"
    status VARCHAR(50) NOT NULL,    -- "active" or "inactive"
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    updated_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP
);

-- Notes Table
CREATE TABLE IF NOT EXISTS notes (
    id BIGINT AUTO_INCREMENT PRIMARY KEY,
    title VARCHAR(255) NOT NULL,
    description TEXT,
    file_path VARCHAR(255),
    file_link VARCHAR(255),
    status VARCHAR(50) NOT NULL,    -- "pending", "approved", or "rejected"
    upload_date TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    uploaded_by BIGINT NOT NULL,
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    updated_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
    FOREIGN KEY (uploaded_by) REFERENCES users(id) ON DELETE CASCADE
);

-- Clipboards Table
CREATE TABLE IF NOT EXISTS clipboards (
    id BIGINT AUTO_INCREMENT PRIMARY KEY,
    unique_code VARCHAR(50) NOT NULL UNIQUE,
    document_link VARCHAR(1000) NOT NULL,
    description VARCHAR(500),
    status VARCHAR(50) NOT NULL,    -- "active" or "inactive"
    created_date TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    created_by BIGINT NOT NULL,
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    updated_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
    FOREIGN KEY (created_by) REFERENCES users(id) ON DELETE CASCADE
);

-- Insert default admin user (only if it doesn't exist)
INSERT IGNORE INTO users (name, email, password, role, status) 
VALUES ('Admin User', 'admin@example.com', 'admin123', 'admin', 'active');

-- Indexes for better performance
CREATE INDEX idx_users_email ON users(email);
CREATE INDEX idx_notes_status ON notes(status);
CREATE INDEX idx_notes_uploaded_by ON notes(uploaded_by);
CREATE INDEX idx_clipboards_code ON clipboards(unique_code);
CREATE INDEX idx_clipboards_status ON clipboards(status);
CREATE INDEX idx_clipboards_created_by ON clipboards(created_by);

-- Display success message
SELECT 'Database setup completed successfully!' AS Message;