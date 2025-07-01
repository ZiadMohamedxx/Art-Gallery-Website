document.addEventListener("DOMContentLoaded", function () {
    emailjs.init("bM3h4vIG0vW6tjl8c");
    console.log("EmailJS initialized successfully.");

    const contactForm = document.getElementById("contact-form");
    const formStatus = document.getElementById("form-status");

    contactForm.addEventListener("submit", function (event) {
        event.preventDefault(); 

       
        const name = document.getElementById("name").value;
        const email = document.getElementById("email").value;
        const message = document.getElementById("message").value;

        if (!name || !email || !message) {
            formStatus.textContent = "Please fill out all fields.";
            formStatus.style.color = "red";
            return;
        }

        
        const formData = {
            name: name,
            email: email,
            message: message,
        };

        emailjs
            .send("service_jhz8gcd", "template_py6ujle", formData)
            .then(function (response) {
                formStatus.textContent = "Message sent successfully!";
                formStatus.style.color = "green";
                contactForm.reset();
                console.log("Email sent to website owner:", response);
            })
            .catch(function (error) {
                console.error("Failed to send email to website owner:", error);
                formStatus.textContent = "Failed to send message. Please try again.";
                formStatus.style.color = "red";
            });

        
        const autoResponseData = {
            name: name,
            email: email,
        };

        emailjs
            .send("service_jhz8gcd", "template_ni22hoi", autoResponseData)
            .then(function (response) {
                console.log("Auto-response email sent to the user successfully!", response);
            })
            .catch(function (error) {
                console.error("Failed to send auto-response email to the user:", error);
            });
    });
});

