# name : ldump.ps1
# author : trenton stiles
# description : monitors what you have in clipboard ( text you copy )
#               then dumps that text into a text file everytime you
#               you copy something new                

param(
    [string] $path 
)

# $path is location ldump text will be generated too

if( !$path )
{
    $path = "~/Desktop/ldump.txt";
}

$placeHolder = (get-clipboard);

while($true)
{
    $clipboard = (Get-Clipboard);
    if($clipboard -ne $placeHolder)
    {
        Write-Host $clipboard
        $placeHolder = $clipboard;
        echo $clipboard >> $path;

    }

    if((get-clipboard) -eq $placeHolder)
    {
        sleep -Milliseconds 200
    }
}