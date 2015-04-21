cd /root
rm mod-*
wget https://dl-ssl.google.com/dl/linux/direct/mod-pagespeed-stable_current_x86_64.rpm --inet4-only
rpm -U mod-pagespeed-*.rpm --nodeps
ntpdate ntp.xs4all.nl;
yum update -y;
/usr/local/directadmin/custombuild/build clean;
/usr/local/directadmin/custombuild/build clean_old_webapps;
/usr/local/directadmin/custombuild/build update_script;
/usr/local/directadmin/custombuild/build update;
/usr/local/directadmin/custombuild/build update_versions;
echo "DONE";
exit;