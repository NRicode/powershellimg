# Load the required assembly for Windows Forms
Add-Type -AssemblyName System.Windows.Forms

# Load the required assembly for handling media
Add-Type -AssemblyName PresentationCore

# Create a form
$form = New-Object Windows.Forms.Form
$form.Text = "Sound Player"
$form.Width = 400
$form.Height = 100

# Specify the URL of the sound file
$soundUrl = "https://cdn.pixabay.com/download/audio/2022/03/09/audio_fb0098c6da.mp3?filename=emergency-alarm-with-reverb-29431.mp3"

# Download the sound file from the URL
$webClient = New-Object System.Net.WebClient
$soundData = $webClient.DownloadData($soundUrl)

# Create a memory stream and write the sound data to it
$memoryStream = New-Object System.IO.MemoryStream
$memoryStream.Write($soundData, 0, $soundData.Length)
$memoryStream.Seek(0, [System.IO.SeekOrigin]::Begin)  # Reset the stream position to the beginning

# Create a Media.SoundPlayer from the memory stream
$soundPlayer = New-Object Windows.Media.SoundPlayer
$soundPlayer.Stream = $memoryStream

# Play the sound
$soundPlayer.Play()

# Add the sound player to the form
$form.Controls.Add($soundPlayer)

$form.ShowDialog()

# Clean up resources
$webClient.Dispose()
$memoryStream.Dispose()
$soundPlayer.Dispose()
$form.Dispose()
