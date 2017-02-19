ntpdate ntp.xs4all.nl;
yum update -y;
/usr/local/directadmin/custombuild/build clean;
/usr/local/directadmin/custombuild/build clean_old_webapps;
/usr/local/directadmin/custombuild/build update_script;
/usr/local/directadmin/custombuild/build update;
/usr/local/directadmin/custombuild/build update_versions;
echo "DONE";
exit;
