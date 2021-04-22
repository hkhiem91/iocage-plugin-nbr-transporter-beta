#!/bin/sh

PRODUCT='NAKIVO Backup & Replication (Beta)'
URL="https://download1590.mediafire.com/nr3o54iyqhmg/ubnbgii0nw43q3w/NAKIVO_Transporter_Installer-10.3.0.r53914-x86_64.sh"
SHA256="09b7ecdbd35b57ea8287fb320e7efe0b7c384228f08a7bce49738fff16ca7e92"

PRODUCT_ROOT="/usr/local/nakivo"
INSTALL="inst.sh"

curl --fail --tlsv1.2 -o $INSTALL $URL
if [ $? -ne 0 -o ! -e $INSTALL ]; then
    echo "ERROR: Failed to get $PRODUCT installer"
    rm $INSTALL >/dev/null 2>&1
    exit 1
fi

#CHECKSUM=`sha256 -q $INSTALL`
#if [ "$SHA256" != "$CHECKSUM" ]; then
#    echo "ERROR: Incorrect $PRODUCT installer checksum"
#    rm $INSTALL >/dev/null 2>&1
#    exit 2
#fi

sh ./$INSTALL -s -i "$PRODUCT_ROOT" --eula-accept 2>&1
if [ $? -ne 0 ]; then
    echo "ERROR: $PRODUCT install failed"
    rm $INSTALL >/dev/null 2>&1
    exit 3
fi
rm $INSTALL >/dev/null 2>&1

exit 0
