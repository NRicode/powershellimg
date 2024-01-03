$MediaPlayer = [Windows.Media.Playback.MediaPlayer, Windows.Media, ContentType = WindowsRuntime]::New()
$MediaPlayer.Source = [Windows.Media.Core.MediaSource]::CreateFromUri('https://nyanpass.com/nyanpass.mp3')
Write-Host "Hello, World!"

# Register an event handler for the MediaEnded event
$MediaEndedEvent = Register-ObjectEvent -InputObject $MediaPlayer -EventName MediaEnded -Action {
    # This code will be executed when the MediaEnded event is triggered
    Write-Host "Media playback completed."
    
    # Clean up the event subscription
    Unregister-Event -SourceIdentifier $Event.SourceIdentifier
}

# Start playing the media
$MediaPlayer.Play()

# Wait for the MediaEnded event
Wait-Event -SourceIdentifier $MediaEndedEvent.SourceIdentifier | Out-Null

# Clean up resources
#$MediaPlayer.Dispose()
