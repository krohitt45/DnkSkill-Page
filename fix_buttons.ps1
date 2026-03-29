$files = @("index.html", "training.html")
foreach ($file in $files) {
    if (Test-Path $file) {
        $content = Get-Content $file -Raw
        
        # Replace the grid wrapper and buttons with a single Learn More button
        $pattern = '<div class="grid grid-cols-1 min-\[400px\]:grid-cols-2 gap-3">(?:\s*<a href="course-details\.html"\s+class="[^"]*">\s*Learn More\s*</a>\s*<a href="course-details\.html"\s+class="[^"]*">\s*Register Now\s*</a>\s*)</div>'
        
        $newBtn = '<div class="w-full mt-2">
              <a href="course-details.html"
                class="w-full block text-center bg-primary text-primary-foreground py-2 rounded-lg font-bold hover:opacity-90 transition-opacity text-sm shadow-sm">
                Learn More
              </a>
            </div>'
            
        $content = [regex]::Replace($content, $pattern, $newBtn)
        Set-Content $file -Value $content
    }
}

# Update courses.html to change Register Now -> Learn More
$courseFile = "courses.html"
if (Test-Path $courseFile) {
    $content = Get-Content $courseFile -Raw
    $oldPattern = '<a href="course-details.html"\s*class="w-full block text-center bg-primary text-primary-foreground py-2 rounded-lg font-bold hover:opacity-90 transition-opacity text-sm shadow-sm">Register\s*Now</a>'
    $newPattern = '<a href="course-details.html" class="w-full block text-center bg-primary text-primary-foreground py-2 rounded-lg font-bold hover:opacity-90 transition-opacity text-sm shadow-sm">Learn More</a>'
    
    $content = [regex]::Replace($content, $oldPattern, $newPattern)
    Set-Content $courseFile -Value $content
}
