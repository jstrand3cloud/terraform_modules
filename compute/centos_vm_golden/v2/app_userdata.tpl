#!/bin/bash
MYNAME=${hostname}

# Don't change anything below this line.
####################################

DJUSER=domainjoin@azure.w-energy.net
DJPASS=${domain_join_password}

# set hostname
hostnamectl set-hostname $MYNAME.azure.w-energy.net --static

# join domain
echo $DJPASS|realm join -U $DJUSER azure.w-energy.net