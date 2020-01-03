FROM ismailsunni/gnur-3.6.1-archlinux

# Add image metadata
LABEL org.label-schema.name="GNU R 3.6.1 on Arch Linux with Geospatial Packages" \
	org.label-schema.description="GNU R 3.6.1 on Arch Linux with Geospatial Packages" \ 
	maintainer="Ismail Sunni <imajimatika@gmail.com>"

# TODO: Install dependency
RUN pacman -Syu --noconfirm && pacman -S --noconfirm \
	# bwidget \
	cairo \
	curl \
	ffmpeg \
	fftw \
	file \
	gdal \
	geos \
	git \
	glu \
	gmp \
	gsl \
	gst-libav \
	hdf5 \
	imagemagick \
	# jags \
	jq \
	jre-openjdk-headless \
	libpng \
	libpqxx \
	libssh2 \
	libtiff \
	libxml2 \
	make \
	mesa \
	netcdf \
	openmpi \
	openssl \
	pandoc pandoc-citeproc \
	perl-image-exiftool \
	proj \
	protobuf \
	python2 \
	qgis \
	rust \
	# saga-gis \
	# swftools \
	# udunits \
	unixodbc \
	# v8 \
	zlib

RUN pacman -S --noconfirm \
	gcc-fortran \
	awk

# For building package
RUN pacman -S base-devel --noconfirm

# These packages below need to be installed from ArchLinux User Repository (https://aur.archlinux.org/)
# Unfortunatelly, it is not easy.
# bwidget
# jags
# saga-gis
# swftools
# udunits
# v8

# Need to set docker user without password
RUN echo "docker      ALL = NOPASSWD: ALL" >> /etc/sudoers
# Switch user to docker
USER docker
# Create temp directory
RUN mkdir /tmp/packages
WORKDIR /tmp/packages
# Install packages from AUR
RUN git clone https://aur.archlinux.org/bwidget.git; cd bwidget; makepkg -si --noconfirm;
RUN git clone https://aur.archlinux.org/jags.git; cd jags; makepkg -si --noconfirm;

RUN git clone https://aur.archlinux.org/swftools.git; cd swftools; makepkg -si --noconfirm;
RUN git clone https://aur.archlinux.org/udunits.git; cd udunits; makepkg -si --noconfirm;

# For installing saga-gis
RUN git clone https://aur.archlinux.org/lua-hpdf.git; cd lua-hpdf; makepkg -si --noconfirm;

# RUN git clone https://aur.archlinux.org/saga-gis.git; cd saga-gis; makepkg -si --noconfirm;
# RUN git clone https://aur.archlinux.org/v8.git; cd v8; makepkg -si --noconfirm;

# Back to the main directory
WORKDIR /home/docker
# Back to root
USER root
# Remove downloaded packages
RUN rm -rf /tmp/packages

# # Install CTV, and install Spatial and SpatioTemporal packages.
RUN R -e "install.packages('ctv')"
RUN R -e "library('ctv'); install.views('Spatial', coreOnly=TRUE)"
RUN R -e "library('ctv'); install.views('SpatioTemporal', coreOnly=TRUE)"

# # Install missing pacakges
# RUN dnf install -y \
# 	sqlite \
# 	sqlite-devel
# RUN R -e "library('ctv'); update.views('Spatial')"
# RUN R -e "library('ctv'); update.views('SpatioTemporal')"

# WORKDIR /home/docker

RUN R -e "install.packages('spDataLarge', repos = 'https://nowosad.github.io/drat/', type = 'source')"
RUN R -e "install.packages('rnaturalearthdata')"
RUN R -e "install.packages('tidyverse')"

# # For knitting the book.
RUN R -e "install.packages('bookdown')"

RUN R -e "library('ctv'); update.views('Spatial')"
RUN R -e "library('ctv'); update.views('SpatioTemporal')"

COPY scripts/* ./

CMD ["/usr/bin/R", "--no-save"]
