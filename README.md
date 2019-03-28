Proxy My Proxy
==============

When you are behind a password protected proxy and you need to try to do development, this can make a local proxy that appears to be passwordless to your development tools.

Currently only setup to work on a Mac with homebrew installed.

Usage
-----

```sh
proxymyproxy.sh example.proxy.io:3128
```

I don't background the proxy so I can see the logs on standard out.  I run it in a separate terminal but you could also redirect the logs to a file and background the whole command.


```sh
proxymyproxy.sh example.proxy.io:3128 > pmp.log &
```
