#PXESERVER-VOL Version 0.1
MAINTAINER charles.xiao "charles-xiao@live.com"
FROM alpine:3.5
VOLUME /pxe/
WORKDIR /pxe/
RUN wget https://stable.release.core-os.net/amd64-usr/current/coreos_production_pxe.vmlinuz
RUN wget https://stable.release.core-os.net/amd64-usr/current/coreos_production_pxe_image.cpio.gz
RUN wget https://github.com/Charles-x/pxeserver/tree/master/pxe/pxelinux.0
RUN wget https://github.com/Charles-x/pxeserver/tree/master/pxe/gpxelinux.0
RUN wget https://github.com/Charles-x/pxeserver/tree/master/pxe/cloud-init .yml
RUN wget https://github.com/Charles-x/pxeserver/tree/master/pxe/cloud-config.yml
RUN wget https://github.com/Charles-x/pxeserver/tree/master/pxe/entrypoint.sh
RUN mv pxelinux.0 pxelinux.0.pxe ; mv gpxelinux.0 gpxelinux.0.gpxe
WORKDIR pxelinux.cfg/
WORKDIR /pxe/
ENV PXEMODE pxe
ENV KERNELPATH coreos_production_pxe.vmlinuz
ENV INITRDPATH coreos_production_pxe_image.cpio.gz
ENV CLOUDCONFIGPATH cloud-config.yml
CMD sh entrypoint.sh