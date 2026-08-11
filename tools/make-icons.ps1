# Generates the Numberscape app icons as PNGs using .NET System.Drawing.
# Run from the repo root:  powershell -ExecutionPolicy Bypass -File tools\make-icons.ps1
#
# The mark is four bars in a skyline profile — a "scape" of numbers — in the site
# palette on the site's near-black. Flat colour, no gradients, so it stays crisp
# at 48px. A monotonic staircase was tried first but read as a generic growth
# chart and left the top-left corner dead; the skyline centres the visual mass.

Add-Type -AssemblyName System.Drawing

$BG      = '#0a0c11'
$COLOURS = @('#2ec4b6', '#4895ef', '#ffc857', '#ff5d73')   # teal, blue, amber, coral
$HEIGHTS = @(0.55, 1.00, 0.70, 0.86)                        # fraction of content height
$OutDir  = Join-Path $PSScriptRoot '..'

function New-RoundedPath {
    param([single]$x, [single]$y, [single]$w, [single]$h, [single]$r)
    $p = New-Object System.Drawing.Drawing2D.GraphicsPath
    if ($r -le 0.5) {
        $p.AddRectangle((New-Object System.Drawing.RectangleF($x, $y, $w, $h)))
        return $p
    }
    $r = [Math]::Min($r, [Math]::Min($w, $h) / 2)
    $d = $r * 2
    $p.AddArc($x,          $y,          $d, $d, 180, 90)
    $p.AddArc($x + $w - $d, $y,          $d, $d, 270, 90)
    $p.AddArc($x + $w - $d, $y + $h - $d, $d, $d,   0, 90)
    $p.AddArc($x,          $y + $h - $d, $d, $d,  90, 90)
    $p.CloseFigure()
    return $p
}

function New-Icon {
    param(
        [int]$Size,
        [string]$File,
        [double]$ContentFrac,   # how much of the square the bars occupy
        [double]$CornerFrac     # background corner radius, 0 = full-bleed square
    )

    $bmp = New-Object System.Drawing.Bitmap($Size, $Size, ([System.Drawing.Imaging.PixelFormat]::Format32bppArgb))
    $g   = [System.Drawing.Graphics]::FromImage($bmp)
    $g.SmoothingMode     = [System.Drawing.Drawing2D.SmoothingMode]::AntiAlias
    $g.InterpolationMode = [System.Drawing.Drawing2D.InterpolationMode]::HighQualityBicubic
    $g.Clear([System.Drawing.Color]::Transparent)

    # background plate
    $bgBrush = New-Object System.Drawing.SolidBrush ([System.Drawing.ColorTranslator]::FromHtml($BG))
    $bgPath  = New-RoundedPath 0 0 $Size $Size ($Size * $CornerFrac)
    $g.FillPath($bgBrush, $bgPath)
    $bgPath.Dispose(); $bgBrush.Dispose()

    # bars, bottom-aligned inside a centred content box
    $cw   = $Size * $ContentFrac
    $ch   = $Size * $ContentFrac
    $x0   = ($Size - $cw) / 2
    $base = ($Size - $ch) / 2 + $ch          # bottom edge of the content box

    $gap   = $cw * 0.085
    $barW  = ($cw - 3 * $gap) / 4
    $radius = $barW * 0.30

    for ($i = 0; $i -lt 4; $i++) {
        $h = $ch * $HEIGHTS[$i]
        $x = $x0 + $i * ($barW + $gap)
        $y = $base - $h
        $brush = New-Object System.Drawing.SolidBrush ([System.Drawing.ColorTranslator]::FromHtml($COLOURS[$i]))
        $path  = New-RoundedPath $x $y $barW $h $radius
        $g.FillPath($brush, $path)
        $path.Dispose(); $brush.Dispose()
    }

    $target = Join-Path $OutDir $File
    $bmp.Save($target, [System.Drawing.Imaging.ImageFormat]::Png)
    $g.Dispose(); $bmp.Dispose()

    $bytes = (Get-Item $target).Length
    Write-Output ("{0,-28} {1,4}x{1,-4} {2,7} bytes" -f $File, $Size, $bytes)
}

# "any" icons: rounded plate, generous content
New-Icon -Size 192 -File 'icon-192.png'          -ContentFrac 0.62 -CornerFrac 0.22
New-Icon -Size 512 -File 'icon-512.png'          -ContentFrac 0.62 -CornerFrac 0.22

# maskable: full-bleed square, content kept inside the ~40% safe-zone circle
# (a square inscribed in that circle is ~56% of the icon width)
New-Icon -Size 512 -File 'icon-maskable-512.png' -ContentFrac 0.50 -CornerFrac 0.0
New-Icon -Size 192 -File 'icon-maskable-192.png' -ContentFrac 0.50 -CornerFrac 0.0

# iOS home screen: full-bleed, iOS applies its own rounding
New-Icon -Size 180 -File 'apple-touch-icon.png'  -ContentFrac 0.60 -CornerFrac 0.0
