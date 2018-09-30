#!/bin/sh

MODEL=""
BLBLKDEV=""
TARGETBLKDEV=""

cat /etc_ro/version | grep 11AC-NAS-Router > /dev/null
if [ "$?" == "0" ]; then
    MODEL="11acnas"
    TARGETBLKDEV="mtd4"
    BLBLKDEV="mtd1"
fi

cat /etc_ro/version | grep W2914NS-V2 > /dev/null
if [ "$?" == "0" ]; then
    MODEL="w2914nsv2"
    TARGETBLKDEV="mtd4"
    BLBLKDEV="mtd1"
fi

cat /etc_ro/version | grep Hi1200AC > /dev/null
if [ "$?" == "0" ]; then
    MODEL="w2914nsv2"
    TARGETBLKDEV="mtd4"
    BLBLKDEV="mtd1"
fi

if [ "$MODEL" != "" ]; then
    wget -O /tmp/firmware.bin "http://$1/asset/openwrt-$MODEL.bin"
    wget -O /tmp/das-u-boot.bin "http://$1/asset/uboot-$MODEL.bin"

    if [ "$BLBLKDEV" != "" ]; then
        mtd_write -e $BLBLKDEV write /tmp/das-u-boot.bin $BLBLKDEV
    fi

    if [ "$TARGETBLKDEV" != "" ]; then
        mtd_write -e $TARGETBLKDEV -r write /tmp/firmware.bin $TARGETBLKDEV
    fi
fi

echo $MODEL > /tmp/result
