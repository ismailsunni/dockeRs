# TERR 5.0.0 on Debian

To build manually, you need TERR 5.0.0 installation files (can be downloaded from the TERR website). I modify the installation script, to remove user input (for easier docker script). Put the whole TERR_Developer_5.0.0_linux24gl23_x86_64 directory in the root directory.

After that you can build it manually using this command from the current directory:

`make build-dockeRs`

Or run R from the docker image

`make run-dockeRs`
