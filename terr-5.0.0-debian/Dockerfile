FROM debian:stretch

# Add image metadata
LABEL org.label-schema.name="TERR on Debian" \
	org.label-schema.description="Docker images of TERR on Debian" \ 
	maintainer="Ismail Sunni <imajimatika@gmail.com>"

RUN useradd docker

RUN apt-get update && apt-get install -y --no-install-recommends ca-certificates

WORKDIR /home/docker

# Copy TERR instalation files
ADD TERR_Developer_5.0.0_linux24gl23_x86_64 /home/docker

# Set environment variable for installation
ENV SNEXT_HOME /home/docker/tibco

# Run installation file
RUN ./INSTALL

# Remove installation files
RUN rm -rf INSTALL lib License

# Add path to $SNEXT_HOME/bin
ENV PATH="${SNEXT_HOME}/bin:${PATH}"

CMD ["/home/docker/tibco/bin/R", "--no-save"]
