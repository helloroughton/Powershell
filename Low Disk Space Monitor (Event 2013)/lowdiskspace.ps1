# --------------------------------------------
# Generates an e-mail if Event ID 2013 occurs
# --------------------------------------------
 
$event = get-winevent -FilterHashtable @{Logname='System';ID=2013} -MaxEvents 1
 
if ($event.ID -eq "2013")
{
    $PCName = $env:COMPUTERNAME
    $EmailBody = $event | format-list -property * | out-string
    $EmailFrom = "$PCName <alert@company.com>"
    $EmailTo = "it@company.com", "support@company.com" 
    $EmailSubject = "Attention: Low disk space on $PCName"
    $SMTPServer = "192.168.0.25"
    Write-host "Sending Email"
    Send-MailMessage -From $EmailFrom -To $EmailTo -Subject $EmailSubject -body $EmailBody -SmtpServer $SMTPServer
}
else
{
    write-host "No error found"
    write-host "Here is the log entry that was inspected:"
    $event
}
