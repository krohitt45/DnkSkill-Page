$files = @("index.html", "about.html", "courses.html", "training.html")

$newFooter = @"
  <!-- Footer -->
  <footer class="bg-foreground text-primary-foreground py-12 border-t border-border">
    <div class="max-w-7xl mx-auto px-4 grid grid-cols-1 sm:grid-cols-2 lg:grid-cols-5 gap-8">
      
      <!-- Brand & Description -->
      <div class="space-y-4">
        <div class="flex items-center gap-2 font-bold text-2xl">
          <i data-lucide="flame" class="text-primary" style="width: 28px; height: 28px; stroke-width: 2.5;"></i>
          <span class="font-extrabold tracking-wide text-white" style="font-family: Arial, sans-serif;">DNK SKILLS</span>
        </div>
        <p class="text-[15px] text-muted-foreground leading-relaxed mt-2">
          Empowering the future through innovative education and technology solutions.
        </p>
      </div>

      <!-- Training Programs -->
      <div>
        <h4 class="font-bold text-lg text-white mb-5">Training Programs</h4>
        <ul class="space-y-3 text-[15px] text-muted-foreground">
          <li><a href="training.html" class="hover:text-primary transition-colors flex items-center gap-2"><i data-lucide="chevron-right" class="w-4 h-4"></i> Web Development</a></li>
          <li><a href="training.html" class="hover:text-primary transition-colors flex items-center gap-2"><i data-lucide="chevron-right" class="w-4 h-4"></i> App Development</a></li>
          <li><a href="training.html" class="hover:text-primary transition-colors flex items-center gap-2"><i data-lucide="chevron-right" class="w-4 h-4"></i> Data Science</a></li>
          <li><a href="training.html" class="hover:text-primary transition-colors flex items-center gap-2"><i data-lucide="chevron-right" class="w-4 h-4"></i> DSA with C++</a></li>
          <li><a href="training.html" class="hover:text-primary transition-colors flex items-center gap-2"><i data-lucide="chevron-right" class="w-4 h-4"></i> DSA with Java</a></li>
          <li><a href="training.html" class="hover:text-primary transition-colors flex items-center gap-2"><i data-lucide="chevron-right" class="w-4 h-4"></i> AI / ML</a></li>
        </ul>
      </div>

      <!-- Courses -->
      <div>
        <h4 class="font-bold text-lg text-white mb-5">Courses</h4>
        <ul class="space-y-3 text-[15px] text-muted-foreground">
          <li><a href="courses.html" class="hover:text-primary transition-colors flex items-center gap-2"><i data-lucide="chevron-right" class="w-4 h-4"></i> C Programming</a></li>
          <li><a href="courses.html" class="hover:text-primary transition-colors flex items-center gap-2"><i data-lucide="chevron-right" class="w-4 h-4"></i> C++ Programming</a></li>
          <li><a href="courses.html" class="hover:text-primary transition-colors flex items-center gap-2"><i data-lucide="chevron-right" class="w-4 h-4"></i> Python Programming</a></li>
          <li><a href="courses.html" class="hover:text-primary transition-colors flex items-center gap-2"><i data-lucide="chevron-right" class="w-4 h-4"></i> Java Programming</a></li>
          <li><a href="courses.html" class="hover:text-primary transition-colors flex items-center gap-2"><i data-lucide="chevron-right" class="w-4 h-4"></i> JavaScript</a></li>
          <li class="pt-2"><a href="courses.html" class="text-primary hover:text-primary-foreground transition-colors flex items-center gap-2 font-semibold">View More <i data-lucide="arrow-right" class="w-4 h-4"></i></a></li>
        </ul>
      </div>

      <!-- Contact Us -->
      <div>
        <h4 class="font-bold text-lg text-white mb-5">Contact Us</h4>
        <ul class="space-y-4 text-[15px] text-muted-foreground">
          <li class="flex items-start gap-3">
            <i data-lucide="map-pin" class="w-5 h-5 text-primary shrink-0 mt-0.5"></i>
            <span>LPU, Jalandhar-Delhi, G.T. Road,<br>Phagwara, Punjab (INDIA)</span>
          </li>
          <li class="flex items-center gap-3">
            <i data-lucide="mail" class="w-5 h-5 text-primary shrink-0"></i>
            <a href="mailto:support@dnkskill.com" class="hover:text-primary transition-colors opacity-90">support@dnkskill.com</a>
          </li>
          <li class="flex items-center gap-3">
            <i data-lucide="phone" class="w-5 h-5 text-primary shrink-0"></i>
            <a href="tel:8002318046" class="hover:text-primary transition-colors opacity-90">8002318046</a>
          </li>
        </ul>
      </div>

      <!-- Map Embed -->
      <div class="h-48 sm:h-full min-h-[180px] w-full rounded-xl overflow-hidden shadow-lg border border-primary-foreground/10">
        <iframe src="https://www.google.com/maps/embed?pb=!1m18!1m12!1m3!1d3410.741036306353!2d75.70051!3d31.2536005!2m3!1f0!2f0!3f0!3m2!1i1024!2i768!4f13.1!3m3!1m2!1s0x391a5f5e9c489cf3%3A0x4049a5409d53c300!2sLovely%20Professional%20University!5e0!3m2!1sen!2sin!4v1710000000000!5m2!1sen!2sin" width="100%" height="100%" style="border:0;" allowfullscreen="" loading="lazy" referrerpolicy="no-referrer-when-downgrade"></iframe>
      </div>

    </div>

    <!-- Bottom Bar -->
    <div class="max-w-7xl mx-auto px-4 mt-12 pt-6 border-t border-primary-foreground/10">
      <div class="flex flex-col md:flex-row items-center justify-between gap-4 text-xs text-muted-foreground">
        <div class="text-center md:text-left">
          © 2026 DNK SKILLS. All rights reserved.
        </div>
        <div class="font-bold text-center tracking-wider text-primary-foreground/80">
          SIYADNK SOFTWARE PRIVATE LIMITED
        </div>
      </div>
    </div>
  </footer>
"@

foreach ($file in $files) {
    if (Test-Path $file) {
        $content = Get-Content $file -Raw
        $content = $content -replace '(?s)  <!-- Footer -->.*?</footer>', $newFooter
        Set-Content $file $content -Encoding UTF8
        Write-Host "Updated footer in $file"
    }
}
