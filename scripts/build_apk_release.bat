@echo off

echo ========================================
echo Flutter APK Release Build Script
echo ========================================
echo.

:: Get script directory and project root
set "SCRIPT_DIR=%~dp0"
set "PROJECT_ROOT=%SCRIPT_DIR%.."
cd /d "%PROJECT_ROOT%"

:: Create temporary file for error output
set "TEMP_ERROR=%TEMP%\flutter_apk_error_%RANDOM%.txt"

echo Starting APK release build process...
echo.

:: Step 1: Flutter Clean
echo ----------------------------------------
echo Step 1: Running flutter clean in all directories
echo ----------------------------------------
echo.

echo - Cleaning root directory...
call flutter clean >nul 2>"%TEMP_ERROR%"
if errorlevel 1 (
    echo   ERROR: Failed to clean root directory
    echo   Error details:
    if exist "%TEMP_ERROR%" (
        type "%TEMP_ERROR%"
        del "%TEMP_ERROR%" >nul 2>&1
    ) else (
        echo   No error details available
    )
    echo.
    goto :error
)
echo   SUCCESS: Root directory cleaned successfully
echo.

echo - Cleaning data directory...
cd data
if not exist "pubspec.yaml" (
    echo   ERROR: pubspec.yaml not found in data directory
    cd ..
    goto :error
)
call flutter clean >nul 2>"%TEMP_ERROR%"
if errorlevel 1 (
    echo   ERROR: Failed to clean data directory
    echo   Error details:
    if exist "%TEMP_ERROR%" (
        type "%TEMP_ERROR%"
        del "%TEMP_ERROR%" >nul 2>&1
    ) else (
        echo   No error details available
    )
    cd ..
    echo.
    goto :error
)
echo   SUCCESS: Data directory cleaned successfully
cd ..
echo.

echo - Cleaning domain directory...
cd domain
if not exist "pubspec.yaml" (
    echo   ERROR: pubspec.yaml not found in domain directory
    cd ..
    goto :error
)
call flutter clean >nul 2>"%TEMP_ERROR%"
if errorlevel 1 (
    echo   ERROR: Failed to clean domain directory
    echo   Error details:
    if exist "%TEMP_ERROR%" (
        type "%TEMP_ERROR%"
        del "%TEMP_ERROR%" >nul 2>&1
    ) else (
        echo   No error details available
    )
    cd ..
    echo.
    goto :error
)
echo   SUCCESS: Domain directory cleaned successfully
cd ..
echo.

:: Step 2: Build Runner
echo ----------------------------------------
echo Step 2: Running build_runner in data and domain directories
echo ----------------------------------------
echo.

echo - Running build_runner in data directory...
cd data
call dart run build_runner build --delete-conflicting-outputs >nul 2>"%TEMP_ERROR%"
if errorlevel 1 (
    echo   ERROR: Build runner failed in data directory
    echo   Error details:
    if exist "%TEMP_ERROR%" (
        type "%TEMP_ERROR%"
        del "%TEMP_ERROR%" >nul 2>&1
    ) else (
        echo   No error details available
    )
    cd ..
    echo.
    goto :error
)
echo   SUCCESS: Build runner completed successfully in data directory
cd ..
echo.

echo - Running build_runner in domain directory...
cd domain
call dart run build_runner build --delete-conflicting-outputs >nul 2>"%TEMP_ERROR%"
if errorlevel 1 (
    echo   ERROR: Build runner failed in domain directory
    echo   Error details:
    if exist "%TEMP_ERROR%" (
        type "%TEMP_ERROR%"
        del "%TEMP_ERROR%" >nul 2>&1
    ) else (
        echo   No error details available
    )
    cd ..
    echo.
    goto :error
)
echo   SUCCESS: Build runner completed successfully in domain directory
cd ..
echo.

:: Step 3: Build APK Release
echo ----------------------------------------
echo Step 3: Building APK release
echo ----------------------------------------
echo.

echo - Building APK release...
call flutter build apk --release >nul 2>"%TEMP_ERROR%"
if errorlevel 1 (
    echo   ERROR: Failed to build APK release
    echo   Error details:
    if exist "%TEMP_ERROR%" (
        type "%TEMP_ERROR%"
        del "%TEMP_ERROR%" >nul 2>&1
    ) else (
        echo   No error details available
    )
    echo.
    goto :error
)
echo   SUCCESS: APK release built successfully
echo.

:: Success message
echo ========================================
echo SUCCESS: APK release build completed successfully!
echo ========================================
echo.
echo Built APK location:
echo - APK: build\app\outputs\flutter-apk\app-release.apk
echo.

:: Clean up temp file
if exist "%TEMP_ERROR%" del "%TEMP_ERROR%" >nul 2>&1
goto :end

:error
echo ========================================
echo ERROR: APK build process failed!
echo ========================================
echo Please check the error messages above and fix any issues.
echo.
echo Press any key to exit...
pause >nul
exit /b 1

:end
echo Press any key to exit...
pause >nul