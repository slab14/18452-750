
if [ $1 == 1]; then

#    wget -O /boot/raspi-expand-rootfs.sh https://raw.githubusercontent.com/lgierth/pimesh/master/files/raspi-expand-rootfs.sh
#    chmod +x /boot/raspi-expand-rootfs.sh
#    sh /boot/raspi-expand-rootfs.sh

    resize2fs /dev/mmcblk0p2
    apt-get update -y
    apt-get upgrade -y
    apt-get update -y
    apt-get dist-upgrade -y

    #   passwd root

    apt-get install -y openssh-server
    update-rc.d -f ssh remove
    update-rc.d -f ssh defaults
    


fi


