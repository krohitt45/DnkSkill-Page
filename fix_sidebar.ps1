$files = Get-ChildItem -Filter "course-*.html"

foreach ($file in $files) {
    Write-Host "Updating $($file.Name)"
    $content = Get-Content $file.FullName -Raw

    # 1. Remove items-start to allow the grid to stretch
    $content = $content -replace '<div class="grid lg:grid-cols-12 gap-8 lg:gap-12 items-start">', '<div class="grid lg:grid-cols-12 gap-8 lg:gap-12">'

    # 2. Fix the sticky container and add the features card below it
    $oldSticky = '(?s)<div class="sticky top-24 bg-card border border-border rounded-2xl shadow-xl overflow-hidden mt-8 lg:mt-0 relative z-30">(.*?)<p class="text-xs text-center text-muted-foreground mt-5 flex justify-center items-center gap-1.5 font-medium">\s*<i data-lucide="lock" class="w-3.5 h-3.5 opacity-70"></i> 100% Safe & Secure Payment Space\s*</p>\s*</div>\s*</div>\s*</div>'

    $newSticky = '<div class="sticky top-24 z-30 flex flex-col gap-6 mt-8 lg:mt-0">
            <!-- Form Card -->
            <div class="bg-card border border-border rounded-2xl shadow-xl overflow-hidden">
$1<p class="text-xs text-center text-muted-foreground mt-5 flex justify-center items-center gap-1.5 font-medium">
                  <i data-lucide="lock" class="w-3.5 h-3.5 opacity-70"></i> 100% Safe & Secure Payment Space
                </p>
            </div>
            </div>
            
            <!-- Extra Info Card -->
            <div class="bg-card border border-border rounded-2xl p-6 shadow-sm hidden lg:block" data-aos-delay="100">
                <h4 class="font-bold text-foreground mb-4">Course Features</h4>
                <ul class="space-y-3 text-[14.5px] text-muted-foreground font-medium">
                    <li class="flex items-center gap-3"><div class="bg-primary/10 p-1.5 rounded-lg text-primary"><i data-lucide="video" class="w-4 h-4"></i></div> Live & Recorded Classes</li>
                    <li class="flex items-center gap-3"><div class="bg-primary/10 p-1.5 rounded-lg text-primary"><i data-lucide="code-2" class="w-4 h-4"></i></div> Real-world Projects</li>
                    <li class="flex items-center gap-3"><div class="bg-primary/10 p-1.5 rounded-lg text-primary"><i data-lucide="infinity" class="w-4 h-4"></i></div> 1 Year Platform Access</li>
                    <li class="flex items-center gap-3"><div class="bg-primary/10 p-1.5 rounded-lg text-primary"><i data-lucide="award" class="w-4 h-4"></i></div> Certificate of Completion</li>
                </ul>
                <div class="mt-6 pt-5 border-t border-border flex items-start gap-4">
                  <div class="bg-primary/10 p-2 rounded-xl shrink-0 mt-0.5">
                    <i data-lucide="briefcase" class="w-5 h-5 text-primary"></i>
                  </div>
                  <div>
                    <h4 class="font-bold text-[14.5px] text-foreground">Placement Assistance</h4>
                    <p class="text-[13px] leading-relaxed text-muted-foreground mt-1">Dedicated support for interview prep, resume building, and career guidance.</p>
                  </div>
                </div>
            </div>
            
          </div>
        </div>'

    $newContent = [regex]::Replace($content, $oldSticky, $newSticky)
    
    if ($newContent -cne $content) {
        Set-Content $file.FullName -Value $newContent
        Write-Host "Replaced content in $($file.Name)"
    } else {
        Write-Host "No changes needed for $($file.Name) or pattern not found"
    }

}
