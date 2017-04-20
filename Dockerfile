#PXESERVER-VOL Version 0.1
FROM alpine:3.5
MAINTAINER charles.xiao "charles-xiao@live.com"
WORKDIR /pxe
RUN mkdir -p /pxe/pxelinux.cfg/
RUN mkdir -p /pxe/coreos/1298.6.0/
RUN apk update && apk add wget mini_httpd
RUN wget -P /pxe https://stable.release.core-os.net/amd64-usr/current/coreos_production_pxe.vmlinuz --no-check-certificate
RUN wget -P /pxe https://stable.release.core-os.net/amd64-usr/current/coreos_production_pxe_image.cpio.gz --no-check-certificate
RUN wget -P /pxe https://raw.githubusercontent.com/Charles-x/pxeserver-vol/master/pxe/pxelinux.0.pxe --no-check-certificate
RUN wget -P /pxe https://raw.githubusercontent.com/Charles-x/pxeserver-vol/master/pxe/gpxelinux.0.gpxe --no-check-certificate
RUN wget -P /pxe https://raw.githubusercontent.com/Charles-x/pxeserver-vol/master/pxe/cloud-init.yml --no-check-certificate
RUN wget -P /pxe https://raw.githubusercontent.com/Charles-x/pxeserver-vol/master/pxe/cloud-config.yml --no-check-certificate
RUN wget -P /pxe https://raw.githubusercontent.com/Charles-x/pxeserver-vol/master/entrypoint.sh --no-check-certificate
RUN wget -P /pxe/coreos/1298.6.0 https://stable.release.core-os.net/amd64-usr/1298.6.0/coreos_production_image.bin.bz2 --no-check-certificate
RUN wget -P /pxe/coreos/1298.6.0 https://stable.release.core-os.net/amd64-usr/1298.6.0/coreos_production_image.bin.bz2.sig --no-check-certificate
#RUN mv /pxe/pxelinux.0 /pxe/pxelinux.0.pxe ; mv /pxe/gpxelinux.0 /pxe/gpxelinux.0.gpxe

ENV PXEMODE pxe
ENV KERNELPATH coreos_production_pxe.vmlinuz
ENV INITRDPATH coreos_production_pxe_image.cpio.gz
ENV CLOUDCONFIGPATH cloud-config.yml
VOLUME /pxe
CMD sh /pxe/entrypoint.sh
