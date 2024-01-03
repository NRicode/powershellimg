# Load the required assembly
Add-Type -AssemblyName System.Windows.Forms

# Create a form
$form = New-Object Windows.Forms.Form
$form.Text = "Audio Player"
$form.Width = 800
$form.Height = 600

$soundUrl = "https://cdn.pixabay.com/download/audio/2022/03/09/audio_fb0098c6da.mp3?filename=emergency-alarm-with-reverb-29431.mp3"

$webClient = New-Object System.Net.WebClient
$soundData = $webClient.DownloadData($soundUrl)

$memoryStream = New-Object System.IO.MemoryStream
$memoryStream.Write($soundData, 0, $soundData.Length)
$memoryStream.Seek(0, [System.IO.SeekOrigin]::Begin)  # Reset the stream position to the beginning

$soundPlayer = New-Object System.Media.SoundPlayer
$soundPlayer.Stream = $memoryStream
$soundPlayer.Play()

# Clean up resources when the form is closed
$form.Add_FormClosed({
    $soundPlayer.Dispose()
    $webClient.Dispose()
    $stream.Dispose()
    $soundPlayer.Dispose()
    Remove-Item -Path $tempFilePath -ErrorAction SilentlyContinue
})

# Show the form
$form.ShowDialog()
