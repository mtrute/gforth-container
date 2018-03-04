Running gforth inside a container.

Example session 

```shell
$ docker run -ti mtrute/gforth-container
Gforth 0.7.9_20180103, Copyright (C) 1995-2016,2017 Free Software Foundation, Inc.
Gforth comes with ABSOLUTELY NO WARRANTY; for details type `license'
Type `help' for basic help
words 
disasm disline disass .... (lots of words)...
perform execute call noop  ok
bye 
$
```

Update the container by editing the version string in the Dockerfile and
re-run the build command with the matching version tag

```shell
$ export VERSION=0.7.9-20180103
$ docker build --force-rm -t gforth:${VERSION} .
```
