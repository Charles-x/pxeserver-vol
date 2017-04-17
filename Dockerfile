#PXESERVER-VOL Version 0.1
FROM alpine:3.5
MAINTAINER charles.xiao "charles-xiao@live.com"
VOLUME /pxe
WORKDIR /pxe
RUN apk update && apk add wget
RUN wget -P /pxe https://stable.release.core-os.net/amd64-usr/current/coreos_production_pxe.vmlinuz --no-check-certificate
RUN wget -P /pxe https://stable.release.core-os.net/amd64-usr/current/coreos_production_pxe_image.cpio.gz --no-check-certificate
RUN wget -P /pxe https://github.com/Charles-x/pxeserver-vol/blob/master/pxe/pxelinux.0 --no-check-certificate
RUN wget -P /pxe https://github.com/Charles-x/pxeserver-vol/blob/master/pxe/gpxelinux.0 --no-check-certificate
RUN wget -P /pxe https://github.com/Charles-x/pxeserver-vol/blob/master/pxe/cloud-init.yml --no-check-certificate
RUN wget -P /pxe https://github.com/Charles-x/pxeserver-vol/blob/master/pxe/cloud-config.yml --no-check-certificate
RUN wget -P /pxe https://github.com/Charles-x/pxeserver-vol/blob/master/entrypoint.sh --no-check-certificate
RUN mv /pxe/pxelinux.0 /pxe/pxelinux.0.pxe ; mv /pxe/gpxelinux.0 /pxe/gpxelinux.0.gpxe
RUN mkdir -p /pxe/pxelinux.cfg/
ENV PXEMODE pxe
ENV KERNELPATH coreos_production_pxe.vmlinuz
ENV INITRDPATH coreos_production_pxe_image.cpio.gz
ENV CLOUDCONFIGPATH cloud-config.yml
CMD sh /pxe/entrypoint.sh
