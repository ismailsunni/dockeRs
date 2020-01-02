FROM ismailsunni/terr-5.0.0-ubuntu

# Add image metadata
LABEL org.label-schema.name="TERR 5.0.0 on Ubuntu with Geospatial Packages" \
	org.label-schema.description="TERR 5.0.0 on Ubuntu with Geospatial Packages" \ 
	maintainer="Ismail Sunni <imajimatika@gmail.com>"

# Disable interactive, e.g. Configuring tzdata
ENV DEBIAN_FRONTEND=noninteractive 

# TODO: Install dependency
RUN apt update -y && apt install -y --no-install-recommends \
	bwidget \
	cargo \
	ffmpeg \
	gdal-bin \
	git-core \
	imagemagick \
	jags \
	# libav-tools \ replace by ffmpeg
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

COPY scripts/* ./

RUN apt install -y r-base-dev
RUN R -e "install.packages('rinclude'); install.packages('backports');"

RUN R -e "install.packages('ctv', repos='https://cloud.r-project.org');"
RUN R -e "library('ctv'); install.views('Spatial', repos='https://cloud.r-project.org', coreOnly=TRUE);"

RUN R -e "install.packages('rnaturalearthdata')"
RUN R -e "install.packages('tidyverse')"

# For knitting the book.
RUN R -e "install.packages('bookdown')"

RUN R -e "install.packages('spDataLarge', repos = 'https://nowosad.github.io/drat/', type = 'source')"

RUN R -e "library('ctv'); update.views('SpatioTemporal', repos='https://cloud.r-project.org', coreOnly=TRUE);"

# Not able to install all packages, so I tried to install the needed one for SDSR
RUN R -e "install.packages('datasets')"

# RUN R -e "library('ctv'); update.views('Spatial', repos='https://cloud.r-project.org');"
# RUN R -e "library('ctv'); update.views('Spatiotemporal', repos='https://cloud.r-project.org');"

CMD ["/home/docker/tibco/bin/R", "--no-save"]
