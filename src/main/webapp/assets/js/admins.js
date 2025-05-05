function openModal() {
  document.getElementById('addAdminModal').style.display = 'flex';
}

function closeModal() {
  document.getElementById('addAdminModal').style.display = 'none';
}

window.onclick = function(event) {
  const modal = document.getElementById('addAdminModal');
  if (event.target === modal) {
      modal.style.display = 'none';
  }
}