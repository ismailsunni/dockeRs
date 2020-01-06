FROM fedora:32

# Add image metadata
LABEL org.label-schema.name="MRO 3.5.3 on Fedora" \
	org.label-schema.description="Docker images of MRO 3.5.3 on Fedora" \ 
	maintainer="Ismail Sunni <imajimatika@gmail.com>"

RUN useradd docker

WORKDIR /home/docker

# Use major and minor vars to re-use them in non-interactive installation script
ENV MRO_VERSION_MAJOR 3
ENV MRO_VERSION_MINOR 5
ENV MRO_VERSION_BUGFIX 3
ENV MRO_VERSION $MRO_VERSION_MAJOR.$MRO_VERSION_MINOR.$MRO_VERSION_BUGFIX
ENV R_HOME=/opt/microsoft/ropen/$MRO_VERSION/lib64/R

## Donwload and install MRO & MKL, see https://mran.microsoft.com/download https://mran.blob.core.windows.net/install/mro/3.5.0/microsoft-r-open-3.5.0.tar.gz
# https://mran.blob.core.windows.net/install/mro/3.5.3/rhel/microsoft-r-open-3.5.3.tar.gz
RUN curl -LO -# https://mran.blob.core.windows.net/install/mro/${MRO_VERSION}/rhel/microsoft-r-open-3.5.3.tar.gz \
	&& tar -xzf microsoft-r-open-${MRO_VERSION}.tar.gz

RUN tar -xzf microsoft-r-open-${MRO_VERSION}.tar.gz
WORKDIR /home/docker/microsoft-r-open
RUN  ./install.sh -a -u

# Needed for this error: 
# /opt/microsoft/ropen/3.5.3/lib64/R/bin/exec/R: error while loading shared libraries: libtinfo.so.5: cannot open shared object file: No such file or directory
RUN dnf install -y ncurses-compat-libs

# Clean up downloaded files
WORKDIR /home/docker
RUN rm microsoft-r-open-*.tar.gz \
	&& rm -r microsoft-r-open

CMD ["/usr/bin/R", "--no-save"]
