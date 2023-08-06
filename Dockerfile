FROM archlinux:latest
RUN pacman -Syyu --noconfirm
RUN pacman -S --noconfirm openssh
COPY . .
CMD ["bash", "bootstrap.sh"]
