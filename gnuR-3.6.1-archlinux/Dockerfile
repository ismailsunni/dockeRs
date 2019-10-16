FROM archlinux/base

# Add image metadata
LABEL org.label-schema.name="GNU R on Arch Linux" \
	org.label-schema.description="Docker images of GNU R on Arch Linux" \ 
	maintainer="Ismail Sunni <imajimatika@gmail.com>"

# Install R
RUN pacman -Sy --noconfirm r

CMD ["/usr/sbin/R", "--no-save"]
