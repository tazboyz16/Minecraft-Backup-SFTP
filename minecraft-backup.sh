#!/bin/sh

#needs to be based on sftp  pushing from minecraft server to home ftp server
#https://www.jscape.com/blog/setting-up-sftp-public-key-authentication-command-line

date=$(date '+%Y%m%d')
sftpkey='.ssh/id_rsa...'
ftpserver='00.00.00.00'
ftpuser='SoMe-Kindof-Password!'

#BungeeCord '/home/Minecraft/Bungee'
#Hub '/home/Minecraft/Hub'
#Survival-1.17 '/home/Minecraft/Survival_1.17'
#Skyblock '/home/Minecraft/Skyblock'

servera='Bungee'
serverb='Hub'
serverc='Survival_1.17'
serverd='Skyblock'

#tar options
excludedstring='--exclude"" --exclude=""'
tarsavedir='/home/root'

function SFTPpush {
echo "Sending backup $tarfile to FTP Server..."
sftp -i $sftpkey $tarfile $ftpuser@$ftpserver:~
}

case $1 in

(-h|-help)
echo "./$(basename $0) $backup servername"
exit 0
;;
(-bungee|-Bungee|Bungee)
tarfile="$tarsavedir/$servera-$date.tar"
tar $excludedstring cf $tarsavedir $tarfile
SFTPpush 
exit 0
;;
(-hub|-Hub|Hub)
tarfile="$tarsavedir/$serverb-$date.tar"
tar $excludedstring cf $tarsavedir $tarfile
SFTPpush
exit 0
;;
(-survival|-Survival|Survival)
tarfile="$tarsavedir/$serverc-$date.tar"
tar $excludedstring cf $tarsavedir $tarfile
SFTPpush
exit 0
;;
(-skyblock|-Skyblock|Skyblock)
tarfile="$tarsavedir/$serverd-$date.tar"
tar $excludedstring cf $tarsavedir $tarfile
SFTPpush
exit 0
;;
*)
echo "Invalid Entry! Exiting"
exit 200
;;
esac
