#$MediaPlayer = [Windows.Media.Playback.MediaPlayer, Windows.Media, ContentType = WindowsRuntime]::New()
#$MediaPlayer.Source = [Windows.Media.Core.MediaSource]::CreateFromUri('https://nyanpass.com/nyanpass.mp3')
#$MediaPlayer.Play()

Add-Type –assemblyName PresentationFramework
$mp=New-Object System.Windows.Controls.MediaElement
$mp.Source=New-Object System.Uri("https://nyanpass.com/nyanpass.mp3")
$mp.UnloadedBehavior='Manual'
$mp.Position=New-Object System.TimeSpan(0, 0, 0, 30, 0)
$mp.Volume = 1

$mp.Add_MediaOpened({
    # Start playing the audio once it's opened
    $mediaElement.Play()
})

# Handle errors
$mp.Add_MediaFailed({
    Write-Host "Error loading media: $($_.ErrorException.Message)"
})

while ($mp.Position -lt $mp.NaturalDuration.TimeSpan) {
    Start-Sleep -Seconds 1
}
