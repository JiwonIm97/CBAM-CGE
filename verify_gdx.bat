@echo off
REM ===========================================================================
REM  verify_gdx.bat
REM  Compare refactored Essay1_CBAM output against the original "11. CBAM"
REM  output, symbol by symbol, using gdxdiff.
REM
REM  Place this file in the Essay1_CBAM folder and double-click, or run it
REM  from a command prompt opened in that folder.
REM
REM  Expected result:
REM    1_BASE, 2_CBAM_EU, 3_CBAM_RENEW, 5_CBAM_HH  -> SAME
REM    4_CBAM_LAB                                  -> DIFF  (bug fixes)
REM ===========================================================================

REM --- edit these three if your layout differs ------------------------------
set "GDXDIFF=C:\GAMS\40\gdxdiff.exe"
set "ORIG=C:\Users\HOME\Desktop\CBAM\Output_w-1"
set "NEW=C:\Users\HOME\Desktop\CBAM_refactor\Output_w-1"
set "EPS=1e-8"
REM --------------------------------------------------------------------------

if not exist "Verify" mkdir "Verify"
set "ANYDIFF=0"

echo.
echo ===========================================================================
echo  reference : %ORIG%
echo  candidate : %NEW%
echo  tolerance : RelEps=%EPS%
echo ===========================================================================

for %%S in (1_BASE 2_CBAM_EU 3_CBAM_RENEW 4_CBAM_LAB 5_CBAM_HH) do call :compare %%S

echo.
echo ===========================================================================
if "%ANYDIFF%"=="0" (
    echo  RESULT: every compared pair is identical.
) else (
    echo  RESULT: differences found - inspect Verify\diff_*.gdx
)
echo  Reminder: 4_CBAM_LAB is SUPPOSED to differ.
echo ===========================================================================
echo.
pause
goto :eof


REM ===========================================================================
:compare
set "S=%~1"
echo.
echo --- %S% ---

if not exist "%ORIG%\%S%.gdx" (
    echo     [SKIP] reference missing: %ORIG%\%S%.gdx
    goto :eof
)
if not exist "%NEW%\%S%.gdx" (
    echo     [SKIP] candidate missing: %NEW%\%S%.gdx
    goto :eof
)

"%GDXDIFF%" "%ORIG%\%S%.gdx" "%NEW%\%S%.gdx" "Verify\diff_%S%.gdx" RelEps=%EPS% Eps=%AEPS% > "Verify\log_%S%.txt" 2>&1

if errorlevel 1 (
    echo     [DIFF] Verify\diff_%S%.gdx   ^(log: Verify\log_%S%.txt^)
    set "ANYDIFF=1"
) else (
    echo     [SAME] no differences above tolerance
)
goto :eof
