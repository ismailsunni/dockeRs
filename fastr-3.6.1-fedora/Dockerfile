FROM ismailsunni/graalvm-fedora

# Add image metadata
LABEL org.label-schema.name="FastR on Fedora" \
	org.label-schema.description="Docker images of FastR on Fedora" \ 
	maintainer="Ismail Sunni <imajimatika@gmail.com>"

RUN useradd docker

WORKDIR /home/docker

RUN yum -y groupinstall 'Development Tools' && yum -y install gcc-gfortran

RUN gu install R

CMD ["R", "--no-save"]
