FROM rocker/geospatial:3.6.1

# Add image metadata
LABEL org.label-schema.name="GNU R 3.6.1 on Debian with Geospatial Packages" \
	org.label-schema.description="GNU R 3.6.1 on Debian with Geospatial Packages" \ 
	maintainer="Ismail Sunni <imajimatika@gmail.com>"

# # Install missing dependency
# RUN apt-get install -y --no-install-recommends \
# 	# for basm package
# 	jags \
# 	# for basm package, from rpanel's requirement
# 	bwidget \
# 	# for moveVis package
# 	imagemagick \
# 	ffmpeg \
# 	libav-tools

# Install CTV, and install Spatial and SpatioTemporal packages.
RUN R -e "install.packages('ctv'); library('ctv'); install.views('Spatial'); install.views('SpatioTemporal');"

WORKDIR /home/docker

COPY check_packages.R check_packages.R

CMD ["/usr/bin/R", "--no-save"]
