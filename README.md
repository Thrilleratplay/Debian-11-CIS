# Debian 11 (Bullseye) CIS hardened docker image

Using scipts provided by [ovh/debian-cis](https://github.com/ovh/debian-cis)

## Complaince Status

```
################### SUMMARY ###################
      Total Available Checks : 233
         Total Runned Checks : 219
         Total Passed Checks : [ 190/219 ]
         Total Failed Checks : [  29/219 ]
   Enabled Checks Percentage : 93.99 %
       Conformity Percentage : 86.75 %
```

## Disabled Checks

* Checks for partitioning do not make sense for a docker image.  
* OVH distribution check does not accept Bullseye

```
1.1.10_var_tmp_noexec.cfg
1.1.11_var_log_partition.cfg
1.1.12_var_log_audit_partition.cfg
1.1.13_home_partition.cfg
1.1.14_home_nodev.cfg
1.1.2_tmp_partition.cfg
1.1.3_tmp_nodev.cfg
1.1.4_tmp_nosuid.cfg
1.1.5_tmp_noexec.cfg
1.1.6_var_partition.cfg
1.1.7_var_tmp_partition.cfg
1.1.8_var_tmp_nodev.cfg
1.1.9_var_tmp_nosuid.cfg
99.99_check_distribution.cfg
```

## Build Image

' ./build.sh'

## Run Intertective Image 

'./run.sh'


To run checks and show only errors:

```
cd /opt/cis-hardening/
./bin/hardening.sh --audit --allow-unsupported-distribution --set-log-level  error
```
output 

```
Your debian version is too recent and is not supported yet because there is no official CIS PDF for this version yet.
1.5.1_bootloader_ownershi [ KO ] Check failed with unexpected exit code: 2
1.5.2_bootloader_password [ KO ] Check failed with unexpected exit code: 2
1.5.3_root_password       [ KO ] ^root:[*\!]: is present in /etc/shadow
1.5.3_root_password       [ KO ] Check Failed
dmesg: read kernel buffer failed: Operation not permitted
1.7.1.2_enable_apparmor   [ KO ] Check failed with unexpected exit code: 128
apparmor filesystem is not mounted.
1.7.1.3_enforce_or_compla [ KO ] Check failed with unexpected exit code: 1
apparmor filesystem is not mounted.
apparmor filesystem is not mounted.
1.7.1.4_enforcing_apparmo [ KO ] Some processes are unconfined while they have defined profile
1.7.1.4_enforcing_apparmo [ KO ] Some processes are in complain mode
1.7.1.4_enforcing_apparmo [ KO ] Check Failed
Failed to get unit file state for systemd-timesyncd.service: No such file or directory
2.2.1.2_configure_systemd [ KO ] Check failed with unexpected exit code: 1
2.2.1.4_configure_ntp     [ KO ] Check failed with unexpected exit code: 2
2.2.15_mta_localhost      [ KO ] Check failed with unexpected exit code: 2
3.2.1_disable_send_packet [ KO ] net.ipv4.conf.default.send_redirects was not set to 0
3.2.1_disable_send_packet [ KO ] Check Failed
3.2.2_disable_ip_forwardi [ KO ] net.ipv4.ip_forward was not set to 0
3.2.2_disable_ip_forwardi [ KO ] Check Failed
3.3.2_disable_icmp_redire [ KO ] net.ipv4.conf.default.accept_redirects was not set to 0
3.3.2_disable_icmp_redire [ KO ] net.ipv6.conf.all.accept_redirects was not set to 0
3.3.2_disable_icmp_redire [ KO ] net.ipv6.conf.default.accept_redirects was not set to 0
3.3.2_disable_icmp_redire [ KO ] Check Failed
3.3.3_disable_secure_icmp [ KO ] net.ipv4.conf.all.secure_redirects was not set to 0
3.3.3_disable_secure_icmp [ KO ] net.ipv4.conf.default.secure_redirects was not set to 0
3.3.3_disable_secure_icmp [ KO ] Check Failed
3.3.4_log_martian_packets [ KO ] net.ipv4.conf.all.log_martians was not set to 1
3.3.4_log_martian_packets [ KO ] net.ipv4.conf.default.log_martians was not set to 1
3.3.4_log_martian_packets [ KO ] Check Failed
3.3.7_enable_source_route [ KO ] net.ipv4.conf.all.rp_filter was not set to 1
3.3.7_enable_source_route [ KO ] net.ipv4.conf.default.rp_filter was not set to 1
3.3.7_enable_source_route [ KO ] Check Failed
3.4.1_disable_dccp        [ KO ] dccp is enabled!
3.4.1_disable_dccp        [ KO ] Check Failed
3.4.2_disable_sctp        [ KO ] sctp is enabled!
3.4.2_disable_sctp        [ KO ] Check Failed
3.5.4.1.1_net_fw_default_ [ KO ] Empty return from iptables command. Aborting...
3.5.4.1.1_net_fw_default_ [ KO ] Check Failed
4.1.1.3_audit_bootloader  [ KO ] ^GRUB_CMDLINE_LINUX=.*audit=1 is not present in /etc/default/grub
4.1.1.3_audit_bootloader  [ KO ] Check Failed
4.2.1.5_syslog-ng_remote_ [ KO ] destination[[:alnum:][:space:]*{]+(tcp|udp)[[:space:]]*\(\"[[:alnum:].]+\". is not present in /etc/syslog-ng/syslog-ng.conf 
4.2.1.5_syslog-ng_remote_ [ KO ] Check Failed
4.2.1.6_remote_syslog-ng_ [ KO ] source[[:alnum:][:space:]*{]+(tcp|udp)[[:space:]]*\(\"[[:alnum:].]+\". is not present in /etc/syslog-ng/syslog-ng.conf 
4.2.1.6_remote_syslog-ng_ [ KO ] Check Failed
4.2.3_logs_permissions    [ KO ] /var/log/apt/eipp.log.xz permissions were not set to 640
4.2.3_logs_permissions    [ KO ] /var/log/apt/history.log permissions were not set to 640
4.2.3_logs_permissions    [ KO ] Check Failed
5.2.16_sshd_idle_timeout  [ KO ] ^ClientAliveCountMax[[:space:]]*0 is not present in /etc/ssh/sshd_config
5.2.16_sshd_idle_timeout  [ KO ] Check Failed
5.2.18_sshd_limit_access  [ KO ] ^AllowGroups[[:space:]]** is not present in /etc/ssh/sshd_config
5.2.18_sshd_limit_access  [ KO ] ^DenyUsers[[:space:]]*nobody is not present in /etc/ssh/sshd_config
5.2.18_sshd_limit_access  [ KO ] ^DenyGroups[[:space:]]*nobody is not present in /etc/ssh/sshd_config
5.2.18_sshd_limit_access  [ KO ] Check Failed
6.1.13_find_suid_files    [ KO ] Some suid files are present
6.1.13_find_suid_files    [ KO ]  /usr/lib/dbus-1.0/dbus-daemon-launch-helper /usr/sbin/exim4 
6.1.13_find_suid_files    [ KO ] Check Failed
6.1.14_find_sgid_files    [ KO ] Some sgid files are present
6.1.14_find_sgid_files    [ KO ]  /usr/bin/dotlock.mailutils 
6.1.14_find_sgid_files    [ KO ] Check Failed
99.1.1.23_disable_usb_dev [ KO ] ACTION=="add", SUBSYSTEMS=="usb", TEST=="authorized_default", ATTR{authorized_default}="0" is not present in /etc/udev/rules.d
99.1.1.23_disable_usb_dev [ KO ] Check Failed
99.5.2.1_ssh_auth_pubk_on [ KO ] ^PasswordAuthentication[[:space:]]+no is not present in /etc/ssh/sshd_config
99.5.2.1_ssh_auth_pubk_on [ KO ] ^KbdInteractiveAuthentication[[:space:]]+no is not present in /etc/ssh/sshd_config
99.5.2.1_ssh_auth_pubk_on [ KO ] ^KerberosAuthentication[[:space:]]+no is not present in /etc/ssh/sshd_config
99.5.2.1_ssh_auth_pubk_on [ KO ] ^GSSAPIAuthentication[[:space:]]+no is not present in /etc/ssh/sshd_config
99.5.2.1_ssh_auth_pubk_on [ KO ] ^GSSAPIKeyExchange[[:space:]]+no is not present in /etc/ssh/sshd_config
99.5.2.1_ssh_auth_pubk_on [ KO ] Check Failed
99.5.2.3_ssh_disable_feat [ KO ] ^AllowStreamLocalForwarding[[:space:]]*no is not present in /etc/ssh/sshd_config
99.5.2.3_ssh_disable_feat [ KO ] ^PermitTunnel[[:space:]]*no is not present in /etc/ssh/sshd_config
99.5.2.3_ssh_disable_feat [ KO ] ^PermitUserRC[[:space:]]*no is not present in /etc/ssh/sshd_config
99.5.2.3_ssh_disable_feat [ KO ] ^GatewayPorts[[:space:]]*no is not present in /etc/ssh/sshd_config
99.5.2.3_ssh_disable_feat [ KO ] Check Failed
```
