<powershell>
    # Variables to edit
    #echo "${hostname}" > c:\max.txt
    echo "${hostname}" > C:\ProgramData\Amazon\EC2-Windows\Launch\Log\w_instance.log
    echo $env:COMPUTERNAME >> C:\ProgramData\Amazon\EC2-Windows\Launch\Log\w_instance.log
    $hostname = "${hostname}"
    $client = "${client}"
    $timezone = "Central Standard Time"
    $domianjoinpass = "${domain_join_password}"
    # Script Variables
    $domain = "we.aws"
    $ouPath = "OU=$client,OU=Clients,OU=Computers,OU=weaws,DC=we,DC=aws"
    $admin = "domainjoin@we.aws"
    $password = ConvertTo-SecureString -String $domianjoinpass -AsPlainText -Force
    $credential = [PSCredential]::New($admin,$password)
    # Set Timezone to Central
    Set-TimeZone $timezone
    # Disable Scheduled Task
    $ScheduledTask = Get-ScheduledTask -TaskName "Amazon Ec2 Launch - Disk Initialization" -ErrorAction SilentlyContinue
    if ($ScheduledTask){
        $ScheduledTask | Disable-ScheduledTask
    }
    # Rename computer and Join WE.AWS domain
    Add-Computer -Domain $domain -NewName $hostname -Credential $credential -OUPath $ouPath -Force | Out-File C:\ProgramData\Amazon\EC2-Windows\Launch\Log\w_instance.log -Append
    # Restart computer
    Restart-Computer -Force
    </powershell>