Add-Type -AssemblyName System.Drawing
$bmp = New-Object System.Drawing.Bitmap 1152, 851
$g = [System.Drawing.Graphics]::FromImage($bmp)
$g.Clear([System.Drawing.Color]::FromArgb(0,0,0,0))
$pen = New-Object System.Drawing.Pen([System.Drawing.Color]::White, 3)
for ($i = 0; $i -lt 5; $i++) {
    $x = 200 + $i * 200
    $g.DrawRectangle($pen, $x, 300, 80, 200)
    $g.DrawEllipse($pen, $x + 10, 270, 60, 60)
}
$bmp.Save('C:\ali\assets\mics.png', [System.Drawing.Imaging.ImageFormat]::Png)
$g.Dispose()
$bmp.Dispose()
Write-Host 'Created mics.png placeholder'