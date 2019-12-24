FROM ismailsunni/terr-5.0.0-debian

# Add image metadata
LABEL org.label-schema.name="TERR 5.0.0 on Debian with Geospatial Packages" \
	org.label-schema.description="TERR 5.0.0 on Debian with Geospatial Packages" \ 
	maintainer="Ismail Sunni <imajimatika@gmail.com>"

# TODO: Install dependency
RUN apt update -y && apt install -y --no-install-recommends \
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

COPY scripts/check_packages.R scripts/spatial_packages.txt scripts/spatiotemporal_packages.txt ./

RUN apt install -y r-base-dev
RUN R -e "install.packages('rinclude'); install.packages('backports');"

# Install spatial packages from the list
# RUN R -e "install.packages(readLines('./spatial_packages.txt')[0:100])"
# RUN R -e "install.packages(readLines('./spatial_packages.txt')[101:194])"
# RUN R -e "install.packages(readLines('./spatiotemporal_packages.txt'))"

# RUN R -e "install.packages('spDataLarge', repos = 'https://nowosad.github.io/drat/', type = 'source')"
# RUN R -e "install.packages('rnaturalearthdata')"
# RUN R -e "install.packages('tidyverse')"

# For knitting the book.
# RUN R -e "install.packages('bookdown')"

CMD ["/home/docker/tibco/bin/R", "--no-save"]
