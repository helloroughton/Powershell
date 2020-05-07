#Gets today's date and adds 5 days (adjust for your retention policy)
$start = (get-date).AddDays(-5)

#Change dir to IIS log files
cd c:\inetpub\logs\logfiles\w3svc1

#Gets all child items where the last write time is older than 5 days and deletes them
Get-ChildItem | where {$PSItem.LastWriteTime -lt $start} | Remove-Item
