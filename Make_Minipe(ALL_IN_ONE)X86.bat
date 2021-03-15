@echo off&& cd /d %~dp0
if exist winre.wim (
echo 发现winre.wim！准备制作！
set wimfile=winre.wim
goto start
) else (
echo 没有发现winre.wim！尝试从boot.wim制作！
goto checkwim
)

:start
set /a startS=%time:~6,2%
set /a startM=%time:~3,2%
echo %time%
%~dp0bin\wimlib dir %wimfile% 1 | find ".">1List.TXT
%~dp0bin\wimlib dir %wimfile% 1 --path=windows\winsxs | find ".">winsxsList.TXT
findstr /vil "wsock32.dll ncryptprov.dll mode.com simsun.ttc ping.exe wpeinit.exe SortDefault 3ware.inf halmacpi.dll acpi.inf acpidev.inf acpipagr.inf acpitime.inf adp80xx.inf amdgpio2.inf amdi2c.inf amdsata.inf amdsbs.inf arcsas.inf basicdisplay.inf basicrender.inf battery.inf buttonconverter.inf c_apo.inf c_avc.inf c_battery.inf c_biometric.inf c_cdrom.inf c_computeaccelerator.inf c_computer.inf c_diskdrive.inf c_display.inf c_extension.inf c_firmware.inf c_hdc.inf c_hidclass.inf c_image.inf c_keyboard.inf c_legacydriver.inf c_mcx.inf c_media.inf c_mediumchanger.inf c_memory.inf c_modem.inf c_monitor.inf c_mouse.inf c_mtd.inf c_multifunction.inf c_multiportserial.inf c_net.inf c_netdriver.inf c_netservice.inf c_nettrans.inf c_ports.inf c_processor.inf c_proximity.inf c_sbp2.inf c_scmdisk.inf c_scmvolume.inf c_scsiadapter.inf c_sdhost.inf c_smartcard.inf c_smartcardfilter.inf c_smartcardreader.inf c_smrdisk.inf c_smrvolume.inf c_sslaccel.inf c_swcomponent.inf c_swdevice.inf c_system.inf c_ucm.inf c_unknown.inf c_usb.inf c_usbdevice.inf c_usbfn.inf c_volsnap.inf c_volume.inf c_wceusbs.inf dc21x4vm.inf disk.inf dwup.inf e2xw10x64.inf ehstortcgdrv.inf errata.inf errdev.inf genericusbfn.inf hal.inf halextintclpiodma.inf halextpl080.inf hdaudbus.inf hdaudio.inf hdaudss.inf hidbatt.inf hiddigi.inf hidi2c.inf hidinterrupt.inf hidserv.inf hidspi_km.inf hidvhf.inf hpsamd.inf iagpio.inf iai2c.inf iaLPSS2i_GPIO2_BXT_P.inf iaLPSS2i_GPIO2_CNL.inf iaLPSS2i_GPIO2_GLK.inf iaLPSS2i_GPIO2_SKL.inf iaLPSS2i_I2C_BXT_P.inf iaLPSS2i_I2C_CNL.inf iaLPSS2i_I2C_GLK.inf iaLPSS2i_I2C_SKL.inf ialpssi_gpio.inf ialpssi_i2c.inf iastorav.inf iastorv.inf input.inf ipmidrv.inf ipoib6x.inf iscsi.inf ItSas35i.inf kdnic.inf keyboard.inf lltdio.inf lsi_sas.inf lsi_sas2i.inf lsi_sas3i.inf lsi_sss.inf machine.inf mausbhost.inf mchgr.inf megasas.inf megasas2i.inf megasas35i.inf megasr.inf mf.inf mlx4_bus.inf mshdc.inf msmouse.inf msports.inf mssmbios.inf mtconfig.inf mvumis.inf ndisimplatform.inf ndisimplatformmp.inf ndisuio.inf ndisvirtualbus.inf net1ix64.inf net1yx64.inf net40i68.inf net44amd.inf net7400-x64-n650.inf net7500-x64-n650f.inf net7800-x64-n650f.inf net9500-x64-n650f.inf netax88179_178a.inf netax88772.inf nete1e3e.inf nete1g3e.inf netefe3e.inf netg664.inf netimm.inf netip6.inf netjme.inf netk57a.inf netl160a.inf netl1e64.inf netl260a.inf netloop.inf netmscli.inf netmyk64.inf netnb.inf netnvma.inf netnwifi.inf netrasa.inf netrass.inf netrast.inf netrtl64.inf netserv.inf netsstpa.inf nett4x64.inf nettcpip.inf netvf63a.inf netvg63a.inf netxex64.inf netxix64.inf npsvctrig.inf nvdimm.inf nvraid.inf pci.inf percsas2i.inf percsas3i.inf pmem.inf puwk.inf qd3x64.inf ramdisk.inf rawsilo.inf rdshup.inf rspndr.inf rt640x64.inf rtux64w10.inf sbp2.inf sceregvl.inf scmbus.inf scmvolume.inf scsidev.inf sdbus.inf sdstor.inf secrecs.inf sisraid2.inf sisraid4.inf SmartSAMD.inf smrdisk.inf smrvolume.inf spaceport.inf stexstor.inf stornvme.inf storufs.inf swenum.inf uaspstor.inf uefi.inf ufxchipidea.inf ufxsynopsys.inf umbus.inf umpass.inf unknown.inf usb.inf usbhub3.inf usbnet.inf usbport.inf usbser.inf usbstor.inf usbxhci.inf vdrvroot.inf vhdmp.inf virtdisk.inf volmgr.inf volsnap.inf volume.inf vsmraid.inf vstxraid.inf wdmaudiocoresystem.inf wdmvsc.inf whyperkbd.inf wmiacpi.inf wnetvsc.inf wstorflt.inf wstorvsc.inf wvmbus.inf wvmbushid.inf wvmbusvideo.inf ykinx64.inf L2Schemas aero.msstyles regedit aclui.dll advapi32.dll aepic.dll apisetschema.dll asycfilt.dll atl.dll authz.dll basesrv.dll bcd.dll bcdboot.exe bcdedit.exe bcryptprimitives.dll BFE.DLL BOOTVID.DLL BrokerLib.dll cabinet.dll cdd.dll cfgmgr32.dll ci.dll clb.dll cmd.exe cmdext.dll combase.dll comdlg32.dll coml2.dll conhost.exe console.dll credui.dll cryptbase.dll cryptdll.dll cryptsp.dll bcrypt.dll crypt32.dll cryptsvc.dll msxml ncrypt.dll rasapi32.dll wldp.dll csrsrv.dll csrss.exe C_1252.NLS C_437.NLS C_936.NLS d2d1.dll d3d11.dll dab.dll dabapi.dll dbgcore.dll dbghelp.dll devobj.dll devrtl.dll dhcpcore.dll dhcpcore6.dll dhcpcsvc.dll dhcpcsvc6.dll diskpart.exe dllhost.exe dnsapi.dll dnsrslvr.dll dpapi.dll dpapisrv.dll drvinst.exe drvload.exe drvsetup.dll drvstore.dll dsparse.dll dsrole.dll dui70.dll duser.dll dwmapi.dll DWrite.dll dxgi.dll eappprxy.dll EventAggregation.dll feclient.dll find.exe findstr.exe FirewallAPI.dll fltLib.dll fmifs.dll fontdrvhost.exe format.com fsutil.exe fsutilext.dll fveapi.dll fwbase.dll fwpolicyiomgr.dll FWPUCLNT.DLL gdi32.dll gdi32full.dll gpapi.dll hal.dll hhsetup.dll iertutil.dll ifsutil.dll IKEEXT.DLL imagehlp.dll imageres.dll imapi2.dll imm32.dll ipconfig.exe IPHLPAPI.DLL joinutil.dll KBDUS.DLL kd.dll KerbClientShared.dll kerberos.dll kernel.appcore.dll kernel32.dll KernelBase.dll keyiso.dll ksuser.dll ktmw32.dll l2nacp.dll linkinfo.dll lmhsvc.dll locale.nls logoncli.dll lsasrv.dll lsass.exe lsm.dll l_intl.nls mfc42u.dll mpr.dll MPSSVC.dll msasn1.dll msctf.dll msftedit.dll msimg32.dll msports.dll msprivs.dll msv1_0.dll msvcp110_win.dll msvcp_win.dll msvcrt.dll mswsock.dll ncsi.dll net.exe net1.exe netapi32.dll netbios.dll netcfgx.dll netjoin.dll netlogon.dll netmsg.dll netprovfw.dll NetSetupApi.dll NetSetupEngine.dll NetSetupSvc.dll netshell.dll netutils.dll newdev.dll ninput.dll nlaapi.dll nlasvc.dll normaliz.dll notepad.exe nrpsrv.dll nsi.dll nsisvc.dll ntasn1.dll ntdll.dll ntdsapi.dll ntlanman.dll NtlmShared.dll ntmarta.dll ntoskrnl.exe ole32.dll oleacc.dll oleaccrc.dll oleaut32.dll oledlg.dll OneCoreCommonProxyStub.dll onex.dll osuninst.dll powrprof.dll profapi.dll propsys.dll psapi.dll PSHED.DLL rasadhlp.dll rasman.dll reg.exe regsvr32.exe RpcEpMap.dll rpcrt4.dll RpcRtRemote.dll rpcss.dll rsaenh.dll rundll32.exe samcli.dll samsrv.dll schannel.dll schema.dat sechost.dll secur32.dll services.exe setupapi.dll SHCore.dll shell32.dll shlwapi.dll shutdownux.dll slc.dll SmiEngine.dll smss.exe spfileq.dll spinf.dll sppc.dll srvcli.dll srvsvc.dll sscore.dll sspicli.dll sspisrv.dll stdole2.tlb Storprop.dll svchost.exe sxs.dll sxssrv.dll sysclass.dll sysntfy.dll SystemEventsBrokerServer.dll takeown.exe taskmgr.exe TextShaping.dll ucrtbase.dll uexfat.dll ufat.dll ulib.dll umpdc.dll umpnpmgr.dll umpo.dll unattend.dll untfs.dll urlmon.dll user32.dll userenv.dll usp10.dll UXInit.dll uxtheme.dll vds.exe vdsbas.dll vdsdyn.dll vdsldr.exe vdsutil.dll vdsvd.dll vds_ps.dll version.dll virtdisk.dll webio.dll wevtapi.dll wevtsvc.dll wimgapi.dll wimserv.exe win32k.sys win32kbase.sys win32kfull.sys win32u.dll winbrand.dll Windows.FileExplorer.Common.dll windows.storage.dll CatRoot 2\drivers DriverStore WindowsCodecs.dll winhttp.dll wininet.dll wininit.exe wininitext.dll winlogon.exe winmm.dll winmmbase.dll winnlsres.dll winnsi.dll winpeshl winspool.drv winsrv.dll winsrvext.dll winsta.dll wintrust.dll WinTypes.dll wkscli.dll wkssvc.dll wlanapi.dll wlanhlp.dll wlanmsm.dll wlansec.dll wlansvc.dll wlanutil.dll Wldap32.dll wmiclnt.dll wpeutil ws2_32.dll wshhyperv.dll wsock32.dll wtsapi32.dll xcopy.exe xmllite.dll winload driver.stl winsxs" 1list.txt>2list.txt
findstr /v ".*_microsoft.windows.c..-controls.resources_.*_zh-cn .*_microsoft.windows.common-controls .*_microsoft.windows.gdiplus_.*_none Manifests.*_microsoft.windows.i..utomation.proxystub Manifests.*_microsoft.windows.isolationautomation Manifests.*_microsoft.windows.systemcompatible" winsxsList.TXT>>2list.txt

