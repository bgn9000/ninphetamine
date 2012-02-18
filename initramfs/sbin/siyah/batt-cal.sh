#!/sbin/busybox sh
SLEEP=500
 
if [ -e /data/.siyah/battery-calibrated ] ; then
        exit 0
fi
 
(
while : ; do
	#in case we might want to cancel the calibration by creating the file
	if [ -e /data/.siyah/battery-calibrated ] ; then
        	exit 0
	fi
        LEVEL=$(cat /sys/class/power_supply/battery/capacity)
        CURR_ADC=$(cat /sys/class/power_supply/battery/batt_current_adc)
        STATUS=$(cat /sys/class/power_supply/battery/status)
        BATTFULL=$(cat /sys/class/power_supply/battery/batt_full_check)
        if [ "$LEVEL" == "100" ] && [ "$BATTFULL" == "1" ]; then
                log -p i -t battery-calibration "*** LEVEL: $LEVEL CUR: $CURR_ADC***: calibrating..."
                rm -f /data/system/batterystats.bin
		mkdir /data/.siyah
		chmod 777 /data/.siyah
                touch /data/.siyah/battery-calibrated
                exit 0
        fi
        # log -p i -t battery-calibration "*** LEVEL: $LEVEL CUR: $CUR ***: sleeping for $SLEEP s..."
        sleep $SLEEP
done
) &
