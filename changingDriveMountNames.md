Rename Mounted Drives on Boot
To rename a mounted drive and ensure the change persists on boot, you can use the label feature in Linux. First, find the device name of the drive using commands like lsblk or findmnt. Then, use the e2label or dosfslabel command to set a new label for the filesystem.

jku@jkMain:~$ lsblk
NAME   MAJ:MIN RM   SIZE RO TYPE MOUNTPOINTS
sda      8:0    0 223.6G  0 disk 
├─sda2   8:2    0  55.9G  0 part /
├─sda3   8:3    0  93.1G  0 part /home
├─sda4   8:4    0  52.2G  0 part /media/jku/daily-driver
└─sda5   8:5    0  21.5G  0 part [SWAP]
sdb      8:16   0   9.1T  0 disk 
├─sdb1   8:17   0   4.6T  0 part /mnt/usb-WD_easystore_25FB_313647323542575A-0:0-part1
└─sdb2   8:18   0   4.5T  0 part /mnt/usb-WD_easystore_25FB_313647323542575A-0:0-part2

jku@jkMain:~$ df -h 
/dev/sdb1 4.6T  204G  4.2T   5% /mnt/usb-WD_easystore_25FB_313647323542575A-0:0-part1 bak 
/dev/sdb2 4.5T  387G  3.9T   9% /mnt/usb-WD_easystore_25FB_313647323542575A-0:0-part2 vm 

sudo e2label /dev/sdb1 bak
sudo e2label /dev/sdb2 vm 

To ensure the drive mounts automatically on boot with the new label, you need to add an entry to the /etc/fstab file. The entry should look like this: 
  UUID=<UUID_of_the_drive> /mnt/new_mount_point ext4 defaults 0 2 or LABEL=new_label /mnt/new_mount_point ext4 defaults 0 2, where UUID or LABEL is used to uniquely identify the drive, and /mnt/new_mount_point is the directory where the drive will be mounted.

For persistent device naming, especially on cloud VMs, it is recommended to use the persistent disk ID or symlinks provided by the cloud provider. These symlinks are located in /dev/disk/by-id and ensure that the device name remains consistent across reboots.

If you encounter issues with /etc/fstab causing boot problems, you can use a cron job to mount the drive after boot. Add a @reboot entry in the root's crontab to run a script that mounts the drive.

Labeling and Mounting: Use e2label or dosfslabel to set a new label for the filesystem and add an entry to /etc/fstab to mount it on boot
 [5].
Persistent Device Naming: Use symlinks in /dev/disk/by-id to ensure consistent device names across reboots.
Cron Job: Use @reboot in the crontab to mount the drive after boot if /etc/fstab causes issues.