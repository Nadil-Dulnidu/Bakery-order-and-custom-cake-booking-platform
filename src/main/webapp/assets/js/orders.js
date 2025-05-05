//request select data
document.getElementById('filter').addEventListener('submit', async ()=> {
    const filter = this.value;
    const url = 'orders' + encodeURIComponent(filter);

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