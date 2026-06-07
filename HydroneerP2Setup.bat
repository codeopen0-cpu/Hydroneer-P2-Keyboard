@echo off
chcp 65001 >nul
title Hydroneer Player 2 Keyboard Setup
color 0B

:: ─── Hydroneer Player 2 Keyboard Setup ───
:: Send this file to your friend! They just double-click and follow the steps.
:: This lets them use keyboard+mouse instead of a controller in Hydroneer.

set VERSION=1.0.0
set TOOL_DIR=%~dp0

:MENU
cls
echo ================================================
echo    Hydroneer Player 2 Keyboard Setup v%VERSION%
echo ================================================
echo.
echo  This tool lets you use KEYBOARD + MOUSE as
echo  Player 2 in Hydroneer multiplayer!
echo.
echo  No controller needed.
echo.
echo  What it does:
echo    1. Installs vJoy (virtual controller driver)
echo    2. Downloads UCR (keyboard-to-controller mapper)
echo    3. Creates the mapping profile for Hydroneer
echo.
echo  Press ENTER to start, or close this window to cancel.
echo.
pause

:: ─── Step 1: Create folders ───
set DOWNLOAD_DIR=%TOOL_DIR%downloads
set PROFILE_DIR=%TOOL_DIR%UCR_Profile
if not exist "%DOWNLOAD_DIR%" mkdir "%DOWNLOAD_DIR%"
if not exist "%PROFILE_DIR%" mkdir "%PROFILE_DIR%"

:: ─── Step 2: Create UCR profile ───
set PROFILE_FILE="%PROFILE_DIR%\HydroneerP2.ucrprofile"
if not exist %PROFILE_FILE% (
    (
        echo ^<?xml version="1.0" encoding="utf-8"?^>
        echo ^<Profile^>
        echo   ^<Name^>Hydroneer Keyboard Player 2^</Name^>
        echo   ^<Plugins^>
        echo     ^<Plugin Name="vJoy" /^>
        echo   ^</Plugins^>
        echo   ^<Mappings^>
        echo     ^<Mapping^>^<Input^>Keyboard.W^</Input^>^<Output^>vJoy.1.Axis.Y-^</Output^>^</Mapping^>
        echo     ^<Mapping^>^<Input^>Keyboard.S^</Input^>^<Output^>vJoy.1.Axis.Y+^</Output^>^</Mapping^>
        echo     ^<Mapping^>^<Input^>Keyboard.A^</Input^>^<Output^>vJoy.1.Axis.X-^</Output^>^</Mapping^>
        echo     ^<Mapping^>^<Input^>Keyboard.D^</Input^>^<Output^>vJoy.1.Axis.X+^</Output^>^</Mapping^>
        echo     ^<Mapping^>^<Input^>Keyboard.Space^</Input^>^<Output^>vJoy.1.Buttons.A^</Output^>^</Mapping^>
        echo     ^<Mapping^>^<Input^>Keyboard.E^</Input^>^<Output^>vJoy.1.Buttons.B^</Output^>^</Mapping^>
        echo     ^<Mapping^>^<Input^>Keyboard.LShift^</Input^>^<Output^>vJoy.1.Buttons.X^</Output^>^</Mapping^>
        echo     ^<Mapping^>^<Input^>Keyboard.LControl^</Input^>^<Output^>vJoy.1.Buttons.Y^</Output^>^</Mapping^>
        echo     ^<Mapping^>^<Input^>Mouse.X^</Input^>^<Output^>vJoy.1.Axis.Rx^</Output^>^</Mapping^>
        echo     ^<Mapping^>^<Input^>Mouse.Y^</Input^>^<Output^>vJoy.1.Axis.Ry^</Output^>^</Mapping^>
        echo     ^<Mapping^>^<Input^>Mouse.LeftButton^</Input^>^<Output^>vJoy.1.Buttons.RT^</Output^>^</Mapping^>
        echo     ^<Mapping^>^<Input^>Mouse.RightButton^</Input^>^<Output^>vJoy.1.Buttons.LT^</Output^>^</Mapping^>
        echo     ^<Mapping^>^<Input^>Keyboard.Tab^</Input^>^<Output^>vJoy.1.Buttons.Start^</Output^>^</Mapping^>
        echo     ^<Mapping^>^<Input^>Keyboard.Q^</Input^>^<Output^>vJoy.1.Buttons.Back^</Output^>^</Mapping^>
        echo     ^<Mapping^>^<Input^>Keyboard.R^</Input^>^<Output^>vJoy.1.Buttons.DPadUp^</Output^>^</Mapping^>
        echo     ^<Mapping^>^<Input^>Keyboard.F^</Input^>^<Output^>vJoy.1.Buttons.DPadDown^</Output^>^</Mapping^>
        echo   ^</Mappings^>
        echo ^</Profile^>
    ) > %PROFILE_FILE%
    echo [+] Created UCR profile.
) else (
    echo [+] UCR profile already exists.
)

cls
echo ================================================
echo        STEP 1: INSTALL vJoy
echo ================================================
echo.
echo  vJoy creates a virtual Xbox controller that
echo  Windows and Steam will detect as a real controller.
echo.
echo  Downloading vJoy...
echo.

