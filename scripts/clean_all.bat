@echo off

echo ========================================
echo Flutter Clean All Script
echo ========================================
echo.

:: Get script directory and project root
set "SCRIPT_DIR=%~dp0"
set "PROJECT_ROOT=%SCRIPT_DIR%.."
cd /d "%PROJECT_ROOT%"

:: Create temporary file for error output
set "TEMP_ERROR=%TEMP%\flutter_clean_error_%RANDOM%.txt"

echo ----------------------------------------
echo Cleaning all directories
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
echo   SUCCESS: Root directory cleaned
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
echo   SUCCESS: Data directory cleaned
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
echo   SUCCESS: Domain directory cleaned
cd ..
echo.

echo ========================================
echo SUCCESS: All directories cleaned successfully!
echo ========================================
echo.

:: Clean up temp file
if exist "%TEMP_ERROR%" del "%TEMP_ERROR%" >nul 2>&1
goto :end

:error
echo ========================================
echo ERROR: Clean process failed!
echo ========================================
echo Please check the error messages above and fix any issues.
echo.
echo Press any key to exit...
pause >nul
exit /b 1

:end
echo Press any key to exit...
pause >nul