FROM ismailsunni/fastr-3.6.1-debian

# Add image metadata
LABEL org.label-schema.name="FastR 3.6.1 on Debian with Geospatial Packages" \
	org.label-schema.description="FastR 3.6.1 on Debian with Geospatial Packages" \ 
	maintainer="Ismail Sunni <imajimatika@gmail.com>"

ENV DEBIAN_FRONTEND=noninteractive

# Install dependecies
RUN apt-get update && apt-get install -y --no-install-recommends \
    bwidget \  
    cargo \  
    ffmpeg \  
    gdal-bin \  
    git-core \  
    imagemagick \  
    jags \  
    # changed with ffmpeg
    # libav-tools \
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
    # swftools \  
    unixodbc-dev \  
    zlib1g-dev

# Install CTV, and install Spatial and SpatioTemporal packages.
RUN R -e "install.packages('ctv');"
RUN R -e "library('ctv'); install.views('Spatial', coreOnly=TRUE);"
# Used for installing polyclip. See: https://github.com/ismailsunni/dockeRs/issues/32
RUN R -e "install.packages('devtools');"
# Install polyclip
RUN wget https://cran.r-project.org/src/contrib/polyclip_1.10-0.tar.gz
RUN tar -zxvf polyclip_1.10-0.tar.gz
RUN Rscript -e "library('devtools'); devtools::install('polyclip')"
RUN rm polyclip_1.10-0.tar.gz \
  && rm -r polyclip

# RUN R -e "library('ctv'); install.views('SpatioTemporal', coreOnly=TRUE);"

COPY scripts/* ./

CMD ["R", "--no-save"]
