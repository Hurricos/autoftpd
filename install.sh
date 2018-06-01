#!/bin/sh

opkg update
[ $? -ne 0 ] && echo "Failed to update via opkg. Please check your internet connection." && exit 1;

opkg install ncftp
[ $? -ne 0 ] && echo "Failed to install required dependencies. Please check your internet connection or remaining flash space." && exit 1;

mv udhcpc.user /etc/udhcpc.user \
	&& echo "Moved udhcpc.user to /etc/udhcpc.user"

mv autoftpd /etc/init.d/autoftpd \
	&& echo "Moved autoftpd to /etc/init.d/autoftpd"

mkdir /etc/autoftp/ \
	&& echo "Created directory /etc/autoftp"

mv dhcplogd /etc/autoftp/dhcplogd \
	&& echo "Moved dhcplogd to /etc/autoftp/dhcplogd"

mv autoftp /etc/autoftp/autoftp \
   	&& echo "Moved autoftp to /etc/autoftp/autoftp"

mv autoftp.defaults.conf /etc/autoftp/autoftp.defaults.conf \
	&& echo "Moved autoftp.defaluts.conf to /etc/autoftp/autoftp.defaults.conf"

/etc/init.d/autoftpd enable \
	&& echo "Enabled autoftpd for next startup"

echo "Don't forget to move your 'login.cfg' file to /etc/autoftp/login.cfg."
echo "Successfully installed autoftpd."
