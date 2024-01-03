# Load the required assembly for Windows Forms
Add-Type -AssemblyName System.Windows.Forms

# Load the required assembly for handling media
Add-Type -AssemblyName PresentationCore

# Create a form
$form = New-Object Windows.Forms.Form
$form.Text = "Sound Player"
$form.Width = 400
$form.Height = 100

$MediaPlayer = [Windows.Media.Playback.MediaPlayer, Windows.Media, ContentType = WindowsRuntime]::New()
$MediaPlayer.Source = [Windows.Media.Core.MediaSource]::CreateFromUri('https://nyanpass.com/nyanpass.mp3')
$MediaPlayer.Play()

$form.ShowDialog()

# Clean up resources
#MediaPlayer.Dispose();
$form.Dispose()
