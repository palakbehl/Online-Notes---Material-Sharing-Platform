@echo off
cls
echo ====================================================
echo    Online Notes Sharing System - Database Setup
echo ====================================================
echo.
echo This script will set up the MySQL database for the application.
echo Make sure MySQL is running before continuing.
echo.
echo Press any key to continue or Ctrl+C to cancel...
pause >nul

echo.
echo Setting up database...
mysql -u palak -p"palak@mysql" -e "source setup-database.sql"

echo.
echo Database setup completed!
echo.
echo Default admin credentials:
echo   Email: admin@example.com
echo   Password: admin123
echo.
pause