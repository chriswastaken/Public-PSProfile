
Function Build-ChrisWasTakenProfile
{
 param
 (
    $CodeRoot = "$Env:SystemDrive\@Code",
    #$ProfileSource = "https://github.com/chriswastaken/Public-PSProfile"
    $ProfileSource = "https://raw.githubusercontent.com/chriswastaken/Public-PSProfile/master/Microsoft.PowerShell_profile.ps1"
 )
 #Profile
 if ( ! (Test-Path $profile) )
 {
  "Unable to find a profile @ $profile" | Write-Verbose
  
  

 }

 #CodeRoot
 if ( ! (Test-Path $CodeRoot) )
 {
  "Unable to find a code root @ $CodeRoot" | Write-Verbose
  New-Item -Path $CodeRoot -ItemType Directory -Force | out-null
  if(Test-Path $CodeRoot){"Created new root @$CodeRoot"}
 }
 $env:Path += ";$CodeRoot"
 New-PSDrive -Name Code -PSProvider FileSystem -Root $CodeRoot | out-null
 Import-Module Code:\* -ErrorAction SilentlyContinue
 #EndCodeRoot




}


