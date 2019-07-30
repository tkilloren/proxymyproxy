Proxy My Proxy: Windows Edition
===============================

On Windows it's nice to have a passwordless proxy running before any Unix emulation kicks in so I rewrote this to work with a self-contained cNTLM and a batch file instead of shell. The majority of the contents of this directory are from the [cNTLM 0.92.3 win32 zip file][1] and proxymyproxy.bat is the only original content.

Setup
-----

Edit the proxymyproxy.bat file.  Change the 'SET proxyaddr=' line to match your company's NLTM proxy address.

If you would like it to run on startup automatically:

1.  Right click on <code>windows/cntlm/proxymyproxy.bat</code> and select 'Create shortcut'
2.  Right click on <code>windows/cntlm/proxymyproxy.bat - Shortcut</code> and select 'Cut'
3.  Press the Windows-key and type <code>run</code> to open 'Run Desktop App'
4.  Type <code>shell:startup</code> in the 'Open:' field and click the 'OK' button to open the startup folder
5.  Click on the 'Home' tab in the top row and click on the 'Paste' icon in the toolbar that appears.


Usage
-----

Browse to the window/cntlm directory in File Explorer and click on the proxymyproxy.bat.  If it's the first time you've run it, it will prompt you for your Windows password and generate a cNTLM configuration file.

Whenever you change your Windows system password delete the cNTLM, and the batch file will prompt you for your new password and create a new config file with a working hash.


[1]:https://sourceforge.net/projects/cntlm/files/cntlm/cntlm%200.92.3/cntlm-0.92.3-win32.zip/download "cNTLM zip"
