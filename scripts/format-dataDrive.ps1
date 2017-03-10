Initialize-Disk -Number 1 -PartitionStyle GPT 
New-Partition -DiskNumber 1 -DriveLetter E -UseMaximumSize
Format-Volume -DriveLetter E -FileSystem NTFS -NewFileSystemLabel "Data" -Confirm:$false