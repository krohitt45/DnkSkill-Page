$file = "training.html"
if (Test-Path $file) {
    $content = Get-Content $file -Raw
    $pattern = '<div class=\"grid grid-cols-2 gap-3\">\s*<a href=\"course-details\.html\"[^>]*>\s*Learn More\s*<\/a>\s*<a href=\"course-details\.html\"[^>]*>\s*Register Now\s*<\/a>\s*<\/div>'
    $newBtn = '<div class="w-full mt-2">
              <a href="course-details.html"
                class="w-full block text-center bg-primary text-primary-foreground py-2 rounded-lg font-bold hover:opacity-90 transition-opacity text-sm shadow-sm">
                Learn More
              </a>
            </div>'
    $content = [regex]::Replace($content, $pattern, $newBtn)
    Set-Content $file -Value $content
}
