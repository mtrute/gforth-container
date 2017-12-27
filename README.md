Running gforth inside a container.

Based on the most recent builds from net2o.de

Example session 

```shell
$ docker run -ti mtrute/gforth-container
Gforth 0.7.9_20171206, Copyright (C) 1995-2016 Free Software Foundation, Inc.
Gforth comes with ABSOLUTELY NO WARRANTY; for details type `license'
Type `help' for basic help
words 
disasm disline disass .... (lots of words)...
perform execute call noop  ok
bye 
$
```
