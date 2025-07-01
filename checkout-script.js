document.addEventListener("DOMContentLoaded", function () {
   
    const selectedProduct = JSON.parse(localStorage.getItem("selectedProduct"));

    if (selectedProduct) {
        
        document.getElementById("product-image").src = selectedProduct.imageSrc;
        document.getElementById("product-title").querySelector("span").textContent = selectedProduct.title;
        document.getElementById("product-price").querySelector("span").textContent = selectedProduct.price;
        document.getElementById("product-description").querySelector("span").textContent = selectedProduct.description;
    } else {
        document.getElementById("product-summary").innerHTML = "<p>No product selected.</p>";
    }

    // Apple Pay button
    const applePayButton = document.getElementById("apple-pay-button");
    applePayButton.addEventListener("click", function (event) {
        event.preventDefault();
        alert("Apple Pay is currently in demo mode. Thank you for your interest!");
    });

    //visa
    const paymentForm = document.getElementById("payment-form");
    paymentForm.addEventListener("submit", function (event) {
        event.preventDefault();
        alert("Payment Successful! Thank you for your purchase.");
        window.location.href = "thankyou.html"; // Redirect to a thank-you page
    });
});

document.getElementById('payment-form').addEventListener('submit', function(e) {
    e.preventDefault();

    const cardNumber = document.getElementById('card-number').value;
    const cvv = document.getElementById('cvv').value;

    if (!/^\d{16}$/.test(cardNumber)) {
        alert('Card number must be 16 digits.');
        return;
    }

    if (!/^\d{3}$/.test(cvv)) {
        alert('CVV must be 3 digits.');
        return;
    }

    alert('Payment Successful!');
});

