# Load the required assembly
Add-Type -AssemblyName System.Windows.Forms

# Create a form
$form = New-Object Windows.Forms.Form
$form.Text = "Audio Player"
$form.Width = 800
$form.Height = 600

# Create a sound player
$soundPlayer = New-Object System.Media.SoundPlayer

# Specify the URL of the audio file
$audioUrl = "https://example.com/audio.mp3"

# Download the audio file from the URL
$webClient = New-Object System.Net.WebClient
$audioData = $webClient.DownloadData($audioUrl)

# Create a temporary file to save the audio data
$tempFilePath = [System.IO.Path]::GetTempFileName() + ".wav"
[IO.File]::WriteAllBytes($tempFilePath, $audioData)

# Set the temporary file as the audio source for the sound player
$soundPlayer.SoundLocation = $tempFilePath

# Play the audio
$soundPlayer.Play()

# Clean up resources when the form is closed
$form.Add_FormClosed({
    $soundPlayer.Dispose()
    $webClient.Dispose()
    Remove-Item -Path $tempFilePath -ErrorAction SilentlyContinue
})

# Show the form
$form.ShowDialog()