echo.
echo 正在增删削减%wimfile%包里的文件制作pe过程中，请您稍微等待。。。
if exist excel.txt del excel.txt /f /q
for /f "delims=" %%i in (2list.txt) do (
        echo delete --force --recursive "%%i">>excel.txt
    )
if "%wimfile%" == "boot.wim" (
echo 从boot.wim制作，准备删除卷1……
%~dp0bin\wimlib delete %wimfile% 1 --check"

) else (
echo 从Winre.wim制作中……
)
%~dp0bin\wimlib update %wimfile%<excel.txt>NUL
%~dp0bin\wimlib update %wimfile%<x86\add2wim.txt>NUL
%~dp0bin\wimlib optimize %wimfile%

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
echo 感谢您的等待，现在PE已经制作完成,%output%就是你的网络骨头版pe成品！

echo.
PAUSE

:checkwim
if exist %~dp0boot.wim echo 发现boot.wim，直接制作……&&set wimfile=boot.wim&&goto:start
for /f %%i in ('dir /b %~dp0*.iso') do set iso=%%i
if "%iso%"=="" exit
echo 没有发现boot.wim，正在尝试从iso中解压出boot.wim....
%~dp0bin\7z.exe e -o%~dp0 -aoa  %~dp0%iso% sources/boot.wim
set wimfile=boot.wim&&goto:start
