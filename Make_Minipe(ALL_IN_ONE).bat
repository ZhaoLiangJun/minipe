@echo off&& cd /d %~dp0
if exist winre.wim (
echo ����winre.wim��׼��������
set wimfile=winre.wim
goto start
) else (
echo û�з���winre.wim�����Դ�boot.wim������
goto checkwim
)

:start
set /a startS=%time:~6,2%
set /a startM=%time:~3,2%
echo %time%
for /f "delims=" %%i in (bin\win10x86_64.txt) do (
        echo %%i | find ".exe" >NUL && (
        bin\wimlib dir %wimfile% 1 | find "." | findstr /vil "%%i">>List.txt
        ) || (
        bin\wimlib dir %wimfile% 1 --path=windows\winsxs | find "." | findstr /vi "%%i">>List.txt
        )
)
echo.

echo ������ɾ����%wimfile%������ļ�����pe�����У�������΢�ȴ�������
if exist excel.txt del excel.txt /f /q
for /f "delims=" %%i in (List.txt) do echo delete --force --recursive "%%i">>excel.txt

if "%wimfile%" == "boot.wim" (
echo ��boot.wim������׼��ɾ����1����
%~dp0bin\wimlib delete %wimfile% 1 --check"

) else (
echo ��Winre.wim�����С���
)
bin\wimlib dir %wimfile% 1 --path=Windows\SysWOW64 | find ".exe" >NUL && (set FD=x64) || (set FD=x86)
bin\wimlib update %wimfile%<excel.txt>NUL
bin\wimlib update %wimfile%<%FD%\add2wim.txt>NUL
bin\wimlib optimize %wimfile%

set /a endS=%time:~6,2%
set /a endM=%time:~3,2%
echo %time%
set /a diffS_=%endS%-%startS%
set /a diffM_=%endM%-%startM%
echo cost:%diffM_% %diffS_%
echo.
del /q *.txt
set output=%date:~0,4%%date:~5,2%%date:~8,2%%time:~0,2%%time:~3,2%%wimfile%.
ren %wimfile% %output%
echo ��л���ĵȴ�������PE�Ѿ��������,%output%������������ͷ��pe��Ʒ��

echo.
PAUSE

:checkwim
if exist %~dp0boot.wim echo ����boot.wim��ֱ����������&&set wimfile=boot.wim&&goto:start
for /f %%i in ('dir /b %~dp0*.iso') do set iso=%%i
if "%iso%"=="" exit
echo û�з���boot.wim�����ڳ��Դ�iso�н�ѹ��boot.wim....
%~dp0bin\7z.exe e -o%~dp0 -aoa  %~dp0%iso% sources/boot.wim
set wimfile=boot.wim&&goto:start
