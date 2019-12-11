FROM nuest/pqr:2019-02-19

# Add image metadata
LABEL org.label-schema.name="pqR 2019-02-19 on Debian with Geospatial Packages" \
	org.label-schema.description="pqR 2019-02-19 on Debian with Geospatial Packages" \ 
	maintainer="Ismail Sunni <imajimatika@gmail.com>"

## (Based on https://github.com/rocker-org/rocker/blob/master/r-base/Dockerfile)
## Set a default user. Available via runtime flag `--user docker`
## Add user to 'staff' group, granting them write privileges to /usr/local/lib/R/site.library
## User should also have & own a home directory (e.g. for linked volumes to work properly).
RUN useradd docker \
	&& mkdir /home/docker \
	&& chown docker:docker /home/docker \
	&& addgroup docker staff
RUN echo "en_US.UTF-8 UTF-8" >> /etc/locale.gen \
	&& apt-get update && apt-get install -y locales \
	&& locale-gen en_US.utf8 \
	&& /usr/sbin/update-locale LANG=en_US.UTF-8
ENV LC_ALL en_US.UTF-8
ENV LANG en_US.UTF-8

# Install dependency
RUN apt-get install -y --no-install-recommends \
    bwidget \
    cargo \
    ffmpeg \
    gdal-bin \
    git-core \
    imagemagick \
    jags \
    libav-tools \
    libcairo2-dev \
    libcurl4-openssl-dev \
    libfftw3-dev \
    libgdal-dev \
    libgeos-dev libgeos++-dev \
    libgl1-mesa-dev \
    libglu1-mesa-dev \
    libgmp-dev \
    libgsl-dev \
    libhdf5-dev \
    libimage-exiftool-perl \
    libjq-dev \
    libmagic-dev \
    libmagick++-dev \
    libnetcdf-dev \
    libomp-dev \
    libopenmpi-dev \
    libpng-dev \
    libpq-dev \
    libproj-dev \
    libprotobuf-dev \
    libssh2-1-dev \
    libssl-dev \
    libtiff-dev \
    libudunits2-dev \
    libv8-dev \
    libxml2-dev \
    make \
    # openjdk-7-jre-headless \
    pandoc pandoc-citeproc \
    protobuf-compiler libprotoc-dev \
    python-minimal \
    qgis \
    saga \
    swftools \
    unixodbc-dev \
    zlib1g-dev

# CTV can be installed but not usable here.

WORKDIR /home/docker

# Copy needed scripts
COPY scripts/check_packages.R scripts/spatial_packages.txt scripts/spatiotemporal_packages.txt ./

# Install spatial packages from the list
RUN R -e "install.packages(readLines('./spatial_packages.txt')[0:100])"
RUN R -e "install.packages(readLines('./spatial_packages.txt')[101:194])"
RUN R -e "install.packages(readLines('./spatiotemporal_packages.txt'))"

RUN R -e "install.packages('spDataLarge', repos = 'https://nowosad.github.io/drat/', type = 'source')"
RUN R -e "install.packages('rnaturalearthdata')"

# For knitting the book.
RUN R -e "install.packages('bookdown')"

CMD ["/usr/bin/R", "--no-save"]
