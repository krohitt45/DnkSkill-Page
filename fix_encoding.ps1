$files = @("index.html", "about.html", "courses.html", "training.html", "course-details.html")

foreach ($file in $files) {
    if (Test-Path $file) {
        $content = [System.IO.File]::ReadAllText("$PWD\$file", [System.Text.Encoding]::UTF8)

        # Fix Copyright 
        $content = $content.Replace("Ac 2026", "&copy; 2026")
        
        # We know that the copyright sometimes became a weird sequence of 'A' and 'c' or 'Â©', but let's just use regex for 'Ac 2026' or 'A. 2026'.
        $content = [regex]::Replace($content, "A. 2026", "&copy; 2026")

        # Fix Bullet point
        $content = $content.Replace("<span>?</span>", "<span>&bull;</span>")

        [System.IO.File]::WriteAllText("$PWD\$file", $content, [System.Text.Encoding]::UTF8)
        Write-Host "Fixed encoding for $file"
    }
}

# Now explicitly fix generate_pages.ps1 to use UTF8
$genPage = "$PWD\generate_pages.ps1"
if (Test-Path $genPage) {
    $genContent = Get-Content $genPage -Raw
    # Update Get-Content
    $genContent = $genContent.Replace('Get-Content "course-details.html" -Raw', 'Get-Content "course-details.html" -Raw -Encoding UTF8')
    # Update Set-Content
    $genContent = $genContent.Replace('Set-Content $filename -Value $html', 'Set-Content $filename -Value $html -Encoding UTF8')
    Set-Content $genPage -Value $genContent -Encoding UTF8
    Write-Host "Updated generate_pages.ps1 to use UTF8 explicitly"
}

# Run the generator to reconstruct all course pages properly
if (Test-Path $genPage) {
    powershell -ExecutionPolicy Bypass -File .\generate_pages.ps1
    Write-Host "Regenerated course pages with corrected encoding and layout."
}
