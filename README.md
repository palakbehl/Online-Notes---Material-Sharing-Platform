# Online Notes & Study Material Sharing System

A full-stack Java web application for sharing study materials among students with admin moderation capabilities.

## Tech Stack

- **Frontend**: JSP with HTML/CSS and Bootstrap
- **Backend**: Java Servlets and Spring MVC (Traditional, not Spring Boot)
- **Database**: MySQL with Hibernate ORM
- **Build Tool**: Maven

## Features

### User Module (Student)
- Register/Login/Logout with session management
- Upload notes (PDF, DOC, or links with metadata)
- View/download approved notes uploaded by others

### Admin Module
- Approve/reject uploaded notes
- Manage users (activate/deactivate accounts)
- Delete inappropriate content

## Project Structure

```
src/
├── main/
│   ├── java/
│   │   └── com/notesystem/
│   │       ├── controller/     # Spring MVC Controllers
│   │       ├── service/        # Business Logic Services
│   │       ├── dao/            # Data Access Objects
│   │       └── model/          # Entity Classes
│   ├── resources/              # Configuration Files
│   └── webapp/
│       ├── WEB-INF/
│       │   ├── views/          # JSP Pages
│       │   │   ├── user/       # User Pages
│       │   │   └── admin/      # Admin Pages
│       │   ├── dispatcher-servlet.xml
│       │   └── web.xml
│       └── resources/          # Static Resources
└── test/                       # Unit Tests
```

## Database Schema

### Users Table
```sql
CREATE TABLE users (
    id BIGINT AUTO_INCREMENT PRIMARY KEY,
    name VARCHAR(255) NOT NULL,
    email VARCHAR(255) NOT NULL UNIQUE,
    password VARCHAR(255) NOT NULL,
    role VARCHAR(50) NOT NULL,      -- "user" or "admin"
    status VARCHAR(50) NOT NULL     -- "active" or "inactive"
);
```

### Notes Table
```sql
CREATE TABLE notes (
    id BIGINT AUTO_INCREMENT PRIMARY KEY,
    title VARCHAR(255) NOT NULL,
    description TEXT,
    file_path VARCHAR(255),
    file_link VARCHAR(255),
    status VARCHAR(50) NOT NULL,    -- "pending" or "approved"
    upload_date TIMESTAMP,
    uploaded_by BIGINT,
    FOREIGN KEY (uploaded_by) REFERENCES users(id)
);
```

## Setup Instructions

1. **Database Setup**:
   - **Option 1**: Double-click on `setup-database.bat` to automatically set up the database
   - **Option 2**: Manually create the database and tables by running: `mysql -u root < setup-database.sql`

2. **Configuration**:
   - The application is configured to connect to MySQL with:
     - Host: localhost
     - Port: 3306
     - Database: notes_sharing_db
     - Username: palak
     - Password: palak@mysql
   - Update these settings in `src/main/webapp/WEB-INF/dispatcher-servlet.xml` and `src/main/resources/hibernate.cfg.xml` if needed

3. **Running the Application**:
   - **Option 1**: Double-click on `run-application.bat`
   - **Option 2**: Run manually with Maven:
     - Build the project: `mvn clean compile`
     - Package the application: `mvn package`
     - Run the application: `mvn tomcat7:run`

4. **Access the Application**:
   - Open your browser and go to: `http://localhost:9091/notes/`

5. **Default Admin User**:
   - The database setup automatically creates an admin user:
     - Email: admin@example.com
     - Password: admin123

## Troubleshooting

If you encounter database connection issues:
1. Make sure MySQL is running
2. Check that the root user can connect without a password (default MySQL configuration)
3. Refer to DEPLOYMENT_GUIDE.md for detailed troubleshooting steps

## API Endpoints

### User Routes
- `GET /user/register` - Show registration form
- `POST /user/register` - Process registration
- `GET /user/login` - Show login form
- `POST /user/login` - Process login
- `GET /user/dashboard` - User dashboard
- `GET /user/upload` - Show upload form
- `POST /user/upload` - Process note upload
- `GET /user/view` - View approved notes
- `GET /user/download/{id}` - Download a note
- `GET /user/logout` - Logout

### Admin Routes
- `GET /admin/dashboard` - Admin dashboard
- `POST /admin/approveNote/{id}` - Approve a note
- `POST /admin/rejectNote/{id}` - Reject a note
- `POST /admin/deleteNote/{id}` - Delete a note
- `POST /admin/activateUser/{id}` - Activate a user
- `POST /admin/deactivateUser/{id}` - Deactivate a user
- `POST /admin/deleteUser/{id}` - Delete a user

## Security Features

- Password encryption (to be implemented)
- Session management
- Role-based access control
- Input validation

## Future Enhancements

- Implement password encryption using BCrypt
- Add email verification for registration
- Implement pagination for notes listing
- Add search functionality for notes
- Implement file size and type validation
- Add user profile management
- Implement audit logging"# Online-Notes---Material-Sharing-Platform" 
