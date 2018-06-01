#!/bin/sh

opkg update
[ $? -ne 0 ] && echo "Failed to update via opkg. Please check your internet connection." && exit 1;

opkg install ncftp
[ $? -ne 0 ] && echo "Failed to install required dependencies. Please check your internet connection or remaining flash space." && exit 1;

