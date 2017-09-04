#!/bin/bash
################################################################################################################################
# Name:		sysupdates.sh
# Author:	Nimda Dam
# Created:	July 17, 2017
# Modified:	July 17, 2017 (110100100)
#
# This script will update, upgrade and autoremove outdated or obsolete
# software packages install on kali repositories via the sources.list
#
# 	1) Updates the sources.list database
# 	2) Updates the installed packages on the system
# 	3) Upgrades available installed packages on the system
# 	4) Upgrades distribution packages that on the system
# 	5) Removes obsolete packagess and dependences on the sytem
# 	6) Updates the sources.list database
#       7) Display Return Code
#
# upgrade
#  	upgrade is used to install the newest versions of all packages
#   currently installed on the system from the sources enumerated in
#   /etc/apt/sources.list. Packages currently installed with new
#   versions available are retrieved and upgraded; under no
#   circumstances are currently installed packages removed, or packages
#   not already installed retrieved and installed. New versions of
#   currently installed packages that cannot be upgraded without
#   changing the install status of another package will be left at
#   their current version. An update must be performed first so that
#   apt-get knows that new versions of packages are available.
#
# dist-upgrade
#   dist-upgrade in addition to performing the function of upgrade,
#   also intelligently handles changing dependencies with new versions
#   of packages; apt-get has a "smart" conflict resolution system, and
#   it will attempt to upgrade the most important packages at the
#   expense of less important ones if necessary. So, dist-upgrade
#   command may remove some packages. The /etc/apt/sources.list file
#   contains a list of locations from which to retrieve desired package
#   files. See also apt_preferences(5) for a mechanism for overriding
#   the general settings for individual packages.
#
# full-upgrade
#   full-upgrade performs the function of upgrade but may also remove
#   installed packages if that is required in order to resolve a
#   package conflict.
#
################################################################################################################################
#                                                     Logging
################################################################################################################################
#  LOGFILE=/var/log/instlog_updates
#  exec &>>(tee -a "$LOGFILE")
#  echo "`date +%H:%M:%S : Starting Kali Add Repo Script" >> $LOGFILE
#
# exec 3>&1 4>&2
# trap 'exec 2>&4 1>&3' 0 1 2 3
# exec 1>>updatefile.log 2>&1
# Everything below will go to the file 'updatefile.log':
#
################################################################################################################################
#
 clear
 sudo apt-get update &&
 echo $? &&
 sleep 3 &&
 clear && 
 sudo apt-get upgrade -y && 
 echo $? &&
 sleep 3 && 
 clear && 
 sudo apt-get dist-upgrade -y && 
 echo $? &&
 sleep 3 && 
 clear && 
 sudo apt-get autoremove -y && 
 echo $? &&
 sleep 3 && 
 clear