:: Download vJoy
set VJOY_EXE=%DOWNLOAD_DIR%\vJoySetup.exe
if not exist "%VJOY_EXE%" (
    powershell -Command "try { Invoke-WebRequest -Uri 'https://github.com/jshafer817/vJoy/releases/download/v2.2.1.1/vJoy-2.2.1.1-x64.exe' -OutFile '%VJOY_EXE%' -UseBasicParsing -ErrorAction Stop; Write-Host '[OK] Downloaded vJoy' } catch { try { Invoke-WebRequest -Uri 'https://sourceforge.net/projects/vjoystick/files/Beta%202.x/2.2.1.1/vJoy-2.2.1.1-x64.exe/download' -OutFile '%VJOY_EXE%' -UseBasicParsing -ErrorAction Stop; Write-Host '[OK] Downloaded vJoy' } catch { Write-Host '[FAIL] Download failed' } }" 2>nul
)

if exist "%VJOY_EXE%" (
    echo.
    echo  Launching vJoy installer...
    echo  Please complete the installation, then return here.
    echo.
    start /wait "" "%VJOY_EXE%"
    echo [+] vJoy installed!
) else (
    echo.
    echo  [!] Could not download automatically.
    echo  Please download and install vJoy manually from:
    echo  https://sourceforge.net/projects/vjoystick/
    echo.
    pause
)

cls
echo ================================================
echo        STEP 2: DOWNLOAD UCR
echo ================================================
echo.
echo  UCR (Universal Controller Remapper) translates
echo  your keyboard+mouse into controller inputs.
echo.
echo  IMPORTANT: You need UCR version 0.1.13
echo  (newer versions don't support mouse input)
echo.

:: Download UCR
set UCR_ZIP=%DOWNLOAD_DIR%\UCR_v0.1.13.zip
set UCR_DIR=%TOOL_DIR%\UCR

if not exist "%UCR_ZIP%" (
    powershell -Command "try { Invoke-WebRequest -Uri 'https://github.com/evilC/UCR/releases/download/v0.1.13/UCR_v0.1.13.zip' -OutFile '%UCR_ZIP%' -UseBasicParsing -ErrorAction Stop; Write-Host '[OK] Downloaded UCR' } catch { Write-Host '[FAIL] Download failed' }" 2>nul
)

if exist "%UCR_ZIP%" (
    echo.
    echo  Extracting UCR...
    if not exist "%UCR_DIR%" mkdir "%UCR_DIR%"
    powershell -Command "Expand-Archive -Path '%UCR_ZIP%' -DestinationPath '%UCR_DIR%' -Force" 2>nul
    echo [+] UCR extracted to: %UCR_DIR%
) else (
    echo.
    echo  [!] Could not download automatically.
    echo  Download UCR v0.1.13 manually from:
    echo  https://github.com/evilC/UCR/releases/tag/v0.1.13
    echo.
    pause
)

:: Copy profile to UCR folder
if exist "%UCR_DIR%" (
    copy /Y "%PROFILE_DIR%\HydroneerP2.ucrprofile" "%UCR_DIR%\Profiles\" >nul 2>nul
    if not exist "%UCR_DIR%\Profiles\" mkdir "%UCR_DIR%\Profiles\"
    copy /Y "%PROFILE_DIR%\HydroneerP2.ucrprofile" "%UCR_DIR%\Profiles\" >nul
    echo [+] Copied Hydroneer profile to UCR Profiles folder.
)

cls
echo ================================================
echo      STEP 3: SETUP COMPLETE!
echo ================================================
echo.
echo  Everything is ready. Here's how to use it:
echo.
echo  ────────────────────────────────────────────
echo  HOW TO PLAY HYDRONEER WITH KEYBOARD AS P2
echo  ────────────────────────────────────────────
echo.
echo  1. Run UCR:  %UCR_DIR%\UCR.exe
echo.
echo  2. In UCR, go to: IOClasses ^> vJoy ^> Install SCPVBus
echo     (only needed the first time)
echo.
echo  3. In UCR, load the Hydroneer profile:
echo     File ^> Load Profile ^> HydroneerP2.ucrprofile
echo.
echo  4. Leave UCR running (minimized is fine).
echo.
echo  5. The HOST (your friend) opens Hydroneer and:
echo     - Goes to main menu, clicks the + icon (top right)
echo     - Selects "Invite Player" (Steam Remote Play)
echo     - Invites you
echo.
echo  6. When you join, Steam will ask "Is Player 1 using a
echo     gamepad?" - Say YES.
echo.
echo  7. Once in-game, the host should toggle "Player 1
echo     gamepad" checkbox in the ESC menu if controls
echo     feel wrong.
echo.
echo  8. IMPORTANT: The HOST must also have a controller
echo     (real or virtual) connected for Steam Remote Play
echo     to work! Your friend can install vJoy+UCR too.
echo.
echo  ────────────────────────────────────────────
echo  KEYBOARD MAPPING REFERENCE
echo  ────────────────────────────────────────────
echo    WASD          = Move
echo    Mouse         = Look around
echo    Left Click    = Pick up / Action
echo    Right Click   = Place / Drop
echo    Space         = Jump
echo    E             = Interact
echo    Shift         = Sprint
echo    Ctrl          = Crouch
echo    Tab           = Inventory
echo    Q             = Back
echo    R             = D-Pad Up
echo    F             = D-Pad Down
echo.
echo.
echo  Press ENTER to open the UCR folder, or close to exit.
echo.
pause
start "" "%TOOL_DIR%"

:EOF
