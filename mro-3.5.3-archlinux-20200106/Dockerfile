FROM archlinux:20200106

# Add image metadata
LABEL org.label-schema.name="MRO 3.5.3 on Arch Linux 20200106" \
	org.label-schema.description="Docker images of MRO 3.5.3 on Arch Linux 20200106" \ 
	maintainer="Ismail Sunni <imajimatika@gmail.com>"

RUN useradd docker

# Install sudoers and fakeroot
RUN pacman -Syu --noconfirm && pacman -S base-devel --noconfirm
RUN pacman -S git --noconfirm

# Install MRO for AUR
# Need to set docker user without password
RUN echo "docker      ALL = NOPASSWD: ALL" >> /etc/sudoers

# Switch user to docker
USER docker

# Create temp directory
RUN mkdir /tmp/packages
WORKDIR /tmp/packages

# Install needed packages first
RUN git clone https://aur.archlinux.org/icu60.git; cd icu60; makepkg -si --noconfirm;
RUN git clone https://aur.archlinux.org/ncurses5-compat-libs.git; cd ncurses5-compat-libs; makepkg -si --noconfirm --skippgpcheck

# Install the MRO now
RUN git clone https://aur.archlinux.org/microsoft-r-open.git; cd microsoft-r-open; makepkg -si --noconfirm;

# Switch user to root
USER root
WORKDIR /home/docker

CMD ["/usr/sbin/R", "--no-save"]
