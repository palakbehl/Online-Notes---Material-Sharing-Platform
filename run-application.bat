@echo off
cls
echo ====================================================
echo    Online Notes Sharing System - Application Runner
echo ====================================================
echo.
echo Checking prerequisites...

echo 1. Checking Java installation...
java -version >nul 2>&1
if %errorlevel% neq 0 (
    echo ERROR: Java is not installed or not in PATH.
    echo Please install Java 11 or higher and try again.
    pause
    exit /b
)
echo    [OK] Java is installed

echo 2. Checking Maven installation...
mvn -version >nul 2>&1
if %errorlevel% neq 0 (
    echo ERROR: Maven is not installed or not in PATH.
    echo Please install Maven and try again.
    pause
    exit /b
)
echo    [OK] Maven is installed

echo 3. Checking MySQL connection...
mysql -u palak -p"palak@mysql" -e "SELECT 1" >nul 2>&1
if %errorlevel% neq 0 (
    echo WARNING: Cannot connect to MySQL.
    echo Make sure MySQL is running and accessible with user 'palak' and password 'palak@mysql'.
    echo The application may fail to start if the database is not set up.
    echo.
    pause
)

echo.
echo Building and running Online Notes Sharing System...

echo.
echo 4. Compiling the project...
mvn clean compile
if %errorlevel% neq 0 (
    echo ERROR: Compilation failed.
    pause
    exit /b
)
echo    [OK] Compilation successful

echo.
echo 5. Packaging the application...
mvn package
if %errorlevel% neq 0 (
    echo ERROR: Packaging failed.
    pause
    exit /b
)
echo    [OK] Packaging successful

echo.
echo 6. Starting the application...
echo    Access the application at: http://localhost:9091/notes/
echo    Press Ctrl+C to stop the server
mvn tomcat7:run