FROM oracle/graalvm-ce

# Add image metadata
LABEL org.label-schema.name="FastR on Oracle" \
	org.label-schema.description="Docker images of FastR on Oracle" \ 
	maintainer="Ismail Sunni <imajimatika@gmail.com>"

RUN useradd docker

WORKDIR /home/docker

# COPY r-installable-java8-linux-amd64-19.3.0.jar .

RUN yum -y groupinstall 'Development Tools' && yum -y install gcc-gfortran

RUN gu install R

# CMD ["/home/docker/tibco/bin/R", "--no-save"]
