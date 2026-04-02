$roadmap = Get-Content roadmap_temp.html -Raw
$index = Get-Content index.html -Raw
$target = '<!-- Meet our Mentors Section -->'
$replacement = $roadmap + "`n`n    " + $target
$newIndex = $index.Replace($target, $replacement)
$newIndex | Set-Content index.html -NoNewline
