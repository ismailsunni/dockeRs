FROM archlinux/base

# Add image metadata
LABEL org.label-schema.name="GNU R on Arch Linux" \
	org.label-schema.description="Docker images of GNU R on Arch Linux" \ 
	maintainer="Ismail Sunni <imajimatika@gmail.com>"

RUN useradd docker

# Install sudoers and fakeroot
RUN pacman -Syu --noconfirm && pacman -Sy --noconfirm sudo fakeroot

# Install R
RUN pacman -Sy --noconfirm r

# Copy RProfile.site for default CRAN
COPY Rprofile.site /usr/lib64/R/etc/Rprofile.site

WORKDIR /home/docker

CMD ["/usr/sbin/R", "--no-save"]
