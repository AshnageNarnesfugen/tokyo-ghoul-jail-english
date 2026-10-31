@echo off
setlocal EnableExtensions DisableDelayedExpansion
rem apply.bat: builds the English files from your own copy of Tokyo Ghoul: Jail (PCSG00615).
rem Drag the game folder (PCSG00615, its PSP2_GAME\USRDIR, or any folder holding resource.dat, first.dat
rem and env) onto this file, or run: apply.bat "C:\path\to\PCSG00615". Nothing in it is modified: the
rem patched files go to patched\PCSG00615\ next to this file (see README.txt).
set "HERE=%~dp0"
set "OUT=%~dp0patched\PCSG00615\PSP2_GAME\USRDIR"
set "XDELTA=%~dp0xdelta3.exe"
if not exist "%HERE%patches\checksums.txt" goto nozip
if not exist "%XDELTA%" goto nozip
set "SRC=%~1"
if defined SRC goto find
echo Drag the game folder (PCSG00615) into this window and press Enter:
set /p "SRC="
if not defined SRC (echo No folder given.& goto end)
set "SRC=%SRC:"=%"
:trim
if "%SRC:~-1%"==" " set "SRC=%SRC:~0,-1%" & goto trim
:find
set "D="
if exist "%SRC%\PSP2_GAME\USRDIR\resource.dat" set "D=%SRC%\PSP2_GAME\USRDIR"
if not defined D if exist "%SRC%\USRDIR\resource.dat" set "D=%SRC%\USRDIR"
if not defined D if exist "%SRC%\PCSG00615\PSP2_GAME\USRDIR\resource.dat" set "D=%SRC%\PCSG00615\PSP2_GAME\USRDIR"
if not defined D if exist "%SRC%\resource.dat" set "D=%SRC%"
if not defined D goto notfound
echo Game files: "%D%"
if not exist "%OUT%\env" mkdir "%OUT%\env"
set fail=0
set total=0
set mism=0
for /f "usebackq tokens=1-3" %%a in ("%HERE%patches\checksums.txt") do call :one %%a %%b %%c
if %fail%==1 goto failed
echo.
echo Done. Now copy this folder (README.txt, last step):
echo   "%HERE%patched\PCSG00615"
echo   Vita3K:  into ux0\app\  (replace the files)
echo   PS Vita: into ux0:rePatch\
goto end

:one
rem Arguments: MD5 of the Japanese file, MD5 of the English file, path inside USRDIR.
set /a total+=1
set "name=%~3"
set "name=%name:/=\%"
if not exist "%D%\%name%" (echo MISSING  %name%& set fail=1& goto :eof)
set "file=%D%\%name%"
call :md5
if /i "%md5%"=="%~2" (echo ALREADY  %name% ^(already English, copied as is^)& copy /y "%D%\%name%" "%OUT%\%name%" >nul 2>&1& goto :eof)
if defined md5 if /i not "%md5%"=="%~1" (echo MISMATCH %name% ^(not the original Japanese file^)& set fail=1& set /a mism+=1& goto :eof)
"%XDELTA%" -d -f -s "%D%\%name%" "%HERE%patches\%name%.xdelta" "%OUT%\%name%"
if errorlevel 1 (echo BAD      %name%& set fail=1& goto :eof)
set "file=%OUT%\%name%"
call :md5
if defined md5 if /i not "%md5%"=="%~2" (echo BAD      %name%& set fail=1& goto :eof)
echo OK       %name%
goto :eof

:md5
rem Sets md5 to the MD5 of the path in variable file (line 2 of certutil's output), or leaves it
rem empty if certutil fails; then only xdelta3's own checksums guard the result. The path is not
rem passed as a call argument because call would expand percent signs in it a second time.
set "md5="
for /f "skip=1 delims=" %%h in ('certutil -hashfile "%file%" MD5 2^>nul') do if not defined md5 set "md5=%%h"
if defined md5 set "md5=%md5: =%"
if defined md5 if not "%md5:~32%"=="" set "md5="
if defined md5 if "%md5:~31%"=="" set "md5="
goto :eof

:failed
echo.
echo Some files could not be patched (see above, and "If something goes wrong" in README.txt).
if not %mism%==%total% goto end
echo None of the files is the original Japanese one. Copied from a PS Vita? Then they
echo are still encrypted: copy them with VitaShell's "Open decrypted" (README.txt, section C).
goto end

:notfound
echo resource.dat was not found in "%SRC%".
echo Use the PCSG00615 folder, its PSP2_GAME\USRDIR folder, or the folder with
echo your copies of resource.dat, first.dat and env.
goto end

:nozip
echo Some files next to apply.bat are missing. Extract the whole zip first,
echo then run apply.bat from the extracted folder.

:end
echo.
pause
