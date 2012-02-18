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

# for ntfs automounting
insmod /lib/modules/fuse.ko

