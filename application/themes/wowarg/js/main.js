/* =======================================================================
   WoW Argentina Theme - main.js
   FusionCMS 9.5.0 | wowarg.com | AzerothCore WotLK 3.3.5a
   ======================================================================= */
'use strict';

/* --- Slider ------------------------------------------------------------ */
var WASlider = (function() {
    var slides, dots, currentIndex, timer, intervalMs;

    function init() {
        var track = document.getElementById('slider');
        if (!track) return;

        slides = track.querySelectorAll('.wowarg-slide');
        if (!slides.length) return;

        dots   = document.querySelectorAll('.wowarg-slider-dot');
        currentIndex = 0;

        intervalMs = (typeof Config !== 'undefined' && Config.Slider && Config.Slider.interval > 0)
            ? Config.Slider.interval * 1000
            : 6000;

        var prevBtn = document.getElementById('slider-prev');
        var nextBtn = document.getElementById('slider-next');

        if (prevBtn) prevBtn.addEventListener('click', function() { step(-1); });
        if (nextBtn) nextBtn.addEventListener('click', function() { step(1);  });

        dots.forEach(function(dot, i) {
            dot.addEventListener('click', function() { goTo(i); });
        });

        track.addEventListener('mouseenter', stop);
        track.addEventListener('mouseleave', start);

        var touchStartX = 0;
        track.addEventListener('touchstart', function(e) { touchStartX = e.changedTouches[0].clientX; }, { passive: true });
        track.addEventListener('touchend', function(e) {
            var dx = e.changedTouches[0].clientX - touchStartX;
            if (Math.abs(dx) > 50) step(dx < 0 ? 1 : -1);
        }, { passive: true });

        if (slides.length > 1) start();
    }

    function goTo(index) {
        if (!slides || !slides.length) return;
        slides[currentIndex].classList.remove('active');
        if (dots[currentIndex]) dots[currentIndex].classList.remove('active');
        currentIndex = ((index % slides.length) + slides.length) % slides.length;
        slides[currentIndex].classList.add('active');
        if (dots[currentIndex]) dots[currentIndex].classList.add('active');
    }

    function step(dir) { stop(); goTo(currentIndex + dir); start(); }

    function start() {
        stop();
        if (slides && slides.length > 1)
            timer = setInterval(function() { goTo(currentIndex + 1); }, intervalMs);
    }

    function stop() { if (timer) { clearInterval(timer); timer = null; } }

    return { init: init };
})();

/* --- Mobile Menu ------------------------------------------------------- */
var WAMobileMenu = (function() {
    var toggle, menu, overlay, closeBtn;

    function init() {
        toggle   = document.getElementById('wowarg-mobile-toggle');
        menu     = document.getElementById('wowarg-mobile-menu');
        overlay  = document.getElementById('wowarg-mobile-overlay');
        closeBtn = document.getElementById('wowarg-mobile-close');
        if (!toggle || !menu) return;

        menu.removeAttribute('hidden');

        toggle.addEventListener('click', open);
        if (closeBtn) closeBtn.addEventListener('click', close);
        if (overlay)  overlay.addEventListener('click', close);

        menu.querySelectorAll('.wowarg-mobile-parent').forEach(function(parent) {
            parent.addEventListener('click', function() {
                var sub = this.nextElementSibling;
                if (!sub || !sub.classList.contains('wowarg-mobile-sub')) return;
                var isOpen = sub.style.display === 'block';
                menu.querySelectorAll('.wowarg-mobile-sub').forEach(function(s) { s.style.display = 'none'; });
                menu.querySelectorAll('.wowarg-mobile-parent i').forEach(function(i) { i.style.transform = ''; });
                if (!isOpen) {
                    sub.style.display = 'block';
                    var icon = this.querySelector('i');
                    if (icon) icon.style.transform = 'rotate(180deg)';
                }
            });
        });

        document.addEventListener('keydown', function(e) { if (e.key === 'Escape') close(); });
    }

    function open() {
        if (!menu) return;
        menu.classList.add('open');
        if (overlay) overlay.classList.add('open');
        toggle.setAttribute('aria-expanded', 'true');
        document.body.style.overflow = 'hidden';
    }

    function close() {
        if (!menu) return;
        menu.classList.remove('open');
        if (overlay) overlay.classList.remove('open');
        if (toggle) toggle.setAttribute('aria-expanded', 'false');
        document.body.style.overflow = '';
    }

    return { init: init, open: open, close: close };
})();

/* --- Sticky Header ---------------------------------------------------- */
var WAHeader = (function() {
    var header;
    function init() {
        header = document.getElementById('header');
        if (!header) return;
        window.addEventListener('scroll', function() {
            header.classList.toggle('scrolled', (window.pageYOffset || document.documentElement.scrollTop) > 60);
        }, { passive: true });
    }
    return { init: init };
})();

/* --- Back to Top ------------------------------------------------------ */
var WABackTop = (function() {
    var btn;
    function init() {
        btn = document.getElementById('back-to-top');
        if (!btn) return;
        window.addEventListener('scroll', function() {
            btn.classList.toggle('visible', (window.pageYOffset || document.documentElement.scrollTop) > 300);
        }, { passive: true });
        btn.addEventListener('click', function(e) {
            e.preventDefault();
            window.scrollTo({ top: 0, behavior: 'smooth' });
        });
    }
    return { init: init };
})();

/* --- Countdown -------------------------------------------------------- */
var WACountdown = (function() {
    function init(targetDate, containerId) {
        if (!targetDate || !containerId) return;
        var el = document.getElementById(containerId);
        if (!el) return;
        var target = new Date(targetDate).getTime();
        if (isNaN(target)) return;

        function pad(n) { return n < 10 ? '0' + n : '' + n; }
        function block(val, unit) {
            return '<span class="wa-countdown-block"><b>' + val + '</b><span>' + unit + '</span></span>';
        }
        function tick() {
            var diff = target - Date.now();
            if (diff <= 0) { el.innerHTML = '<span class="wa-countdown-ended">¡En curso!</span>'; return; }
            var d = Math.floor(diff / 86400000);
            var h = Math.floor((diff % 86400000) / 3600000);
            var m = Math.floor((diff % 3600000)  / 60000);
            var s = Math.floor((diff % 60000)    / 1000);
            el.innerHTML = block(d, 'd') + block(pad(h), 'h') + block(pad(m), 'm') + block(pad(s), 's');
        }
        tick();
        setInterval(tick, 1000);
    }
    return { init: init };
})();

/* --- Custom JS (realm switcher used by sidebox_status) --------------- */
var CustomJS = {
    switchRealm: function(btn, targetSelector) {
        var container = btn.closest('.wowarg-sidebox-body') || btn.parentNode.parentNode;
        // Hide all realm panels
        container.querySelectorAll('[id^="realm_"]').forEach(function(panel) {
            panel.style.display = 'none';
        });
        // Deactivate all dots
        container.querySelectorAll('.wowarg-realm-dot').forEach(function(dot) {
            dot.classList.remove('active');
        });
        // Show target
        var target = document.querySelector(targetSelector);
        if (target) target.style.display = '';
        btn.classList.add('active');
    }
};

/* --- Init ------------------------------------------------------------- */
$(document).ready(function() {
    WASlider.init();
    WAMobileMenu.init();
    WAHeader.init();
    WABackTop.init();
});
