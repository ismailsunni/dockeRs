# TERR 5.0.0 on Ubuntu with Geospatial packages

You can build it manually using this command from the current directory:

`make build-dockeRs`

Or run R from the docker image

`make run-dockeRs`

Or run package completeness

`make check-dockeRs`

## Uninstalled packages

### Spatial Packages

TBA

### Spatiotemporal Packages

TBA

## Problem

### `rJava` Error

Can not install `rJava` since I can't run `R CMD javareconf` because there is no `javareconf` on TERR.

### Reinstall Existing Packages (probably)

For example, I tried to re-install `sp`. I got this error:

```R
> install.packages('sp')
Trying to download URL 'https://cloud.r-project.org/src/contrib/sp_1.3-2.tar.gz' to file '/tmp/TERR_00156b8b45671/downloaded_packages/sp_1.3-2.tar.gz'
  Downloaded 1132347 bytes
* unpacking *source* package sp from "/tmp/TERR_00156b8b45671/downloaded_packages/sp_1.3-2.tar.gz" to "/tmp/TERR_00156b8b45671/source_001574b0dc515"
* checking MD5 checksums
    MD5 checksums ok
* installing *source* package from "/tmp/TERR_00156b8b45671/source_001574b0dc515/sp" to "/home/docker/tibco/site-library"
Error in source2binary(dir, install_opts = install_opts) : Cannot rename old binaryDir from '/home/docker/tibco/site-library/sp' to '/home/docker/tibco/site-library/00LOCK--sp'
    Cannot install package from /tmp/TERR_00156b8b45671/source_001574b0dc515/sp
```

This error can be avoided by using `ctv`'s command : `update.views()`. But not sure how to fix the problem.

#### Running Bookdown Error

I tried to compile the book using `make book`, but I got this error

```bash
root@0d81cdcfeb5c:/home/docker/sdsr# make book
./_build.sh


processing file: sds.Rmd

   inline R code fragments


label: unnamed-chunk-1 (with options) 
list[1:2]:
 $include: logi FALSE
 $cache: logi FALSE


  ordinary text without R code


label: unnamed-chunk-2 (with options) 
list:
 $echo: logi FALSE

Warning messages:
1: In grDevices::png(f) : this function not yet implemented
2: In grDevices::dev.off() : this function not yet implemented
3: In function(...) : this function not yet implemented
4: In dev.control(displaylist = if(record) "enable" else "inhib... : this function not yet implemented
5: In dev.cur() : this function not yet implemented
6: In dev.cur() : this function not yet implemented
7: In dev.cur() : this function not yet implemented
8: In dev.cur() : this function not yet implemented
9: In dev.cur() : this function not yet implemented
10: In dev.cur() : this function not yet implemented
11: In dev.cur() : this function not yet implemented
12: In dev.cur() : this function not yet implemented
13: In dev.cur() : this function not yet implemented
14: In dev.cur() : this function not yet implemented
15: In dev.cur() : this function not yet implemented
16: In dev.cur() : this function not yet implemented
17: In dev.cur() : this function not yet implemented
18: In dev.cur() : this function not yet implemented
19: In dev.off(dv) : this function not yet implemented
20: In function(...) : this function not yet implemented
21: In dev.control(displaylist = if(record) "enable" else "inhib... : this function not yet implemented
22: In dev.cur() : this function not yet implemented
23: In dev.cur() : this function not yet implemented
Quitting from lines 34-53 (sds.Rmd) 

Error in FUN(X[[i]]) : unused argument(s)

Execution halted
makefile:2: recipe for target 'book' failed
make: *** [book] Error 1

```
