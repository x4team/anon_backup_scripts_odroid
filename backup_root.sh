#!/bin/bash
ENV=/root/.bashrc
NOW=$(date +"%F"_"%H"-"%M")
BACKUPDIR="/srv/dev-disk-by-label-DOCUMENTS/anon/odroid/backup/root/$NOW"
TARDIR="root"
CDDIR="/"

TAR="/bin/tar"
LOGGER="/bin/logger"
FIND="/usr/bin/find"
CRONTAB="/usr/bin/crontab"
DAY=$(date +%e)

# make sure backup directory exists
[ ! -d $BACKUPDIR ] && mkdir -p ${BACKUPDIR}



# Log backup start time in /var/log/messages
$LOGGER "$0: *** ${DOMAIN} ${BKDIR} Backup started @ $(date) ***"

# Backup names
BFILE="$NOW.tar.gz"

# Backup websever dirs
$TAR  -zcvf ${BACKUPDIR}/${BFILE} -C ${CDDIR} "${TARDIR}"

# Log backup end time in /var/log/messages
$LOGGER "$0: *** ${DOMAIN} ${BKDIR} Backup Ended @ $(date) ***"
