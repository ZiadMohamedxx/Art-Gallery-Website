document.addEventListener("DOMContentLoaded", function () {
    const loginForm = document.getElementById("login-form");
    const rememberMeCheckbox = document.getElementById("remember-me");
    const gallery = document.querySelector(".gallery");
    const loginContainer = document.querySelector(".login-container");

const galleryTitle = document.getElementById("gallery-title");
    const languageSelector = document.getElementById("language-selector");
    function changeLanguage() {
        const selectedLanguage = languageSelector.value;
        if (selectedLanguage === "ar") {
            galleryTitle.textContent = "معرض الصور";
        } else {
            galleryTitle.textContent = "Art Gallery";
        }
    }

    languageSelector.addEventListener("change", changeLanguage);

});



  
  const searchBar = document.getElementById("search-bar");
  const galleryItemsContainer = document.querySelectorAll(".gallery-item");

  searchBar.addEventListener("input", function() {
      const searchTerm = searchBar.value.toLowerCase();

      galleryItemsContainer.forEach(item => {
        
        const searchableContent = `
            ${item.getAttribute(".name")?.toLowerCase() || ""}
            ${item.getAttribute(".artistname")?.toLowerCase() || ""}
            ${item.getAttribute(".description")?.toLowerCase() || ""}
            ${item.getAttribute(".price")?.toLowerCase() || ""}
            ${item.querySelector(".caption").textContent.toLowerCase() || ""}
        `;

        
        item.style.display = searchableContent.includes(searchTerm) ? "block" : "none";
    });
});



    
