$files = @("index.html", "training.html")
foreach ($file in $files) {
    if (Test-Path $file) {
        $content = Get-Content $file -Raw

        # The pattern to map the entire dual-button div block
        $pattern = '(?s)<div class="grid grid-cols-1 min-\[400px\]:grid-cols-2 gap-3">.*?</div>'
        
        $newBtn = '<div class="w-full mt-1">
              <a href="course-details.html"
                class="w-full block text-center bg-primary text-primary-foreground py-2 rounded-lg font-bold hover:opacity-90 transition-opacity text-[15px] shadow-sm">
                Enroll Now
              </a>
            </div>'
            
        $content = [regex]::Replace($content, $pattern, $newBtn)
        Set-Content $file -Value $content
    }
}
