# FastR on Fedora

You can build it manually using this command from the directory of this file:

```bash
make build-dockeRs
```

Or run R from the docker image

```bash
make run-dockeRs
```

## Problems

Building the docker image always gets stuck on installing the R. I investigate, it is caused by stuck on downloading jar file from github (i.e [FastR](https://github.com/oracle/fastr/releases/download/vm-19.3.0/r-installable-java8-linux-amd64-19.3.0.jar) and [LLVM Toolchain](https://github.com/graalvm/graalvm-ce-builds/releases/download/vm-19.3.0/llvm-toolchain-installable-java8-linux-amd64-19.3.0.jar)).

Using my network, is stuck. Using my friend network, it works fine.

In the end, I build using docker hub.
