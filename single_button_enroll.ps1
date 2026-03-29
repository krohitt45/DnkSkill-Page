$files = @("index.html", "training.html")
foreach ($file in $files) {
    if (Test-Path $file) {
        $content = Get-Content $file -Raw

        # The pattern to match the entire dual-button block
        $pattern = '(?s)<div class="grid grid-cols-1 min-\[400px\]:grid-cols-2 gap-3">.*?</div>'
        
        $newBtn = '<div class="w-full mt-2">
              <a href="course-details.html"
                class="w-full block text-center bg-primary text-primary-foreground py-2 rounded-lg font-bold hover:opacity-90 transition-opacity text-[15px] shadow-sm">
                Enroll Now
              </a>
            </div>'
            
        $content = [regex]::Replace($content, $pattern, $newBtn)
        Set-Content $file -Value $content
    }
}

# Update courses.html to say "Enroll Now" instead of "Learn More"
if (Test-Path "courses.html") {
    $content = Get-Content "courses.html" -Raw
    $pattern = '(?i)>Learn More</a>'
    $newBtn = '>Enroll Now</a>'
    $content = [regex]::Replace($content, $pattern, $newBtn)
    Set-Content "courses.html" -Value $content
}
