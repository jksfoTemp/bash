#!/bin/bash
/*
# Author
#   mapJKRGDrive.sh
#   Joseph Kelly <josephkelly.resume@gmail.com>
#   Sat Jun 1 10:30:11 PM PDT 2024
#-------------------------------------------------------------------------------
*/ What
#   To mount Google Drive as a local folder, in this implementation used as a
# bidirectional synch tool as apparently Google didn't want to provide that for
# Linux and it became a ... fun ... side project, a good exercise
#-------------------------------------------------------------------------------
# When
#   Intended to be run at boot, can be used to reconnect
#-------------------------------------------------------------------------------
# Safety
#   'should' be able to be run at any time as rclone will juust ignore the re-
# mount request if the mount is still valid; at # worst there might be a slight
# delay in synchronization
#-------------------------------------------------------------------------------
# Source
#   https://rclone.org/docs/
#-------------------------------------------------------------------------------
# TODO
#   Create/link to personal dox on how to implement rclone with Google # Drive
# and the travails thereof
#
# rclone mount JKRGDrive: /home/jku/JKRGDrive/
# Int
#

# IN PROCESS
# Use this to test execution

# date +'FORMAT'

# ### mm/dd/yyyy ###
# date +'%m/%d/%Y'

## Time in 12 hr format ###
# date +'%r'

## backup dir format ##
# backup_dir=$(date +'%m/%d/%Y')
# echo "Backup dir for today: /nas04/backups/${backup_dir}"
