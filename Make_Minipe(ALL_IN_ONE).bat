@echo off & pushd "%~dp0"
if exist winre.wim (
echo ����winre.wim��׼��������
set wimfile=winre.wim & goto :start
)

if exist boot.wim goto :boot_wim

for %%i in (*.iso) do (
echo û�з���winre.wim��boot.wim�����ڳ��Դ�iso�н�ѹ��boot.wim ......
bin\7z.exe e -o"%~dp0" -aoa "%%i" sources/boot.wim
if exist boot.wim goto :boot_wim
)
echo. & echo �Ҳ���winre.wim��boot.wim��ϵͳiso�κ�һ������������˳� ......
pause>nul & EXIT

:boot_wim
echo ����boot.wim��ֱ��������׼��ɾ����1 ......
bin\wimlib delete boot.wim 1 --check
set wimfile=boot.wim

:start
echo. & echo ��ʼʱ�䣺%time% & set startT=%time%
if exist excel.txt del excel.txt /f /q
for /f "delims=" %%i in (bin\Win10x86_64.txt) do (
        echo %%i | find ".exe" >NUL && (
        for /f "delims=" %%a in ('bin\wimlib dir %wimfile% 1 ^| find "." ^| findstr /vil "%%i"') do echo delete --force --recursive "%%a">>excel.txt
        ) || (
        for /f "delims=" %%a in ('bin\wimlib dir %wimfile% 1 --path=windows\winsxs ^| find "." ^| findstr /vi "%%i"') do echo delete --force --recursive "%%a">>excel.txt
        )
)
echo. & echo ������ɾ����%wimfile%������ļ�����PE�����У�������΢�ȴ� ...... & echo.
bin\wimlib dir %wimfile% 1 --path=Windows\SysWOW64 | find ".exe" >NUL && (set FD=x64) || (set FD=x86)
bin\wimlib update %wimfile%<excel.txt>NUL
bin\wimlib update %wimfile%<%FD%\add2wim.txt>NUL
bin\wimlib optimize %wimfile%
set endT=%time%
set /a costM=3%endT:~3,2%-3%startT:~3,2%
if %costM% lss 0 set /a costM=%costM%+60
set /a costT=3%endT:~9,2%-3%startT:~9,2%+(3%endT:~6,2%-3%startT:~6,2%+%costM%*60)*100
echo. & echo ����ʱ�䣺%endT%   ��ʱ��%costT:~0,-2%.%costT:~-2% ��
del /f /q *.txt
set output=%date:~0,4%%date:~5,2%%date:~8,2%%time:~0,2%%time:~3,2%%wimfile%
ren %wimfile% "%output%"
echo. & echo ��л���ĵȴ�������PE�Ѿ�������ɣ�%output%������������ͷ��pe��Ʒ�� & echo.
pause
EXIT
