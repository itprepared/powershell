CSV Template: name, ip

$l=Import-Csv .\ip-list.csv

$DNSserver = 'srvName'
$dnsZone = 'dom.local'
$l | %{Invoke-Command {
    dnscmd $DNSserver /RecordAdd $dnsZone $_.name A $_.ip
    dnscmd $DNSserver /RecordDelete $dnsZone $_.name A $_.ip
    }
}
