$source = Get-Content .\index.html -Encoding UTF8
$courseBlock = $source[124..486]

$target = Get-Content .\training.html -Encoding UTF8
$newContent = $target[0..124] + $courseBlock + $target[125..($target.Count-1)]
Set-Content -Path .\training.html -Value $newContent -Encoding UTF8
