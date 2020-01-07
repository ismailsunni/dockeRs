FROM ismailsunni/mro-3.5.3-fedora

# Add image metadata
LABEL org.label-schema.name="MRO 3.5.3 on Fedora with Geospatial Packages" \
	org.label-schema.description="MRO 3.5.3 on Fedora with Geospatial Packages" \ 
	maintainer="Ismail Sunni <imajimatika@gmail.com>"

# TODO: Install dependency
# RUN dnf check-update
RUN dnf install -y \
	bwidget \
	cairo-devel \
	cargo \
	# fix : nothing provides clang-devel = 9.0.0 needed by libomp-devel-9.0.0-1.fc32.i686
	# clang-devel \
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
	# issue: nothing provides clang-devel = 9.0.0 needed by libomp-devel-9.0.0-1.fc32.i686
	# libomp-devel \
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

# Missing g++
RUN dnf install gcc-c++ -y

# Install CTV, and install Spatial and SpatioTemporal packages.
RUN R -e "install.packages('ctv');"
RUN R -e "library('ctv'); install.views('Spatial', coreOnly=TRUE);"
RUN R -e "library('ctv'); install.views('SpatioTemporal', coreOnly=TRUE);"

# # Install missing pacakges
# RUN dnf install -y \
# 	sqlite \
# 	sqlite-devel

RUN R -e "library('ctv'); update.views('Spatial');"
RUN R -e "library('ctv'); update.views('SpatioTemporal');"

# RUN R -e "install.packages('spDataLarge', repos = 'https://nowosad.github.io/drat/', type = 'source')"
# # RUN R -e "install.packages('starsdata', repos = 'http://pebesma.staff.ifgi.de', type = 'source')"
# RUN R -e "install.packages('rnaturalearthdata')"
# RUN R -e "install.packages('tidyverse')"

# # For knitting the book.
# RUN R -e "install.packages('bookdown')"

# Copy needed scripts (remove this if re-build using the newer ismailsunni/gnur-fedora image)
COPY scripts/*  ./

CMD ["/usr/bin/R", "--no-save"]
