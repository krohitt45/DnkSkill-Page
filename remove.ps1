$lines = Get-Content -Path .\courses.html
$contentToKeep = $lines[0..78] + $lines[427..($lines.Count-1)]
Set-Content -Path .\courses.html -Value $contentToKeep -Encoding UTF8
