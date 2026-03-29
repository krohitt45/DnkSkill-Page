$files = @("index.html", "training.html")
foreach ($file in $files) {
    if (Test-Path $file) {
        $content = Get-Content $file -Raw

        # Add a 6th line item before the closing </ul> tag in the course cards
        $newItem = "`r`n            <li class=`"flex items-start gap-2.5 text-[#374151] text-[15px] pb-1`">`r`n              <i data-lucide=`"check`" class=`"text-primary shrink-0 mt-0.5`" style=`"width: 18px; height: 18px;`"`r`n                stroke-width=`"2`"></i>`r`n              Placement & Interview Support`r`n            </li>`r`n          </ul>"
        
        $pattern = '(<ul class="space-y-1\.5 mb-1">[\s\S]*?)</ul>'
        
        $content = [regex]::Replace($content, $pattern, "`$1$newItem")
        
        Set-Content $file -Value $content
    }
}
