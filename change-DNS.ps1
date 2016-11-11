#####################################
### CSV Template: name, ip, replace
### if entry need replacement, put an r in replace col
#####################################

$l=Import-Csv .\ip-list.csv

$DNSserver = 'srvName'
$dnsZone = 'dom.local'

$l | %{
    if ($_.replace -eq "r") {
        dnscmd $DNSserver /RecordAdd $dnsZone $_.name A $_.ip
        dnscmd $DNSserver /RecordDelete $dnsZone $_.name A $_.ip
    }
    else {
        dnscmd $DNSserver /RecordAdd $dnsZone $_.name A $_.ip
    }
}

