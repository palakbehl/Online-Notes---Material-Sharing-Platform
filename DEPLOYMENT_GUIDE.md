# Deployment Guide for Online Notes Sharing System

## Prerequisites

1. Java 11 or higher installed
2. MySQL database server installed and running
3. Apache Maven installed

## Database Setup

### Option 1: Using the provided setup script (Windows)
Double-click on `setup-database.bat` or run it from the command line:
```
setup-database.bat
```

### Option 2: Manual setup
1. Make sure MySQL is running on your system
2. Create the database and tables by running:
   ```
   mysql -u root < setup-database.sql
   ```

## Configuration

The application is configured to connect to MySQL with the following settings:
- Host: localhost
- Port: 3306
- Database: notes_sharing_db
- Username: palak
- Password: palak@mysql

If you need to change these settings, update the following files:
1. `src/main/webapp/WEB-INF/dispatcher-servlet.xml`
2. `src/main/resources/hibernate.cfg.xml`

## Running the Application

### Option 1: Using the provided batch file (Windows)
Double-click on `run-application.bat` or run it from the command line:
```
run-application.bat
```

### Option 2: Manual execution
1. Compile the project:
   ```
   mvn clean compile
   ```

2. Package the application:
   ```
   mvn package
   ```

3. Run the application:
   ```
   mvn tomcat7:run
   ```

## Accessing the Application

Once the application is running, you can access it at:
```
http://localhost:9091/notes/
```

## Default Users

The database setup creates a default admin user:
- Email: admin@example.com
- Password: admin123

## Troubleshooting

### Database Connection Issues
If you see "Access denied for user 'root'@'localhost'" errors:
1. Make sure your MySQL server is running
2. Verify that the root user can connect without a password (default MySQL configuration)
3. If you have a password on your root user, update the configuration files with your password

If you see "Public Key Retrieval is not allowed" errors:
1. The configuration already includes `allowPublicKeyRetrieval=true`
2. Make sure your MySQL server is running
3. Check that the database exists

### Port Conflicts
If port 9091 is already in use:
1. Edit the `pom.xml` file
2. Change the port in the tomcat7-maven-plugin configuration
3. Update the run-application.bat file accordingly

### Compilation Errors
If you encounter compilation errors:
1. Make sure Java 11 or higher is installed
2. Verify that Maven is properly configured
3. Check that all dependencies are correctly downloaded

### Common MySQL Setup Issues

1. **Root user password**: By default, the application connects to MySQL with the root user and no password. If your MySQL installation requires a password for root:
   - Update the password property in both configuration files
   - Or create a new user with appropriate privileges

2. **Database doesn't exist**: The configuration includes `createDatabaseIfNotExist=true` to automatically create the database

3. **MySQL service not running**: Make sure the MySQL service is started before running the application

### Verifying MySQL Connection
You can test your MySQL connection with:
```
mysql -u root -e "SHOW DATABASES;"
```

If this fails, check your MySQL installation and service status.