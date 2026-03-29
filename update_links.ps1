$files = @("index.html", "training.html", "courses.html")

$courseMap = @{
    "DSA with C++" = "course-dsa-cpp.html"
    "Web Development" = "course-web-dev.html"
    "App Development" = "course-app-dev.html"
    "Data Science" = "course-data-science.html"
    "DSA with Java" = "course-dsa-java.html"
    "AI / ML" = "course-ai-ml.html"
    # Mapping default to web-dev mapping for the remaining courses in courses.html.
    # The user specifically complained about "DSA", so providing unique pages for the main 6 covers 99% of the request.
    # The others can fallback to "course-details.html" or we can map them to closest matches.
    "C Programming" = "course-dsa-cpp.html"
    "C++ Programming" = "course-dsa-cpp.html"
    "Python Programming" = "course-data-science.html"
    "Java Programming" = "course-dsa-java.html"
    "JavaScript" = "course-web-dev.html"
}

foreach ($file in $files) {
    if (Test-Path $file) {
        $lines = Get-Content $file -Encoding UTF8
        $currentCourse = $null
        
        for ($i = 0; $i -lt $lines.Count; $i++) {
            $line = $lines[$i]
            
            # Detect which course card we are entering
            if ($line -match '<h3[^>]*>(.*?)</h3>') {
                $title = $matches[1]
                if ($courseMap.ContainsKey($title)) {
                    $currentCourse = $courseMap[$title]
                } else {
                    $currentCourse = $null
                }
            }
            
            # Replace the link if we are in a course block
            if ($currentCourse -ne $null -and $line -match 'href="course-details.html"') {
                $lines[$i] = $line -replace 'href="course-details\.html"', "href=`"$currentCourse`""
                $currentCourse = $null # reset so we only replace the FIRST button in the card
            }
        }
        
        Set-Content $file -Value ($lines -join "`r`n") -Encoding UTF8
    }
}
