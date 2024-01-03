#$MediaPlayer = [Windows.Media.Playback.MediaPlayer, Windows.Media, ContentType = WindowsRuntime]::New()
#$MediaPlayer.Source = [Windows.Media.Core.MediaSource]::CreateFromUri('https://nyanpass.com/nyanpass.mp3')
#Write-Host "Hello, World!"
#$MediaPlayer.Play()

# Clean up resources
#$MediaPlayer.Dispose()

# Create MediaPlayer object
$MediaPlayer = [Windows.Media.Playback.MediaPlayer, Windows.Media, ContentType = WindowsRuntime]::New()

# Create MediaSource from URI
$MediaSource = [Windows.Media.Core.MediaSource]::CreateFromUri('https://nyanpass.com/nyanpass.mp3')

# Event handler for MediaOpened event
$MediaOpenedEventHandler = {
    Write-Host "Media source opened successfully. Now playing."
    $MediaPlayer.Play()
}

# Add the event handler to the MediaOpened event
Register-ObjectEvent -InputObject $MediaPlayer -EventName MediaOpened -SourceIdentifier MediaOpenedEvent -Action $MediaOpenedEventHandler

# Set the source for MediaPlayer
$MediaPlayer.Source = $MediaSource

Write-Host "Hello, World!"

# Wait for the MediaOpened event to be triggered before proceeding
Wait-Event -SourceIdentifier MediaOpenedEvent | Out-Null

# Clean up resources
Unregister-Event -SourceIdentifier MediaOpenedEvent
$MediaPlayer.Dispose()
