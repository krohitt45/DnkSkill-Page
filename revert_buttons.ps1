$files = @("index.html", "training.html")
foreach ($file in $files) {
    if (Test-Path $file) {
        $content = Get-Content $file -Raw

        # The pattern for the new single button we added
        # Using [regex]::Escape is hard for multi-line, so I'll assemble a cleaner capture.
        $pattern = '<div class="w-full mt-2">\s*<a href="course-details\.html"\s*class="w-full block text-center bg-primary text-primary-foreground py-2 rounded-lg font-bold hover:opacity-90 transition-opacity text-sm shadow-sm">\s*Learn More\s*<\/a>\s*<\/div>'
        
        $newBtn = '<div class="grid grid-cols-1 min-[400px]:grid-cols-2 gap-3">
              <a href="course-details.html"
                class="w-full flex items-center justify-center border-2 border-primary text-primary py-2 rounded-lg font-bold hover:bg-primary/5 transition-colors text-sm shadow-sm">
                Learn More
              </a>
              <a href="course-details.html"
                class="w-full flex items-center justify-center bg-primary text-primary-foreground py-2 rounded-lg font-bold hover:opacity-90 transition-opacity text-sm border-2 border-primary shadow-sm">
                Register Now
              </a>
            </div>'
            
        $content = [regex]::Replace($content, $pattern, $newBtn)
        Set-Content $file -Value $content
    }
}
