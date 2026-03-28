// Tailwind Configuration
tailwind.config = {
    theme: {
        extend: {
            colors: {
                border: "hsl(210 20% 90%)",
                input: "hsl(210 20% 90%)",
                ring: "hsl(145 45% 32%)",
                background: "hsl(0 0% 100%)",
                foreground: "hsl(220 20% 15%)",
                primary: {
                    DEFAULT: "hsl(145 45% 32%)",
                    foreground: "hsl(0 0% 100%)",
                },
                secondary: {
                    DEFAULT: "hsl(145 30% 95%)",
                    foreground: "hsl(145 45% 32%)",
                },
                muted: {
                    DEFAULT: "hsl(210 20% 96%)",
                    foreground: "hsl(220 10% 46%)",
                },
                card: {
                    DEFAULT: "hsl(0 0% 100%)",
                    foreground: "hsl(220 20% 15%)",
                },
                hero: "hsl(145 25% 96%)",
            },
            borderRadius: {
                lg: "0.5rem",
                md: "calc(0.5rem - 2px)",
                sm: "calc(0.5rem - 4px)",
            }
        }
    }
};

document.addEventListener('DOMContentLoaded', () => {
    // Initialize Lucide icons
    if (typeof lucide !== 'undefined') {
        lucide.createIcons();
    }

    // Mobile menu toggle
    const menuBtn = document.getElementById('mobile-menu-btn');
    const mobileMenu = document.getElementById('mobile-menu');
    const menuIcon = document.getElementById('menu-icon');
    const closeIcon = document.getElementById('close-icon');
    const mobileLinks = document.querySelectorAll('.mobile-link');

    let isMenuOpen = false;

    function toggleMenu() {
        isMenuOpen = !isMenuOpen;
        if (isMenuOpen) {
            if (mobileMenu) mobileMenu.classList.remove('hidden');
            if (mobileMenu) mobileMenu.classList.add('flex');
            if (menuIcon) menuIcon.classList.add('hidden');
            if (closeIcon) closeIcon.classList.remove('hidden');
        } else {
            if (mobileMenu) mobileMenu.classList.add('hidden');
            if (mobileMenu) mobileMenu.classList.remove('flex');
            if (menuIcon) menuIcon.classList.remove('hidden');
            if (closeIcon) closeIcon.classList.add('hidden');
        }
    }

    if (menuBtn) {
        menuBtn.addEventListener('click', toggleMenu);
    }

    // Close mobile menu when a link is clicked
    if (mobileLinks) {
        mobileLinks.forEach(link => {
            link.addEventListener('click', () => {
                if (isMenuOpen) toggleMenu();
            });
        });
    }

    // Mentors Carousel Navigation
    const mentorsPrevBtn = document.getElementById('mentors-prev');
    const mentorsNextBtn = document.getElementById('mentors-next');
    const mentorsCarousel = document.getElementById('mentors-carousel');

    if (mentorsPrevBtn && mentorsNextBtn && mentorsCarousel) {
        mentorsNextBtn.addEventListener('click', () => {
            // Find the width of one card + gap (24px)
            const firstCard = mentorsCarousel.querySelector('div');
            if (firstCard) {
                const scrollAmount = firstCard.offsetWidth + 24;
                mentorsCarousel.scrollBy({ left: scrollAmount, behavior: 'smooth' });
            }
        });

        mentorsPrevBtn.addEventListener('click', () => {
            const firstCard = mentorsCarousel.querySelector('div');
            if (firstCard) {
                const scrollAmount = firstCard.offsetWidth + 24;
                mentorsCarousel.scrollBy({ left: -scrollAmount, behavior: 'smooth' });
            }
        });
    }

    // --- Dynamic AOS (Animate On Scroll) Setup ---

    // Animate Courses Cards
    const coursesCards = document.querySelectorAll('#courses .bg-card');
    coursesCards.forEach((card, index) => {
        card.setAttribute('data-aos', 'fade-up');
        card.setAttribute('data-aos-delay', (index % 3) * 100);
    });

    // Animate Why Choose Cards
    const whyChooseCards = document.querySelectorAll('section.bg-hero .bg-card');
    whyChooseCards.forEach((card, index) => {
        card.setAttribute('data-aos', 'fade-up');
        card.setAttribute('data-aos-delay', (index % 3) * 100);
    });

    // Animate Mentors Cards
    const mentorsCards = document.querySelectorAll('#mentors-carousel .bg-card');
    mentorsCards.forEach((card, index) => {
        card.setAttribute('data-aos', 'zoom-in');
        card.setAttribute('data-aos-delay', (index % 4) * 100);
    });

    if (typeof window.AOS !== 'undefined') {
        window.AOS.init({
            once: true,
            offset: 50,
            duration: 800
        });
    }
});
