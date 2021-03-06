# name : mrip.ps1
# author : trenton stiles
# description : uses youtube-dl with preset parameters to rip music extracted
#               from any video supported by youtube-dl's extraction list. To
#               find what websites that are supported besides youtube visit
#               "https://github.com/ytdl-org/youtube-dl/tree/master/youtube_dl/extractor"

param(
    [switch] $playlist
)

write-host -fore green ' __       __  _______   ______  _______   _______    ______     __   
/  \     /  |/       \ /      |/       \ /       \  /      \  _/  |  
$$  \   /$$ |$$$$$$$  |$$$$$$/ $$$$$$$  |$$$$$$$  |/$$$$$$  |/ $$ |  
$$$  \ /$$$ |$$ |__$$ |  $$ |  $$ |__$$ |$$ |__$$ |$$ \__$$/ $$$$ |  
$$$$  /$$$$ |$$    $$<   $$ |  $$    $$/ $$    $$/ $$      \   $$ |  
$$ $$ $$/$$ |$$$$$$$  |  $$ |  $$$$$$$/  $$$$$$$/   $$$$$$  |  $$ |  
$$ |$$$/ $$ |$$ |  $$ | _$$ |_ $$ | __   $$ |      /  \__$$ | _$$ |_ 
$$ | $/  $$ |$$ |  $$ |/ $$   |$$ |/  |  $$ |      $$    $$/ / $$   |
$$/      $$/ $$/   $$/ $$$$$$/ $$/ $$/   $$/        $$$$$$/  $$$$$$/'
write-host ""
write-host ""
write-host ""

[bool] $fatal_error = $false

############## CHECK IF REQUIRED PROGRAMS EXIST ##############
try
{
    get-command youtube-dl.exe | out-null
}
catch
{
    $fatal_error = $true
    write-host -fore yellow "Install youtube-dl.exe and add to path"
    write-host -fore yellow "https://ytdl-org.github.io/youtube-dl/index.html"
    write-host -fore yellow "or if python3 is installed :"
    write-host -fore yellow "pip install youtube-dl "
}

try
{
    get-command ffmpeg | out-null
}
catch
{
    $fatal_error = $true
    write-host -fore yellow "Install ffmpeg.exe and add to path"
    write-host -fore yellow "https://www.ffmpeg.org/download.html"
}

if($fatal_error){exit}

############## CHECK IF REQUIRED PROGRAMS EXIST ##############

############## MAIN LOGIC ##############

if(!$playlist)
{
    foreach($arg in $args)
    {
        write-host -fore green "downloading : " $arg
        youtube-dl.exe -i -x --audio-format mp3 --audio-quality 0 --no-playlist $arg | out-null
        write-host -fore green "success"
    }
}
else
{
    foreach($arg in $args)
    {
        write-host -fore green "downloading playlist : " $arg
        youtube-dl.exe -i -x --audio-format mp3 --audio-quality 0 --yes-playlist $arg | out-null
        write-host -fore green "success"
    }
}

############## MAIN LOGIC ##############