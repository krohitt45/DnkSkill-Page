$files = Get-ChildItem -Filter *.html

foreach ($file in $files) {
    if ($file.Name -in "index.html", "about.html", "courses.html", "training.html", "course-details.html") {
        $content = Get-Content $file.FullName -Raw -Encoding UTF8

        # Fix various corruption variants of copyright
        $content = $content.Replace("c 2026 DNK SKILLS", "&copy; 2026 DNK SKILLS")
        $content = $content.Replace("A. 2026 DNK SKILLS", "&copy; 2026 DNK SKILLS")
        $content = $content.Replace("Ac 2026 DNK SKILLS", "&copy; 2026 DNK SKILLS")
        $content = $content.Replace("© 2026 DNK SKILLS", "&copy; 2026 DNK SKILLS")

        Set-Content $file.FullName -Value $content -Encoding UTF8
        Write-Host "Repaired encoding in $($file.Name)"
    }
}

# Regenerate
powershell -ExecutionPolicy Bypass -File .\generate_pages.ps1
Write-Host "All courses regenerated!"
