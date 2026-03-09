
// Setup Custom Cursor
const cursorDot = document.querySelector('[data-cursor-dot]');
const cursorOutline = document.querySelector('[data-cursor-outline]');

window.addEventListener('mousemove', function(e) {
    const posX = e.clientX;
    const posY = e.clientY;

    if (cursorDot && cursorOutline) {
        cursorDot.style.left = `${posX}px`;
        cursorDot.style.top = `${posY}px`;

        cursorOutline.animate({
            left: `${posX}px`,
            top: `${posY}px`
        }, { duration: 500, fill: "forwards" });
    }
});

// Setup Hover States
const interactives = document.querySelectorAll('a, button, input, textarea, select, .service-card, .project-card, .testimonial-card, .team-card');

interactives.forEach(el => {
    el.addEventListener('mouseenter', () => {
        if(cursorOutline) cursorOutline.classList.add('hover-active');
        if(cursorDot) cursorDot.classList.add('hover-active');
    });
    el.addEventListener('mouseleave', () => {
        if(cursorOutline) cursorOutline.classList.remove('hover-active');
        if(cursorDot) cursorDot.classList.remove('hover-active');
    });
});

// Setup Scroll Progress Bar
window.addEventListener('scroll', () => {
    const scrollProgress = document.getElementById('scroll-progress');
    if (scrollProgress) {
        const scrollPx = document.documentElement.scrollTop || document.body.scrollTop;
        const winHeightPx = document.documentElement.scrollHeight - document.documentElement.clientHeight;
        const scrolled = (scrollPx / winHeightPx) * 100;
        scrollProgress.style.width = `${scrolled}%`;
    }
});
