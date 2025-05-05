function showSection(id) {
    document.querySelectorAll('.section').forEach(sec =>
        sec.classList.remove('active'));
    document.querySelectorAll('.js-tab-btn').forEach(btn =>
        btn.classList.remove('active'));

    document.getElementById(id).classList.add('active');

    const matchingButton = document.querySelector(`.js-tab-btn[data-section="${id}"]`);
    if (matchingButton) {
        matchingButton.classList.add('active');
    }

    localStorage.setItem('activeSection', id);
}

window.addEventListener('DOMContentLoaded', () => {
    const savedSection = localStorage.getItem('activeSection');
    if (savedSection && document.getElementById(savedSection)) {
        showSection(savedSection);
    } else {
        const defaultSection = document.querySelector('.section');
        if (defaultSection) {
            showSection(defaultSection.id);
        }
    }
});


function openModal() {
    document.getElementById('editModal').style.display = 'flex';
    document.body.style.overflow = 'hidden';
}

function closeModal() {
    document.getElementById('editModal').style.display = 'none';
    document.body.style.overflow = '';
}

window.onclick = (event) => {
    const modal = document.getElementById('editModal');
    if (event.target === modal) {
        closeModal();
    }
};

//request select data
document.getElementById('filter').addEventListener('submit', async ()=> {
   const filter = this.value;
   const url = 'status-filter'+encodeURIComponent(filter);

    try {
        const response = await fetch(url,{
            method: 'GET',
        });

        if (response.ok) {
            location.reload();
        }
    }catch(err) {
        console.error(err.message);
    }
});