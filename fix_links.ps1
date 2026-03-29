$files = @("index.html", "training.html", "courses.html")
foreach ($file in $files) {
    if (Test-Path $file) {
        $content = Get-Content $file -Raw
        
        # Replace href="#" for Learn More links
        $oldPattern1 = '<a\s+href="[^"]*"(?=[^>]*>\s*Learn More)'
        $newPattern1 = '<a href="course-details.html"'
        $content = [regex]::Replace($content, $oldPattern1, $newPattern1, [System.Text.RegularExpressions.RegexOptions]::IgnoreCase)

        # Replace href="#enroll" for Register Now buttons in courses.html
        $oldPattern2 = '<a\s+href="#enroll"(?=[^>]*>\s*Register\s*Now)'
        $newPattern2 = '<a href="course-details.html"'
        $content = [regex]::Replace($content, $oldPattern2, $newPattern2, [System.Text.RegularExpressions.RegexOptions]::IgnoreCase)
        
        Set-Content $file -Value $content
    }
}
