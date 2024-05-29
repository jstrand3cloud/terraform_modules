# set hostname
hostnamectl set-hostname $vmname.azure.w-energy.net --static


# join domain
echo $DJPASS|realm join -U $DJUSER azure.w-energy.net

