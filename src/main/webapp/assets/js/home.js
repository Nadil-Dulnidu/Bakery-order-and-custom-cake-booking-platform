//product slider
const scrollContainer = document.querySelector(".product-container");
const backButton = document.getElementById("back-btn");
const forwardButton = document.getElementById("forward-btn");

// scrollContainer.addEventListener("wheel", (event) => {
//     event.preventDefault();
//     scrollContainer.scrollLeft += event.deltaY;
//     scrollContainer.style.scrollBehavior = "auto";
// })
forwardButton.addEventListener("click", () => {
    scrollContainer.style.scrollBehavior = "smooth";
    scrollContainer.scrollLeft += 350;
})
backButton.addEventListener("click", () => {
    scrollContainer.style.scrollBehavior = "smooth";
    scrollContainer.scrollLeft -= 350;
})