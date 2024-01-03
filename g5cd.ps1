$MediaPlayer = [Windows.Media.Playback.MediaPlayer, Windows.Media, ContentType = WindowsRuntime]::New()
$MediaPlayer.Source = [Windows.Media.Core.MediaSource]::CreateFromUri('https://nyanpass.com/nyanpass.mp3')
Write-Host "Hello, World!"
$MediaPlayer.Play()

# Clean up resources
#$MediaPlayer.Dispose()
