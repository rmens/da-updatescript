#!/bin/bash
# Universal script to update DirectAdmin server on Debian/Ubuntu and RHEL/CentOS systems

# Determine the OS type
if [ -f /etc/os-release ]; then
    . /etc/os-release
    OS=$NAME
    VERSION_ID=$VERSION_ID
elif type lsb_release >/dev/null 2>&1; then
    OS=$(lsb_release -si)
elif [ -f /etc/lsb-release ]; then
    . /etc/lsb-release
    OS=$DISTRIB_ID
elif [ -f /etc/debian_version ]; then
    OS=Debian
elif [ -f /etc/redhat-release ]; then
    OS=$(cat /etc/redhat-release | cut -d' ' -f1)
else
    OS=$(uname -s)
fi

# Update the system clock using official NTP pool servers
ntpdate pool.ntp.org

# Update based on the OS
case $OS in
    'Ubuntu' | 'Debian')
        apt-get update -y
        apt-get upgrade -y
        apt-get autoremove -y
        ;;
    'CentOS' | 'Red Hat Enterprise Linux Server' | 'Fedora')
        # Use dnf for RHEL 8 and later, yum for earlier versions
        if [ "$OS" = "Red Hat Enterprise Linux Server" ] && [ "${VERSION_ID:0:1}" -ge 8 ] || [ "$OS" = "CentOS" ] && [ "${VERSION_ID:0:1}" -ge 8 ]; then
            dnf update -y
        else
            yum update -y
        fi
        ;;
    *)
        echo "Unsupported OS: $OS"
        exit 1
        ;;
esac

# DirectAdmin custombuild scripts
/usr/local/directadmin/custombuild/build clean
/usr/local/directadmin/custombuild/build clean_old_webapps
/usr/local/directadmin/custombuild/build update_script
/usr/local/directadmin/custombuild/build update
/usr/local/directadmin/custombuild/build update_versions

echo "DONE"
exit
