FROM rocker/geospatial:3.6.1

# Add image metadata
LABEL org.label-schema.name="GNU R on Fedora" \
	org.label-schema.description="Docker images of GNU R on Fedora" \ 
	maintainer="Ismail Sunni <imajimatika@gmail.com>"

# Install CTV
RUN R -e "install.packages('ctv'); library('ctv'); install.views('Spatial');"

CMD ["/usr/bin/R", "--no-save"]
