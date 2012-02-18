#!/sbin/busybox sh
# thanks to hardcore and nexxx
# some parameters are taken from http://forum.xda-developers.com/showthread.php?t=1292743 (highly recommended to read)

# IPv6 privacy tweak
#if /sbin/busybox [ "`/sbin/busybox grep IPV6PRIVACY /system/etc/tweaks.conf`" ]; then
  echo "2" > /proc/sys/net/ipv6/conf/all/use_tempaddr
#fi

# enable SCHED_MC
echo 1 > /sys/devices/system/cpu/sched_mc_power_savings
# Enable AFTR, default:2
echo 3 > /sys/module/cpuidle/parameters/enable_mask

# TCP tweaks
echo "2" > /proc/sys/net/ipv4/tcp_syn_retries
echo "2" > /proc/sys/net/ipv4/tcp_synack_retries
echo "10" > /proc/sys/net/ipv4/tcp_fin_timeout

#thanks to pikachu01@XDA
/sbin/busybox sh /sbin/siyah/thunderbolt.sh
#sysctl -w kernel.sched_min_granularity_ns=200000;
#sysctl -w kernel.sched_latency_ns=400000;
#sysctl -w kernel.sched_wakeup_granularity_ns=100000;
