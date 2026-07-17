// ============================================
// CONSOLE WELCOME
// ============================================
console.log('%c👋 Welcome to my portfolio!', 'font-size: 24px; font-weight: bold; color: #6C63FF;');
console.log('%c🔧 DevOps | ☁️ Cloud | 🐳 Docker', 'font-size: 16px; color: #FF6584;');
console.log('%c📧 sarkarkabbo72@gmail.com', 'font-size: 14px; color: #333;');

// ============================================
// SKILL HOVER EFFECT
// ============================================
document.querySelectorAll('.skill').forEach(skill => {
    skill.addEventListener('mouseenter', function() {
        this.style.transform = 'scale(1.05)';
        this.style.transition = 'transform 0.3s';
        this.style.borderColor = '#6C63FF';
    });
    skill.addEventListener('mouseleave', function() {
        this.style.transform = 'scale(1)';
        this.style.borderColor = 'rgba(0,0,0,0.05)';
    });
});

// ============================================
// SMOOTH SCROLL
// ============================================
document.querySelectorAll('a[href^="#"]').forEach(anchor => {
    anchor.addEventListener('click', function(e) {
        const target = document.querySelector(this.getAttribute('href'));
        if (target) {
            e.preventDefault();
            target.scrollIntoView({
                behavior: 'smooth',
                block: 'start'
            });
        }
    });
});