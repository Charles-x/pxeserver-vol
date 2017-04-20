#!/bin/sh

echo $PXEMODE
echo $KERNELPATH
echo $INITRDPATH
echo $CLOUDCONFIGPATH



if [ $PXEMODE = 0 -o $KERNELPATH = 0 -o $INITRDPATH = 0 -o $CLOUDCONFIGPATH = 0 ]
then
echo "there is a null value in these environment variable"
return 0
fi

if [ $PXEMODE = "pxe" ]
then
    echo "pxemode use pxe "
	mv /pxe/pxelinux.0.pxe /pxe/pxelinux.0
 
elif [ $PXEMODE = "gpxe" ]
then
    echo "pxemode use pxe !!!"
    mv /pxe/gpxelinux.0.gpxe /pxe/pxelinux.0

else 
echo "pxemode error!!!\nyou should set pxe or gpxe for pxemode!"

fi
#create default file for pxe
# cat>/pxe/pxelinux.cfg/default<<EOF
# default coreos
# prompt 1
# timeout 15
# 
# display boot.msg
# 
# label coreos
# menu default
#     kernel $KERNELPATH
#     initrd $INITRDPATH
#     append $CLOUDCONFIGPATH
# EOF
mini-httpd -p 80 -d /pxe/
echo "pxe vol create success,please use from-volume parameter in docker run"
