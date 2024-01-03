# Load the required assemblies
Add-Type -AssemblyName System.Windows.Forms
Add-Type -AssemblyName System.Media

# Create a form
$form = New-Object Windows.Forms.Form
$form.Text = "Audio Player"
$form.Width = 800
$form.Height = 600

# Create a sound player
$soundPlayer = New-Object System.Media.SoundPlayer

# Specify the URL of the audio file
$audioUrl = "https://cdn.pixabay.com/download/audio/2022/03/09/audio_fb0098c6da.mp3?filename=emergency-alarm-with-reverb-29431.mp3"

# Download the audio file from the URL
$webClient = New-Object System.Net.WebClient
$audioData = $webClient.DownloadData($audioUrl)

# Create a memory stream and write the audio data to it
$memoryStream = New-Object System.IO.MemoryStream
$memoryStream.Write($audioData, 0, $audioData.Length)
$memoryStream.Seek(0, [System.IO.SeekOrigin]::Begin)  # Reset the stream position to the beginning

# Set the stream as the audio source for the sound player
$soundPlayer.Stream = $memoryStream

# Play the audio
$soundPlayer.Play()

# Clean up resources when the form is closed
$form.Add_FormClosed({
    $soundPlayer.Dispose()
    $webClient.Dispose()
    $memoryStream.Dispose()
})

# Show the form
$form.ShowDialog()
