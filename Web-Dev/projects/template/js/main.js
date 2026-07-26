document.addEventListener('DOMContentLoaded', function () {
    var menuToggle = document.querySelector('.menu-toggle');
    var nav = document.querySelector('nav');

    if (menuToggle && nav) {
        menuToggle.addEventListener('click', function () {
            nav.classList.toggle('open');
        });
    }

    var form = document.getElementById('contact-form');
    if (form) {
        form.addEventListener('submit', function (e) {
            e.preventDefault();
            var valid = true;

            var nameInput = document.getElementById('name');
            var nameError = document.querySelector('[data-error="name"]');
            if (nameInput && nameError) {
                if (!nameInput.value.trim()) {
                    nameError.textContent = 'Name is required.';
                    valid = false;
                } else {
                    nameError.textContent = '';
                }
            }

            var emailInput = document.getElementById('email');
            var emailError = document.querySelector('[data-error="email"]');
            if (emailInput && emailError) {
                var emailPattern = /^[^\s@]+@[^\s@]+\.[^\s@]+$/;
                if (!emailInput.value.trim()) {
                    emailError.textContent = 'Email is required.';
                    valid = false;
                } else if (!emailPattern.test(emailInput.value.trim())) {
                    emailError.textContent = 'Please enter a valid email address.';
                    valid = false;
                } else {
                    emailError.textContent = '';
                }
            }

            var messageInput = document.getElementById('message');
            var messageError = document.querySelector('[data-error="message"]');
            if (messageInput && messageError) {
                if (!messageInput.value.trim()) {
                    messageError.textContent = 'Message is required.';
                    valid = false;
                } else {
                    messageError.textContent = '';
                }
            }

            if (valid) {
                showToast('Message sent!');
                form.reset();
            }
        });
    }

    var sections = document.querySelectorAll('section[id]');
    var navLinks = document.querySelectorAll('.nav-link');

    if (sections.length > 0 && navLinks.length > 0 && 'IntersectionObserver' in window) {
        var observer = new IntersectionObserver(function (entries) {
            entries.forEach(function (entry) {
                if (entry.isIntersecting) {
                    var id = entry.target.getAttribute('id');
                    navLinks.forEach(function (link) {
                        link.style.fontWeight = '';
                        if (link.getAttribute('href') === '#' + id) {
                            link.style.fontWeight = 'bold';
                        }
                    });
                }
            });
        }, { rootMargin: '-50% 0px -50% 0px' });

        sections.forEach(function (section) {
            observer.observe(section);
        });
    }

    function showToast(message) {
        var toast = document.createElement('div');
        toast.textContent = message;
        toast.style.position = 'fixed';
        toast.style.bottom = '24px';
        toast.style.right = '24px';
        toast.style.backgroundColor = '#1e293b';
        toast.style.color = 'white';
        toast.style.padding = '12px 24px';
        toast.style.borderRadius = '8px';
        toast.style.zIndex = '1000';
        toast.style.opacity = '0';
        toast.style.transition = 'opacity 0.3s ease';
        document.body.appendChild(toast);

        requestAnimationFrame(function () {
            toast.style.opacity = '1';
        });

        setTimeout(function () {
            toast.style.opacity = '0';
            setTimeout(function () {
                document.body.removeChild(toast);
            }, 300);
        }, 3000);
    }
});