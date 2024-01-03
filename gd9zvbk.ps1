Add-Type -AssemblyName System.Windows.Forms

$MediaPlayer = [Windows.Media.Playback.MediaPlayer, Windows.Media, ContentType = WindowsRuntime]::New()
$MediaPlayer.Source = [Windows.Media.Core.MediaSource]::CreateFromUri('https://nyanpass.com/nyanpass.mp3')
$MediaPlayer.Play()

# Create a form
$form = New-Object Windows.Forms.Form

# Set properties to hide the window
$form.Text = "Hidden Window"
$form.StartPosition = "CenterScreen"
$form.ShowInTaskbar = $false
$form.WindowState = "Minimized"

# Show the form
$form.ShowDialog()
