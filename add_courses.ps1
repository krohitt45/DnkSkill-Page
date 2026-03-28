$cards = @(
    @{
        Title="C Programming"
        Logo="<img src='https://cdn.jsdelivr.net/gh/devicons/devicon@latest/icons/c/c-original.svg' alt='C' class='w-6 h-6' />"
        Desc="Learn C programming: variables, loops, functions, pointers, memory management, structures, file handling, and real-world projects."
        Items=@("Introduction to C Programming", "Data Types and Variables", "Operators and Expressions", "Control Structures", "Functions", "Arrays and Strings", "Pointers", "Structures and Unions", "File Handling", "Dynamic Memory Allocation")
    },
    @{
        Title="C++ Programming"
        Logo="<img src='https://cdn.jsdelivr.net/gh/devicons/devicon@latest/icons/cplusplus/cplusplus-original.svg' alt='C++' class='w-6 h-6' />"
        Desc="Learn object-oriented programming with C++, including classes, templates, STL, and modern C++ features for high-performance applications."
        Items=@("Introduction to C++", "Data Types, Variables, and Operators", "Control Structures", "Functions in C++", "OOPS Concepts", "Classes and Objects", "Inheritance", "Polymorphism", "Pointers and Memory Management", "File Handling and STL")
    },
    @{
        Title="Python Programming"
        Logo="<img src='https://cdn.jsdelivr.net/gh/devicons/devicon@latest/icons/python/python-original.svg' alt='Python' class='w-6 h-6' />"
        Desc="Learn Python from scratch to advanced level: variables, loops, functions, OOP, file handling, libraries, APIs, and real-world projects."
        Items=@("Introduction to Python", "Variables, Data Types, and Operators", "Control Flow", "Functions and Modules", "String Handling", "File Handling", "Exception Handling", "OOPS Concepts", "Popular Libraries", "Project-Based Learning")
    },
    @{
        Title="Java Programming"
        Logo="<img src='https://cdn.jsdelivr.net/gh/devicons/devicon@latest/icons/java/java-original.svg' alt='Java' class='w-6 h-6' />"
        Desc="Learn Java from basics to advanced: OOP concepts, arrays, collections, file handling, JDBC, and build real-world applications."
        Items=@("Introduction to Java", "Data Types, Variables, and Operators", "Control Statements", "OOPS Concepts", "Classes and Objects", "Inheritance and Interfaces", "Exception Handling", "Arrays and Strings", "File I/O and Java Packages", "Project-Based Learning")
    },
    @{
        Title="JavaScript"
        Logo="<img src='https://cdn.jsdelivr.net/gh/devicons/devicon@latest/icons/javascript/javascript-original.svg' alt='JS' class='w-6 h-6' />"
        Desc="Master JavaScript fundamentals, DOM manipulation, ES6+, and async programming—build real-world interactive web applications."
        Items=@("Introduction to JavaScript", "Variables, Data Types, and Operators", "Control Flow and Conditionals", "Functions and Scope", "Arrays and Objects", "DOM Manipulation", "ES6+ Features", "Asynchronous JavaScript", "Error Handling and Debugging", "JavaScript in Web Development")
    },
    @{
        Title="PHP Programming"
        Logo="<img src='https://cdn.jsdelivr.net/gh/devicons/devicon@latest/icons/php/php-original.svg' alt='PHP' class='w-6 h-6' />"
        Desc="Learn PHP from basics to advanced: syntax, forms, sessions, MySQL integration, file handling, and full-stack web development projects."
        Items=@("Introduction to PHP", "Variables, Data Types & Operators", "Control Structures", "Functions in PHP", "Arrays & Strings", "Forms and User Input", "File Handling in PHP", "Sessions & Cookies", "Database Integration", "Project-Based Learning")
    },
    @{
        Title="Database Management"
        Logo="<img src='https://cdn.jsdelivr.net/gh/devicons/devicon@latest/icons/mysql/mysql-original-wordmark.svg' alt='MySQL' class='w-6 h-6' />"
        Desc="Learn database fundamentals, SQL queries, normalization, ER diagrams, joins, indexing, transactions, and build real-world relational database applications."
        Items=@("Introduction to Databases", "Database Models", "SQL Basics", "Joins and Subqueries", "ER Diagrams & Schema Design", "Normalization", "Constraints & Indexing", "Stored Procedures & Triggers", "Transactions & Concurrency", "Project & Case Studies")
    },
    @{
        Title="Mastering Microsoft Excel"
        Logo="<i data-lucide='file-spreadsheet' class='text-primary w-6 h-6'></i>"
        Desc="Master Microsoft Excel: formulas, functions, charts, pivot tables, data analysis, and automation with practical business use cases and projects."
        Items=@("Introduction to Excel Interface", "Data Entry & Formatting", "Basic Formulas & Functions", "Advanced Functions", "Data Validation & Cleaning", "Sorting & Filtering", "Charts & Visualizations", "Pivot Tables & Pivot Charts", "Excel Data Analysis Tools", "Intro to Excel Macros & Automation")
    },
    @{
        Title="Computer Fundamentals"
        Logo="<i data-lucide='monitor' class='text-primary w-6 h-6'></i>"
        Desc="Learn essential computer skills: operating systems, file management, typing, internet usage, email, MS Office, and digital safety basics."
        Items=@("Introduction to Computers", "Understanding Operating Systems", "File & Folder Management", "Typing Skills", "Internet Basics", "Email & Communication Tools", "Introduction to Microsoft Word", "Introduction to Microsoft Excel", "Introduction to Microsoft PowerPoint", "Digital Safety & Best Practices")
    }
)

