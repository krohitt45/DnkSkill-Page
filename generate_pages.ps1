$templateContent = Get-Content "course-details.html" -Raw -Encoding UTF8

$courses = @(
    @{
        id = "dsa-cpp";
        subject = "DSA with C++";
        title = "Data Structures & Algorithms with C++";
        subtitle = "Zero to Advanced";
        desc = "Master Data Structures and Algorithms from scratch using C++. Build real problem-solving skills to crack top product-based company interviews.";
        m1Title = "C++ Basics & STL"; m1Desc = "Learn syntax, pointers, memory management, and Standard Template Library.";
        m2Title = "Arrays, Strings & Searching"; m2Desc = "Deep dive into array manipulation, string algorithms, and binary search.";
        m3Title = "LinkedLists, Stacks & Queues"; m3Desc = "Master linear data structures and their complex applications in interviews.";
        m4Title = "Trees, Graphs & Heaps"; m4Desc = "Traversals, shortest paths, spanning trees, and priority queues.";
        m5Title = "Dynamic Programming & Projects"; m5Desc = "Recursion, memoization, tabulation and advanced coding platform challenges.";
    },
    @{
        id = "app-dev";
        subject = "App Development";
        title = "Mobile App Development";
        subtitle = "Build iOS & Android Apps";
        desc = "Build cross-platform mobile applications using Flutter and React Native. Master UI concepts, REST APIs, state management, and app publishing.";
        m1Title = "Dart & JS Fundamentals"; m1Desc = "Core programming concepts needed to start with mobile frameworks.";
        m2Title = "UI & Layouts"; m2Desc = "Building responsive, modern interfaces, widgets, and routing.";
        m3Title = "State Management"; m3Desc = "Using Provider, Redux, or Bloc to manage app state seamlessly.";
        m4Title = "APIs & Databases"; m4Desc = "Integrating REST APIs, Firebase, and local SQLite databases.";
        m5Title = "App Publishing"; m5Desc = "Testing, debugging, building APK/IPA, and launching on App Stores.";
    },
    @{
        id = "data-science";
        subject = "Data Science";
        title = "Data Science & Analytics";
        subtitle = "From Data to Insights";
        desc = "Master Python, Pandas, Matplotlib, Data Visualization, Machine Learning algorithms, and SQL. Become an industry-ready Data Scientist.";
        m1Title = "Python for Data Science"; m1Desc = "Master Python basics, Jupyter notebooks, Numpy, and Pandas.";
        m2Title = "Data Analysis & SQL"; m2Desc = "Cleaning datasets, handling missing values, and querying databases.";
        m3Title = "Data Visualization"; m3Desc = "Creating stunning charts and dashboards using Matplotlib, Seaborn, and Tableau.";
        m4Title = "Machine Learning Basics"; m4Desc = "Linear regression, logistic regression, decision trees, and classification.";
        m5Title = "Capstone Project"; m5Desc = "End-to-end data pipeline project tackling a real-world business problem.";
    },
    @{
        id = "dsa-java";
        subject = "DSA with Java";
        title = "Data Structures & Algorithms with Java";
        subtitle = "Ace Coding Interviews";
        desc = "Master Data Structures and Algorithms comprehensively using Java. Enhance your logical thinking and land high-paying software engineering jobs.";
        m1Title = "Java Core & Collections"; m1Desc = "Syntax, OOPs concepts, Collections Framework, and Time Complexities.";
        m2Title = "Arrays & Bit Manipulation"; m2Desc = "Sliding windows, sorting algorithms, bitwise operations.";
        m3Title = "Recursion & Backtracking"; m3Desc = "Mastering recursive jumps, backtracking puzzles, and permutations.";
        m4Title = "Advanced Data Structures"; m4Desc = "Trees, Trie, Graphs, and Disjoint Sets algorithms.";
        m5Title = "DP & Interview Prep"; m5Desc = "Tackling 1D and 2D DP problems and live mock interviews.";
    },
    @{
        id = "ai-ml";
        subject = "AI & Machine Learning";
        title = "Artificial Intelligence & ML";
        subtitle = "Build Intelligent Systems";
        desc = "Dive deep into Neural Networks, TensorFlow, Computer Vision, and NLP. Build real-world AI projects and become a cutting-edge ML Engineer.";
        m1Title = "Math & ML Foundations"; m1Desc = "Linear Algebra, Calculus, and core ML algorithms concepts.";
        m2Title = "Deep Learning Basics"; m2Desc = "Perceptrons, backpropagation, and Neural Network architectures.";
        m3Title = "Computer Vision (CV)"; m3Desc = "Image processing, CNNs, object detection, and OpenCV.";
        m4Title = "Natural Language Processing"; m4Desc = "Text processing, RNNs, LSTMs, and modern transformers basics.";
        m5Title = "AI Project Deployment"; m5Desc = "Building a generative AI agent and deploying it on cloud instances.";
    }
)

foreach ($course in $courses) {
    $html = $templateContent

    # Replace Subject
    $html = [regex]::Replace($html, '<span>Web Development</span>', "<span>$($course.subject)</span>")
    
    # Replace Page Title
    $html = [regex]::Replace($html, '<title>Course Details \| DNK SKILL</title>', "<title>$($course.subject) | DNK SKILL</title>")
    
    # Replace Main Title
    $html = [regex]::Replace($html, 'Full Stack Web Development', $course.title)
    
    # Replace Subtitle
    $html = [regex]::Replace($html, 'Zero to Mastery', $course.subtitle)
    
    # Replace Description (Using fixed string replace for the exact text)
    $descPattern = "Master HTML, CSS, JavaScript, React, Node.js, and MongoDB. Build real-world projects, get industry mentor support, and secure your dream job."
    $html = $html.Replace($descPattern, $course.desc)
    
    # Modules Replacements
    $html = $html.Replace("Module 1: Web Fundamentals (HTML & CSS)", "Module 1: $($course.m1Title)")
    $html = $html.Replace("Learn the building blocks of the web, semantic structure, CSS styling, flexbox, and grid layouts.", $course.m1Desc)

    $html = $html.Replace("Module 2: JavaScript Deep Dive", "Module 2: $($course.m2Title)")
    $html = $html.Replace("Variables, loops, DOM manipulation, ES6 features, promises, async/await, and logic building.", $course.m2Desc)

    $html = $html.Replace("Module 3: Frontend Mastery with React", "Module 3: $($course.m3Title)")
    $html = $html.Replace("Components, state, props, hooks, routing, and building interactive UIs.", $course.m3Desc)

    $html = $html.Replace("Module 4: Backend & Database", "Module 4: $($course.m4Title)")
    $html = $html.Replace("Node.js basics, Express servers, REST APIs, MongoDB integration, and authentication.", $course.m4Desc)

    $html = $html.Replace("Module 5: Final Project & Hosting", "Module 5: $($course.m5Title)")
    $html = $html.Replace("Combining everything to build a full-stack e-commerce app and deploying it live on Vercel/Render.", $course.m5Desc)

    # Save to new file
    $filename = "course-$($course.id).html"
    Set-Content $filename -Value $html -Encoding UTF8
    Write-Host "Generated $filename"
}

# Duplicate the base course-details to a course-web-dev for consistency (optional)
Copy-Item "course-details.html" "course-web-dev.html"
Write-Host "Generated course-web-dev.html"

