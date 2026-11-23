
/* =====================================================
   CHARITY HOMEPAGE JAVASCRIPT
   Version 1.0
===================================================== */

document.addEventListener("DOMContentLoaded", function () {

    // Kiểm tra người dùng có yêu cầu giảm chuyển động không
    const reduceMotion = window.matchMedia(
        "(prefers-reduced-motion: reduce)"
    ).matches;


    /* ==============================================
       1. REVEAL ANIMATION
       Hiện nội dung khi cuộn đến
    ============================================== */

    const revealElements = document.querySelectorAll(
        ".charity-home .reveal"
    );

    if (reduceMotion || !("IntersectionObserver" in window)) {

        revealElements.forEach(function (element) {
            element.classList.add("is-visible");
        });

    } else {

        const revealObserver = new IntersectionObserver(
            function (entries, observer) {

                entries.forEach(function (entry) {

                    if (entry.isIntersecting) {

                        entry.target.classList.add("is-visible");

                        // Chỉ chạy hiệu ứng một lần
                        observer.unobserve(entry.target);

                    }

                });

            },
            {
                threshold: 0.12,
                rootMargin: "0px 0px -30px 0px"
            }
        );

        revealElements.forEach(function (element) {
            revealObserver.observe(element);
        });

    }


    /* ==============================================
       2. NUMBER COUNTER
       Hiệu ứng đếm số thống kê
    ============================================== */

    const counters = document.querySelectorAll(
        ".charity-home .impact-number[data-count]"
    );

    function formatNumber(number) {

        return new Intl.NumberFormat("vi-VN").format(number);

    }

    function animateCounter(element) {

        const target = Number(element.dataset.count);

        if (!Number.isFinite(target)) {
            return;
        }

        if (reduceMotion) {
            element.textContent = formatNumber(target) + "+";
            return;
        }

        const duration = 1800;
        const startTime = performance.now();

        function updateCounter(currentTime) {

            const elapsed = currentTime - startTime;

            const progress = Math.min(elapsed / duration, 1);

            // Hiệu ứng tăng tốc rồi chậm dần
            const easedProgress = 1 - Math.pow(1 - progress, 3);

            const currentValue = Math.floor(
                target * easedProgress
            );

            element.textContent =
                formatNumber(currentValue) + "+";

            if (progress < 1) {

                requestAnimationFrame(updateCounter);

            } else {

                element.textContent =
                    formatNumber(target) + "+";

            }

        }

        requestAnimationFrame(updateCounter);

    }


    // Chỉ bắt đầu đếm khi khu vực thống kê xuất hiện
    if ("IntersectionObserver" in window) {

        const counterObserver = new IntersectionObserver(
            function (entries, observer) {

                entries.forEach(function (entry) {

                    if (entry.isIntersecting) {

                        animateCounter(entry.target);

                        // Không đếm lại khi cuộn lên xuống
                        observer.unobserve(entry.target);

                    }

                });

            },
            {
                threshold: 0.5
            }
        );

        counters.forEach(function (counter) {
            counterObserver.observe(counter);
        });

    } else {

        counters.forEach(function (counter) {
            animateCounter(counter);
        });

    }


    /* ==============================================
       3. SMOOTH ANCHOR
       Cuộn mượt khi nhấn liên kết nội trang
    ============================================== */

    document.querySelectorAll(
        '.charity-home a[href^="#"]'
    ).forEach(function (link) {

        link.addEventListener("click", function (event) {

            const targetId = link.getAttribute("href");

            if (!targetId || targetId === "#") {
                return;
            }

            const target = document.querySelector(targetId);

            if (target) {

                event.preventDefault();

                target.scrollIntoView({
                    behavior: reduceMotion ? "auto" : "smooth",
                    block: "start"
                });

            }

        });

    });


    /* ==============================================
       4. HERO IMAGE FALLBACK
       Nếu ảnh ngoài không tải được thì không để
       phần hình ảnh bị lỗi hiển thị
    ============================================== */

    const heroImages = document.querySelectorAll(
        ".charity-home .hero-image-main img, " +
        ".charity-home .about-image-wrap img"
    );

    heroImages.forEach(function (img) {

        img.addEventListener("error", function () {

            img.style.opacity = "0.25";

        });

    });


    console.log("CHARITY Homepage JavaScript loaded successfully.");

});
