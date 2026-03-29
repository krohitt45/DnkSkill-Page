$files = @("index.html", "training.html")
foreach ($file in $files) {
    if (Test-Path $file) {
        $content = Get-Content $file -Raw

        # Target the Register Now href and append #enrollmentForm
        $pattern = '<a href="course-details\.html"([^>]*>\s*Register Now\s*</a>)'
        
        $newBtn = '<a href="course-details.html#enrollmentForm"$1'
            
        $content = [regex]::Replace($content, $pattern, $newBtn)
        Set-Content $file -Value $content
    }
}
