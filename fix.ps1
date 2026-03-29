$content = Get-Content 'courses.html' -Raw
$lines = $content -split "`r?`n"
$newLines = $lines[0..606] + '            </div>' + '          </div>' + $lines[804..($lines.Length-1)]
Set-Content 'courses.html' -Value ($newLines -join "`n")
