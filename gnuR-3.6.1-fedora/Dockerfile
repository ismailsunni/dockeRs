FROM fedora:32

# Add image metadata
LABEL org.label-schema.name="GNU R on Fedora" \
	org.label-schema.description="Docker images of GNU R on Fedora" \ 
	maintainer="Ismail Sunni <imajimatika@gmail.com>"

RUN useradd docker

# Install R
RUN dnf install -y -q R

# Copy RProfile.site for default CRAN
COPY Rprofile.site /usr/lib64/R/etc/Rprofile.site

WORKDIR /home/docker

CMD ["/usr/bin/R", "--no-save"]
