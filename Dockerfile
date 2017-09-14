# Pseudo-Shell
FROM scratch
ADD bin.tar.xz /
CMD ["/bin/sh"]