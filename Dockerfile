#PXESERVER-VOL Version 0.1
FROM alpine:3.5
MAINTAINER charles.xiao "charles-xiao@live.com"
VOLUME /pxe/
WORKDIR /pxe/
RUN apk update && apk add wget
RUN wget https://stable.release.core-os.net/amd64-usr/current/coreos_production_pxe.vmlinuz --no-check-certificate
RUN wget https://stable.release.core-os.net/amd64-usr/current/coreos_production_pxe_image.cpio.gz --no-check-certificate
RUN wget https://github.com/Charles-x/pxeserver-vol/blob/master/pxe/pxelinux.0 --no-check-certificate
RUN wget https://github.com/Charles-x/pxeserver-vol/blob/master/pxe/gpxelinux.0 --no-check-certificate
RUN wget https://github.com/Charles-x/pxeserver-vol/blob/master/pxe/cloud-init.yml --no-check-certificate
RUN wget https://github.com/Charles-x/pxeserver-vol/blob/master/pxe/cloud-config.yml --no-check-certificate
RUN wget https://github.com/Charles-x/pxeserver-vol/blob/master/entrypoint.sh --no-check-certificate
RUN mv pxelinux.0 pxelinux.0.pxe ; mv gpxelinux.0 gpxelinux.0.gpxe
WORKDIR pxelinux.cfg/
WORKDIR /pxe/
ENV PXEMODE pxe
ENV KERNELPATH coreos_production_pxe.vmlinuz
ENV INITRDPATH coreos_production_pxe_image.cpio.gz
ENV CLOUDCONFIGPATH cloud-config.yml
CMD sh entrypoint.sh
