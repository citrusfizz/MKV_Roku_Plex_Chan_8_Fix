<# 
.SYNOPSIS 
Changes MKV Metadata To allow Audio Play without Trancode on Roku Via Plex
 
.DESCRIPTION 
Make sure to have MKVToolNix Tools installed and change the location in this script!
 
.PARAMETER FolderPath 
The folder path to search. 
 
.EXAMPLE 
PS> .\MKVRokuPlexChan8Fix.ps1 -FolderPath 'm:\media\Movies' 

#> 


param 
( 
    [parameter()][string] $FolderPath 
) 

# Change $$MKVToolNixPath to where your MKVToolNix Directory resides. Or where mkvinfo.exe and mkvproedit.ext resides.
# If you need to download it,  go here https://www.fosshub.com/MKVToolNix.html
$MKVToolNixPath = "C:\Program Files\MKVToolNix\"



$Result = (Test-Path($FolderPath)); 
 
If ($Result) 
{ 
    $Dir = get-childitem $FolderPath -recurse 
    $List = $Dir | where {$_.extension -eq ".mkv"} 

    foreach ($movie in $list){ 
   $contains = & "$MKVToolNixPath\mkvinfo.exe"  $movie.FullName | Select-String -Pattern "Channels: 8" -Quiet
  
   if ($contains -eq $true) {
   Write-Host ""
   Write-Host "Found File: " $movie.FullName
   Write-Host "Editing...."
   Write-Host
   & "$MKVToolNixPath\mkvpropedit.exe" --edit track:2 -s channels=6 $movie.FullName
   $res = & "$MKVToolNixPath\mkvinfo.exe"  $movie.FullName | Select-String -Pattern "Channels: 8" -Quiet
   if ($res -ne $true){
   write-host $movie.Name ": success"
   }
   }
   
   }

    }
else 
{ 
    "Folder path is incorrect." 
} 
 
function TestPath()  
{ 
    $FileExists = Test-Path $FolderPath 
    If ($FileExists -eq $True)  
    { 
        Return $true 
    } 
    Else  
    { 
        Return $false 
    } 
}