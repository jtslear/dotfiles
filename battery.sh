#!/bin/sh

HEART_FULL=♥
HEART_EMPTY=♡
[ -z "$NUM_HEARTS" ] &&
    NUM_HEARTS=10

cutinate()
{
    perc=$1
    inc=$(( 100 / $NUM_HEARTS))
    value=$inc


    for i in `seq $NUM_HEARTS`; do
        if [ $value -le $perc ]; then
            printf "%s " $HEART_FULL
        else
            printf "%s " $HEART_EMPTY
        fi
        value=$(( $value + $inc ))
    done
echo
}

linux_get_bat ()
{
    bf=$(cat $BAT_FULL)
    bn=$(cat $BAT_NOW)
    BAT=`echo "100 * $bn / $bf" | bc`
    echo $BAT
}

freebsd_get_bat ()
{
    echo "$(sysctl -n hw.acpi.battery.life)"

}

# Do with grep and awk unless too hard

# TODO Identify which machine we're on from teh script.

battery_status()
{
case $(uname -s) in
    "Linux")
        BATPATH=${BATPATH:-/sys/class/power_supply/BAT0}
        STATUS=$BATPATH/status
        if [ -f "$BATPATH/energy_full" ]; then
            naming="energy"
        elif [ -f "$BATPATH/charge_full" ]; then
            naming="charge"
        fi
        BAT_FULL=$BATPATH/${naming}_full
        BAT_NOW=$BATPATH/${naming}_now
        if [ "$1" = `cat $STATUS` -o "$1" = "" ]; then
            linux_get_bat
        fi
        ;;
    "FreeBSD")
        STATUS=`sysctl -n hw.acpi.battery.state`
        case $1 in
            "Discharging")
                if [ $STATUS -eq 1 ]; then
                    freebsd_get_bat
                fi
                ;;
            "Charging")
                if [ $STATUS -eq 2 ]; then
                    freebsd_get_bat
                fi
                ;;
            "")
                freebsd_get_bat
                ;;
        esac
        ;;
    "Darwin")
        case $1 in
            "Discharging")
                ext="No";;
            "Charging")
                ext="Yes";;
        esac

        ioreg -c AppleSmartBattery -w0 | \
        grep -o '"[^"]*" = [^ ]*' | \
        sed -e 's/= //g' -e 's/"//g' | \
        sort | \
        while read key value; do
            case $key in
                "MaxCapacity")
                    export maxcap=$value;;
                "CurrentCapacity")
                    export curcap=$value;;
                "ExternalConnected")
                    if [ "$ext" != "$value" ]; then
                        exit
                    fi
                ;;
                "FullyCharged")
                    if [ "$value" = "Yes" ]; then
                        # The battery is fully charged!
                        echo "100"
                        break;
                    fi
                ;;
            esac
            if [[ -n "$maxcap" && -n $curcap ]]; then
                echo "100 * $curcap / $maxcap" | bc
                break
            fi
        done
esac
}

BATTERY_STATUS=`battery_status $1`
[ -z "$BATTERY_STATUS" ] && exit

if [ -n "$CUTE_BATTERY_INDICATOR" ]; then
    cutinate $BATTERY_STATUS
else
    echo ${BATTERY_STATUS}%
fi

