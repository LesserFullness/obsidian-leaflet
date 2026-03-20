@echo off
echo ========================================
echo Leaflet Plugin Clustering - Installation
echo ========================================
echo.

:: Check if npm is available
where npm >nul 2>nul
if %ERRORLEVEL% NEQ 0 (
    echo [ERROR] npm not found. Please install Node.js first.
    echo Download from: https://nodejs.org/
    echo.
    pause
    exit /b 1
)

echo [1/4] Changing to source directory...
cd /d %~dp0
if %ERRORLEVEL% NEQ 0 (
    echo [ERROR] Cannot change to source directory
    pause
    exit /b 1
)

echo [2/4] Installing dependencies (including leaflet.markercluster)...
call npm install
if %ERRORLEVEL% NEQ 0 (
    echo [ERROR] npm install failed
    pause
    exit /b 1
)

echo.
echo [3/4] Building plugin...
call npm run build
if %ERRORLEVEL% NEQ 0 (
    echo [ERROR] Build failed
    pause
    exit /b 1
)

echo.
echo [4/4] Copying files to plugin directory...
set "PLUGIN_DIR=%~dp0..\yong\.obsidian\plugins\obsidian-leaflet-plugin"

if not exist "%PLUGIN_DIR%" (
    echo [ERROR] Plugin directory not found: %PLUGIN_DIR%
    pause
    exit /b 1
)

copy /Y "main.js" "%PLUGIN_DIR%\main.js"
copy /Y "manifest.json" "%PLUGIN_DIR%\manifest.json"
copy /Y "styles.css" "%PLUGIN_DIR%\styles.css"

echo.
echo ========================================
echo Installation Complete!
echo ========================================
echo.
echo Please reload Obsidian:
echo 1. Go to Settings -> Third-party plugins
echo 2. Find Leaflet plugin
echo 3. Disable and re-enable it (or restart Obsidian)
echo 4. Enable "Marker Clustering" in plugin settings
echo.
pause
