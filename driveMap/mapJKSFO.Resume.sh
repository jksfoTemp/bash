#!/bin/bash

# mapJKRGDrive.sh
# Joseph Kelly <JKSFO.Resume@gmail.com>
# Sat Jun 1 10:30:11 PM PDT 2024
#
# Source: https://rclone.org/docs/
#
# Mount Google Drive as a local folder, run at login
# Requires RClone installation and configuration
# Will harmlessly error out if already mapped
#
# NOTE CHANGE PATH - SUBSTITUTE USER
#
# Note: for mounting a local drive https://rclone.org/commands/rclone_mount/
#
#     To mount it as a drive:
#         Nope: rclone mount JKRGDrive: /home/user/JKSFO.Resume/
#     or silent
#         rclone mount --daemon JKRGDrive: /home/user/JKSFO.Resume/
#     unmount
#         fusermount -u /home/user/JKSFO.Resume/
#

# rclone mount --daemon JKSFO.Resume: /home/jku/JKSFO.Resume/ 
# rclone mount --daemon --daemon-wait 0 "JKSFO.Resume:" /home/jku/JKSFO.Resume/

# works but window stays open, think I need to run it as a service 
# rclone mount --daemon-wait 0 --allow-non-empty  "JKSFO.Resume:" /home/jku/JKSFO.Resume/

# Path /home/jku/MyHome/Code/projects/sandbox/bash/driveMap/
# This is what you want ... 
rclone mount --daemon --daemon-wait 0 --allow-non-empty  "JKSFO.Resume:" /home/jku/JKSFO.Resume/


#     unmount
#  fusermount -u /home/jku/JKRGDrive/
