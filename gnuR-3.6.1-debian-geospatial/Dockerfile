FROM rocker/geospatial:3.6.1

# Add image metadata
LABEL org.label-schema.name="GNU R 3.6.1 on Debian with Geospatial Packages" \
	org.label-schema.description="GNU R 3.6.1 on Debian with Geospatial Packages" \ 
	maintainer="Ismail Sunni <imajimatika@gmail.com>"

# Install CTV, and install Spatial and SpatioTemporal packages.
RUN R -e "install.packages('ctv'); library('ctv'); install.views('Spatial'); install.views('SpatioTemporal');"

CMD ["/usr/bin/R", "--no-save"]
