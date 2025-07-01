function buyNow(event) {
    const product = event.target.closest(".photo-detail");
    const imageSrc = product.querySelector("img").src;
    const title = product.querySelector("h2").textContent;
    const price = product.querySelector(".price").textContent;
    const description = product.querySelector(".description").textContent;

    
    localStorage.setItem(
        "selectedProduct",
        JSON.stringify({ imageSrc, title, price, description })
    );

    
    window.location.href = "login.php";
}
