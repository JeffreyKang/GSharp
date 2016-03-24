@echo off
COLOR 3E
TITLE DLL UPDATE
MODE con:cols=42 lines=30

rem ---------------------- SETTINGS ----------------------
set BIN=bin\Debug
set GSHARP=.
set ENTRA_CORE=..\entra\DLL
set ENTRA_STUDIO=..\entrastudio\DLL
rem ---------------------- SETTINGS ----------------------

echo ------------------------------------------
echo         _______   ____________  ____
echo         / ____/ ^| / /_  __/__ ��/   ^|
echo        / __/ /  ^|/ / / / / /_/ / /^| ^|
echo       / /___/ /^|  / / / / _, _/ ___ ^|
echo      /_____/_/ ^|_/ /_/ /_/ ^|_/_/  ^|_^|
echo.
echo.
echo -------------AUTO DLL UPDATER-------------
echo.

if not exist %ENTRA_CORE% mkdir %ENTRA_CORE%
copy %GSHARP%\GSharp.Base\%BIN%\GSharp.Base.dll %ENTRA_CORE%\GSharp.Base.dll
copy %GSHARP%\GSharp.Compile\%BIN%\GSharp.Compile.dll %ENTRA_CORE%\GSharp.Compile.dll
copy %GSHARP%\GSharp.Extension\%BIN%\GSharp.Extension.dll %ENTRA_CORE%\GSharp.Extension.dll
copy %GSHARP%\GSharp.Graphic\%BIN%\GSharp.Graphic.dll %ENTRA_CORE%\GSharp.Graphic.dll
copy %GSHARP%\GSharp.Manager\%BIN%\GSharp.Manager.dll %ENTRA_CORE%\GSharp.Manager.dll
copy %GSHARP%\GSharp.Runtime\%BIN%\GSharp.Runtime.dll %ENTRA_CORE%\GSharp.Runtime.dll

if not exist %ENTRA_STUDIO% mkdir %ENTRA_STUDIO%
copy %GSHARP%\GSharp.Base\%BIN%\GSharp.Base.dll %ENTRA_STUDIO%\GSharp.Base.dll
copy %GSHARP%\GSharp.Compile\%BIN%\GSharp.Compile.dll %ENTRA_STUDIO%\GSharp.Compile.dll
copy %GSHARP%\GSharp.Extension\%BIN%\GSharp.Extension.dll %ENTRA_STUDIO%\GSharp.Extension.dll
copy %GSHARP%\GSharp.Graphic\%BIN%\GSharp.Graphic.dll %ENTRA_STUDIO%\GSharp.Graphic.dll
copy %GSHARP%\GSharp.Manager\%BIN%\GSharp.Manager.dll %ENTRA_STUDIO%\GSharp.Manager.dll
copy %GSHARP%\GSharp.Runtime\%BIN%\GSharp.Runtime.dll %ENTRA_STUDIO%\GSharp.Runtime.dll

echo.
echo            DLL UPDATE COMPLETE!
echo.

echo.
SET /P P=------------------------------------------