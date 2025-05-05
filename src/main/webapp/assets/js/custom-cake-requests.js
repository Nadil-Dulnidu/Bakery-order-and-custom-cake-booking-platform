// create get request and send to the servlet
document.getElementById('filter').addEventListener('submit', async ()=> {
    const filter = this.value;
    const url = 'custom-cake-requests' + encodeURIComponent(filter);

    try {
        const response = await fetch(url, {
            method: 'GET',
        });

        if (response.ok) {
            location.reload();
        }
    }catch (err) {
        console.error(err.message);
    }
});

document.getElementById('sort').addEventListener('submit', async ()=> {
    const sort = this.value;
    const url = 'custom-cake-requests' + encodeURIComponent(sort);

    try {
        const response = await fetch(url, {
            method: 'GET',
        });

        if (response.ok) {
            location.reload();
        }
    }catch (err) {
        console.error(err.message);
    }
})