$sb = New-Object System.Text.StringBuilder
foreach ($c in $cards) {
    [void]$sb.AppendLine("        <!--  Card -->")
    [void]$sb.AppendLine('        <div class="border border-border rounded-xl p-6 hover:shadow-lg transition-shadow bg-card flex flex-col h-full" data-aos="fade-up">')
    [void]$sb.AppendLine('          <div class="flex items-center gap-4 mb-4">')
    [void]$sb.AppendLine('            <div class="w-12 h-12 rounded-full bg-secondary flex items-center justify-center shrink-0">')
    [void]$sb.AppendLine("              ")
    [void]$sb.AppendLine('            </div>')
    [void]$sb.AppendLine("            <h3 class="font-bold text-[19px] text-[#1f2937] tracking-tight"></h3>")
    [void]$sb.AppendLine('          </div>')
    [void]$sb.AppendLine('          <p class="text-sm text-foreground mb-3 leading-relaxed opacity-90 sm:min-h-[72px]">')
    [void]$sb.AppendLine("            ")
    [void]$sb.AppendLine('          </p>')
    [void]$sb.AppendLine('          <ul class="space-y-1.5 mb-1 flex-grow">')
    foreach ($item in $c.Items) {
        [void]$sb.AppendLine('            <li class="flex items-start gap-2.5 text-[#374151] text-[15px] pb-1"><i data-lucide="check" class="text-primary shrink-0 mt-0.5" style="width: 18px; height: 18px;" stroke-width="2"></i> ' + $item + '</li>')
    }
    [void]$sb.AppendLine('          </ul>')
    [void]$sb.AppendLine('          <div class="mt-4 flex flex-col justify-end pt-3">')
    [void]$sb.AppendLine('            <div class="flex items-center justify-between text-muted-foreground text-sm font-medium mb-4">')
    [void]$sb.AppendLine('              <div class="flex items-center gap-1.5"><i data-lucide="clock" class="w-4 h-4"></i> 6 Week</div>')
    [void]$sb.AppendLine('              <div class="flex items-center gap-1.5 text-primary"><i data-lucide="award" class="w-4 h-4" fill="currentColor"></i> Certificate</div>')
    [void]$sb.AppendLine('            </div>')
    [void]$sb.AppendLine('            <div class="w-full">')
    [void]$sb.AppendLine('              <a href="#enroll" class="w-full block text-center bg-primary text-primary-foreground py-2 rounded-lg font-bold hover:opacity-90 transition-opacity text-sm border-2 border-primary shadow-sm" style="background-color: #2563eb; border-color: #2563eb; color: white;">Register Now</a>')
    [void]$sb.AppendLine('            </div>')
    [void]$sb.AppendLine('          </div>')
    [void]$sb.AppendLine('        </div>')
}

$cardsHtml = $sb.ToString()
$file = ".\courses.html"
$content = Get-Content -Raw $file
$targetRegex = '(?s)        </div>\r?\n      </div>\r?\n    </section>\r?\n  </main>'
$replacement = "$cardsHtml
        </div>
      </div>
    </section>
  </main>"

if ($content -match $targetRegex) {
    $newContent = $content -replace $targetRegex, $replacement
    Set-Content -Path $file -Value $newContent -Encoding UTF8
    Write-Host "Injected 9 course cards into courses.html"
} else {
    Write-Host "Target anchor not found."
}
