-- Test script to verify admin user exists in the database
USE notes_sharing_db;

-- Check if the admin user exists
SELECT id, name, email, password, role, status 
FROM users 
WHERE email = 'admin@example.com';

-- Check all users in the database
SELECT id, name, email, password, role, status 
FROM users;

-- Check if any user has the email palakbehls@gmail.com
SELECT id, name, email, password, role, status 
FROM users 
WHERE email = 'palakbehls@gmail.com';