
document.addEventListener("DOMContentLoaded", function () {

    // ==================================
    // CONTACT FORM - DEMO
    // ==================================

    const contactForm = document.getElementById("contactForm");

    if (contactForm) {

        const messageBox = document.getElementById("contactMessage");
        const contentInput = document.getElementById("noiDung");
        const countLabel = document.getElementById("contactCount");

        if (contentInput && countLabel) {

            contentInput.addEventListener("input", function () {
                countLabel.textContent = this.value.length;
            });

        }

        contactForm.addEventListener("submit", function (event) {

            event.preventDefault();

            if (!contactForm.checkValidity()) {
                contactForm.reportValidity();
                return;
            }

            const name = document.getElementById("hoTen").value.trim();
            const email = document.getElementById("email").value.trim();
            const content = contentInput.value.trim();

            if (!name || !email || !content) {
                return;
            }

            messageBox.className = "alert alert-success";
            messageBox.textContent =
                "Biểu mẫu đã được kiểm tra thành công. " +
                "Đây là bản demo, thông tin chưa được gửi hoặc lưu.";

            contactForm.reset();

            if (countLabel) {
                countLabel.textContent = "0";
            }

        });

    }

});
