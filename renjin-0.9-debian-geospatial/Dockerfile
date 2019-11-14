FROM nuest/renjin:0.9

# Add image metadata
LABEL org.label-schema.name="Renjin 0.9 on Debian with R Geospatial Packages" \
	org.label-schema.description="Docker images of Renjin 0.9 on Debian with R Geospatial Packages" \ 
	maintainer="Ismail Sunni <imajimatika@gmail.com>"

ENV DEBIAN_FRONTEND=noninteractive

# Install dependencies
RUN apt-key adv --keyserver keyserver.ubuntu.com --recv-keys AA8E81B4331F7F50
RUN apt-get update \
  && apt-get install -y --no-install-recommends \
    bwidget \  
    cargo \  
    ffmpeg \  
    gdal-bin \  
    git-core \  
    imagemagick \  
    jags \  
    # libav-tools \  changed with ffmpeg
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

# Install R packages

WORKDIR /home/docker

# Copy needed scripts
COPY scripts/check_packages.R scripts/spatial_packages.txt scripts/spatiotemporal_packages.txt ./

CMD ["renjin"]
