FROM rocker/geospatial:3.6.1

# Add image metadata
LABEL org.label-schema.name="GNU R 3.6.1 on Debian with Geospatial Packages" \
	org.label-schema.description="GNU R 3.6.1 on Debian with Geospatial Packages" \ 
	maintainer="Ismail Sunni <imajimatika@gmail.com>"

# Install missing dependency
RUN apt-get install -y --no-install-recommends \
	# for basm package
	jags \
	# for basm package, from rpanel's requirement
	bwidget \
	# for moveVis package
	imagemagick \
	ffmpeg \
	libav-tools

# Install CTV, and install Spatial and SpatioTemporal packages.
RUN R -e "install.packages('ctv'); library('ctv'); install.views('Spatial');"
RUN R -e "library('ctv'); install.views('SpatioTemporal');"

# Missing dependency
RUN apt-get install -y --no-install-recommends \
	# for moveVis package
	cargo \
	libavfilter-dev

RUN R -e "install.packages('moveVis');"
RUN R -e "install.packages('spDataLarge', repos = 'https://nowosad.github.io/drat/', type = 'source')"
RUN R -e "install.packages('rnaturalearthdata')"

# For knitting the book.
RUN R -e "install.packages('bookdown')"

WORKDIR /home/docker

# Copy needed scripts
COPY scripts/check_packages.R scripts/spatial_packages.txt scripts/spatiotemporal_packages.txt ./

CMD ["/usr/bin/R", "--no-save"]
