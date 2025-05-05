document.getElementById("sort").addEventListener("submit", async (event) => {
    event.preventDefault();

    const sort = this.element["sort"].value;
    const url = `reviews`+encodeURIComponent(sort);

    try{
        const response = await fetch(url, {
            method: "GET",
        });
        if(response.ok){
            location.reload();
        }
    }catch (error){
        console.log(error);
    }

})