# name : thast.ps1 - textfile has text
# author : trenton stiles
# description : scans a textfile for any match of provided
#               text in the file then writes to console the
#               whole line of the text found.

Param(
    [Parameter(Mandatory=$true)]
    [string] $filepath,

    [Parameter(Mandatory=$true)]
    [string] $text
)



foreach($line in (cat $filepath))
{
    if ($line -match $text)
    {
        write-host $line
    }
}