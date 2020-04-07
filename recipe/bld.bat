rem Not using the downloaded sources while debugging
rem cd C:\Users\cwp\tmp\cdf

nmake.exe /nologo /f Windows.mak build

if %ERRORLEVEL% NEQ 0 (
	EXIT /B 2
)

nmake.exe /nologo /f Windows.mak install

if %ERRORLEVEL% NEQ 0 (
	EXIT /B 4
)
