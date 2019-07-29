@echo off
title Proxy My Proxy
::=============================================
:: Proxy My Proxy
::
:: A helper batch file to make it easier to
:: launch cNTLM on a Windows system.  It assumes
:: your company's proxy has NTLM2 authentication.
::
:: Delete cntlm.cfg to trigger the script to
:: re-prompt you for your password.
::
::=============================================

::
:: Edit proxyaddr to match your company's NTLM proxy
::   Format: <ip>:<port>
::   Example: 10.10.10.10:80
::
SET proxyaddr=10.10.10.10:80

:: See http://cygwin.com/cygwin-ug-net/using-cygwinenv.html
SET CYGWIN=nodosfilewarning

:: If you need to change the name of cntlm's config file do so here
SET cfgfile=cntlm.cfg

::
:: Delete cntlm.cfg and you will be prompted to change your password
::
IF EXIST %cfgfile% GOTO run_cntlm

::
:: Create Authenication Hash for company's NTLM proxy
::
ECHO Enter your windows password:
FOR /f "tokens=*" %%i in ('.\cntlm -u %USERNAME%@%USERDOMAIN% -H') DO SET hash=%%i

::
:: Create cNTLM configuration file
::
ECHO Creating configuration file...

ECHO # >%cfgfile%
ECHO # cNTLM Proxy Configuration >>%cfgfile%
ECHO # >>%cfgfile%
ECHO[  >>%cfgfile%
ECHO Username	%USERNAME% >>%cfgfile%
ECHO Domain	%USERDOMAIN% >>%cfgfile%
ECHO %hash% >>%cfgfile%
ECHO[  >>%cfgfile%
ECHO Proxy	%proxyaddr% >>%cfgfile%
ECHO NoProxy	localhost, 127.0.0.*, 10.*, 192.168.* >>%cfgfile%
ECHO[  >>%cfgfile%
ECHO Listen		3128 >>%cfgfile%

::
:: Run the local proxy in the foreground
::
:run_cntlm
ECHO Running cNTLM in foreground...
.\cntlm -v -f -g -c .\cntlm.cfg

:: Pause so we can read any exit errors
PAUSE

GOTO:eof
