FROM ismailsunni/fastr-3.6.1-oracle

# Add image metadata
LABEL org.label-schema.name="FastR 3.6.1 on Oracle Linux Server with Geospatial Packages" \
	org.label-schema.description="FastR 3.6.1 on Oracle Linux Server with Geospatial Packages" \ 
	maintainer="Ismail Sunni <imajimatika@gmail.com>"

# Install wget first
RUN yum install -y wget

# Enable EPEL see: 	
RUN wget http://dl.fedoraproject.org/pub/epel/epel-release-latest-7.noarch.rpm
RUN rpm -Uvh epel-release-latest-7.noarch.rpm

# TODO: Install dependency
RUN yum install -y \
	bwidget \
	cairo-devel \
	cargo \
	fftw-devel \
	file-devel \
	gdal \
	gdal-devel \
	geos-devel \
	git \
	gsl-devel \
	hdf5-devel \
	ImageMagick \
	ImageMagick-c++-devel \
	java-1.8.0-openjdk \
	jq-devel \
	libcurl-devel \
	libomp-devel \
	libpng-devel \
	libssh2-devel \
	libtiff-devel \
	libxml2-devel \
	make \
	mesa-libGL-devel \
	mesa-libGLU-devel \
	netcdf-devel \
	openmpi-devel \
	openssl-devel \
	pandoc pandoc-citeproc \
	postgresql-devel \
	proj-devel \
	# proj-epsg \
	# proj-nad \
	proj \
	protobuf-compiler \
	protobuf-devel \
	python \
	udunits2-devel \
	unixODBC-devel \
	# v8-314-devel \
	v8-devel \
	zlib-devel

# Install CTV, and install Spatial and SpatioTemporal packages.
RUN R -e "install.packages('ctv');"
RUN R -e "library('ctv'); install.views('Spatial', coreOnly=TRUE);"
RUN R -e "library('ctv'); install.views('SpatioTemporal', coreOnly=TRUE);"

WORKDIR /home/docker

RUN R -e "install.packages('spDataLarge', repos = 'https://nowosad.github.io/drat/', type = 'source')"
RUN R -e "install.packages('rnaturalearthdata')"
RUN R -e "install.packages('tidyverse')"

# For knitting the book.
RUN R -e "install.packages('bookdown')"

# Install sf from source (the previous one is outdated)
# Adapted from https://gist.github.com/simondobner/f859b2db15ad65090c3c316d3c224f45
RUN wget http://download.osgeo.org/gdal/2.2.1/gdal-2.2.1.tar.gz  && \
	tar zxvf gdal-2.2.1.tar.gz 
RUN	cd gdal-2.2.1/ && \
	./configure --prefix=/usr/ --with-sfcgal=no && \
	make -j4 && \
	make install && \
	ldconfig && \
	cd ..

# Install missing deps
RUN yum install -y \
	proj-epsg \
	proj-nad

# Install missing core packages.
RUN R -e "install.packages(c('sf', 'rgdal', 'spatialreg'));"

# Remove the downloaded file
RUN rm -rf gdal-2.2.1 && rm gdal-2.2.1.tar.gz 
RUN rm epel-release-latest-7.noarch.rpm

COPY scripts/* ./

CMD ["R", "--no-save"]
