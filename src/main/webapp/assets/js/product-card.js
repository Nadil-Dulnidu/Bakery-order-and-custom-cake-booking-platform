const openSection = () =>{
    document.getElementById('review-edit-container')
        .style.display = 'block';
    document.body.style.overflow = 'hidden';
}
const closeSection = () =>{
    document.getElementById('review-edit-container')
        .style.display = 'none';
    document.body.style.overflow = '';
}

document.getElementById("close-btn").addEventListener("click", closeSection);
document.getElementById("open-btn").addEventListener("click", openSection);

window.onclick = (event) => {
    const modal = document.getElementById('review-edit-container');
    if (event.target === modal) {
        closeSection();
    }
};