Proxy My Proxy
==============

**The Problem:** you need to do development with comandline tools and you're behind a [NTLM password protected proxy][1]. Generally, you would have to use a proxy env var that shows your password in clear text.  For example http_proxy=http://user:password@proxyIP:proxyPort/

**The Solution:** use a tool called [cNTLM][2] which connects to the company's NTLM proxy using a secure hash and runs as local password-less proxy your cli tools can connect to. This project adds some helpers to make it easier to install and configure cntlm.

**Limitations:** currently only for Mac OS X or Windows workstations. For Windows Instructions see this [README][4]

Prerequistes for Mac:
---------------------

 * Install [homebrew][3]

Usage
-----

```sh
proxymyproxy.sh example.proxy.io:3128
```

I don't background the proxy so I can see the logs on standard out.  I run it in a separate terminal but you could also redirect the logs to a file and background the whole command.

For example:
```sh
proxymyproxy.sh example.proxy.io:3128 > pmp.log &
```

[1]: https://en.wikipedia.org/wiki/NT_LAN_Manager "NTLM"
[2]: http://cntlm.sourceforge.net/ "cNTLM"
[3]: https://brew.sh/ "OS X Homebrew"
[4]: windows/cntlm/README.md "Windows Instructions"
