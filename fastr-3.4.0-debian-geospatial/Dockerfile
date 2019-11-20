FROM nuest/fastr:R-3.4.0

# Add image metadata
LABEL org.label-schema.name="FastR 3.4.0 on Debian with Geospatial R Packages" \
	org.label-schema.description="Docker images of FastR 3.4.0 on Debian with Geospatial R Packages" \ 
	maintainer="Ismail Sunni <imajimatika@gmail.com>"

ENV DEBIAN_FRONTEND=noninteractive

# Install dependecies
RUN apt-get update \
  && apt-get install -y --no-install-recommends \
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

# # Missing dep
# RUN apt-get update \
#   && apt-get install -y --no-install-recommends \
#     gfortran \
#     # to download files
#     wget

# # Used for installing polyclip. See: https://github.com/ismailsunni/dockeRs/issues/32
# RUN R -e "install.packages('devtools');"
# # Install polyclip
# RUN wget https://cran.r-project.org/src/contrib/polyclip_1.10-0.tar.gz
# RUN tar -zxvf polyclip_1.10-0.tar.gz
# RUN Rscript -e "library('devtools'); devtools::install('polyclip')"
# RUN rm polyclip_1.10-0.tar.gz \
#   && rm -r polyclip

# # Temporary remove EULA to avoid problem when installing package.
# # See: https://github.com/ismailsunni/dockeRs/issues/33
# RUN mv MRO_EULA.txt MRO_EULA.txt.temp \
#   && mv MKL_EULA.txt MKL_EULA.txt.temp \
#   && touch MRO_EULA.txt \
#   && touch MKL_EULA.txt

# Install CTV, and install Spatial and SpatioTemporal packages.
RUN mx --dynamicimports graal/compiler R -e "install.packages('ctv');"
# RUN mx --dynamicimports graal/compiler R -e "library('ctv'); install.views('Spatial');"
# RUN mx --dynamicimports graal/compiler R -e "install.packages('ctv');"
# RUN R -e "library('ctv'); install.views('Spatial');"
# RUN R -e "library('ctv'); install.views('SpatioTemporal');"

# # Return the EULA files
# RUN mv MRO_EULA.txt.temp MRO_EULA.txt \
#   && mv MKL_EULA.txt.temp MKL_EULA.txt

# WORKDIR /home/docker
WORKDIR $FASTR_HOME

# Copy needed scripts
COPY scripts/check_packages.R scripts/spatial_packages.txt scripts/spatiotemporal_packages.txt ./

ENTRYPOINT []
# ENTRYPOINT [ "mx", "--dynamicimports", "graal/compiler", "R" ]
CMD [ "mx", "--dynamicimports", "graal/compiler", "R", "--no-save"]
