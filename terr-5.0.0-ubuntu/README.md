# TERR 5.0.0 on Ubuntu

To build this image, you need TIBCO Enterprise Runtime for R (TERR) 5.0.0 for Linux installation files (can be [downloaded from the TERR website](https://community.tibco.com/wiki/tibco-enterprise-runtime-r-terr)). I modified the installation script, to remove user input for a non-interactive installation in the Dockerfile. Note that users must already accept the EULA when they want to download the software.

Unpack the downloaded file and put the contents of the directory _except the file `INSTALL`_ in the directory  `TERR_Developer_5.0.0_linux24gl23_x86_64` next to this file.

After that you can build it manually using this command from the directory of this file:

```bash
make build-dockeRs
```

Or run R from the docker image

```bash
make run-dockeRs
```
