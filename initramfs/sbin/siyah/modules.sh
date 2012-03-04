#!/sbin/busybox sh

/sbin/busybox mount rootfs / -o remount,rw

#### proper module support ####
#siyahver=`uname -r`
#mkdir /lib/modules/$siyahver
#for i in `ls -1 /lib/modules/*.ko`;do
#  basei=`basename $i`
#  ln /lib/modules/$basei /lib/modules/$siyahver/$basei
#done;
#depmod /lib/modules/$siyahver

/sbin/busybox mount rootfs / -o remount,ro

#android logger
if [ ! -f /data/.siyah/disable-logger ];then
insmod /lib/modules/logger.ko
fi

# voodoo color
insmod /lib/modules/ld9040_voodoo.ko
# and sound
insmod /lib/modules/mc1n2_voodoo.ko

# for ntfs automounting
insmod /lib/modules/fuse.ko

