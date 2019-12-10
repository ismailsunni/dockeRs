FROM ismailsunni/gnur-fedora

# Add image metadata
LABEL org.label-schema.name="GNU R 3.6.1 on Fedora with Geospatial Packages" \
	org.label-schema.description="GNU R 3.6.1 on Fedora with Geospatial Packages" \ 
	maintainer="Ismail Sunni <imajimatika@gmail.com>"

# TODO: Install dependency
RUN dnf install -y \
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
RUN R -e "install.packages('ctv', repos='http://cran.us.r-project.org');"
RUN R -e "library('ctv'); install.views('Spatial', repos='http://cran.us.r-project.org');"
RUN R -e "library('ctv'); install.views('SpatioTemporal', repos='http://cran.us.r-project.org');"

# Install missing pacakges
RUN dnf install -y \
	sqlite \
	sqlite-devel
RUN R -e "library('ctv'); update.views('Spatial', repos='http://cran.us.r-project.org');"
RUN R -e "library('ctv'); update.views('SpatioTemporal', repos='http://cran.us.r-project.org');"

WORKDIR /home/docker

# Copy RProfile.site for default CRAN
COPY Rprofile.site /usr/lib64/R/etc/Rprofile.site

RUN R -e "install.packages('spDataLarge', repos = 'https://nowosad.github.io/drat/', type = 'source')"
# RUN R -e "install.packages('starsdata', repos = 'http://pebesma.staff.ifgi.de', type = 'source')"
RUN R -e "install.packages('rnaturalearthdata')"
RUN R -e "install.packages('tidyverse')"

# Copy needed scripts (remove this if re-build using the newer ismailsunni/gnur-fedora image)
COPY scripts/check_packages.R scripts/spatial_packages.txt scripts/spatiotemporal_packages.txt ./

CMD ["/usr/bin/R", "--no-save"]
