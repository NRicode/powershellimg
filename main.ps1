# Load the required assembly
Add-Type -AssemblyName System.Windows.Forms

# Create a form
$form = New-Object Windows.Forms.Form
$form.Text = "Image Viewer"
$form.Width = 800
$form.Height = 600

# Create a picture box to display the image
$pictureBox = New-Object Windows.Forms.PictureBox
$pictureBox.Width = $form.Width
$pictureBox.Height = $form.Height
$pictureBox.SizeMode = [Windows.Forms.PictureBoxSizeMode]::Zoom

# Specify the URL of the image
$imageUrl = "https://upload.wikimedia.org/wikipedia/commons/6/61/Black_Circle.jpg"

# Download the image from the URL
$webClient = New-Object System.Net.WebClient
$imageData = $webClient.DownloadData($imageUrl)

# Create a memory stream and write the image data to it
$memoryStream = New-Object System.IO.MemoryStream
$memoryStream.Write($imageData, 0, $imageData.Length)
$memoryStream.Seek(0, [System.IO.SeekOrigin]::Begin)  # Reset the stream position to the beginning

# Create an image from the memory stream
$image = [System.Drawing.Image]::FromStream($memoryStream)

# Set the image in the picture box
$pictureBox.Image = $image

# Add the picture box to the form
$form.Controls.Add($pictureBox)

# Show the form
$form.ShowDialog()

# Clean up resources
$webClient.Dispose()
$memoryStream.Dispose()
$form.Dispose()
