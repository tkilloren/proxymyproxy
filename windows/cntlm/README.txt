Proxy My Proxy: Windows Edition
===============================

On Windows it's nice to have a passwordless proxy running before any Unix emulation kicks in so I rewrote this to work with a self-contained cNTLM and a batch file instead of shell. The majority of the contents of this directory are from the [cNTLM 0.92.3 win32 zip file] and proxymyproxy.bat is the only original content.

Setup
-----

Edit the proxymyproxy.bat file.  Change the 'SET proxyaddr=' line to match your company's NLTM proxy address.

Usage
-----

Browse to the window/cntlm directory in File Explorer and click on the proxymyproxy.bat.  If it's the first time you've run it, it will prompt you for your Windows password and generate a cNTLMconfiguration file.  Whenever you change your Windows system password delete the cNTLM, and the batch file will prompt you for your new password and create a new config file with a working hash.


[1]:https://sourceforge.net/projects/cntlm/files/cntlm/cntlm%200.92.3/cntlm-0.92.3-win32.zip/download "cNTLM zip"
