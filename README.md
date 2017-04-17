# Pxeserver-vol
### Please assign value to these variate,if "$PXEMODE = gpxe",$KERNELPATH,$INITRDPATH,these path you can use ftp http path,$CLOUDCONFIGPATH is alway can use http ftp path.

* $PXEMODE
* $KERNELPATH
* $INITRDPATH
* $CLOUDCONFIGPATH

### Default is use tftp way to get these files ,e.g:

* $PXEMODE = pxe
* $KERNELPATH = coreos_production_pxe.vmlinuz
* $INITRDPATH = coreos_production_pxe_image.cpio.gz
* $CLOUDCONFIGPATH = cloud-config.yml

### You also can like below:

* $PXEMODE = gpxe
* $KERNELPATH = http://1.1.1.1/coreos_production_pxe.vmlinuz
* $INITRDPATH = ftp://2.2.2.2/coreos_production_pxe_image.cpio.gz
* $CLOUDCONFIGPATH = http://3.3.3.3/cloud-config.yml
