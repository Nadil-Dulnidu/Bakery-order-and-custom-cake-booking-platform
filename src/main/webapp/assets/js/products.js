// send get request to servlet with filter value and fetch response
document.getElementById('filter').addEventListener('submit', async ()=> {

  const filter = this.element["category"].value;
  const url = 'products' + encodeURIComponent(filter);

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

//open and close functions for add new product model
const openModel = () =>{
  document.getElementById('addProductModal').style.display = 'flex';
  document.body.style.overflowY = 'hidden';
}
const closeModal = () =>{
  document.getElementById('addProductModal').style.display = 'none';
  document.getElementById('fileName').textContent = 'No file chosen';
  document.body.style.overflowY = '';
}

document.querySelector(".js-add-new-product").addEventListener('click',openModel);
document.querySelector(".js-close").addEventListener('click',closeModal);

window.onclick = (event) => {
  const modal = document.getElementById('addProductModal');
  if (event.target === modal) {
      modal.style.display = 'none';
      document.getElementById('fileName').textContent = 'No file chosen';
  }
}

//display upload images names in add product model
document.getElementById('productImage').addEventListener('change', function() {
  document.getElementById('fileName')
      .textContent = this.files[0] ? this.files[0].name : 'No file chosen';
});

//open and close functions for edit product details
const openEditModel = () =>{
  document.getElementById('editProductModal').style.display = 'flex';
  document.body.style.overflowY = 'hidden';
}

const closeEditModal = () =>{
  document.getElementById('editProductModal').style.display = 'none';
  document.body.style.overflowY = '';
  document.getElementById('fileName').textContent = 'No file chosen';
}

document.querySelectorAll(".js-edit-btn").forEach(btn =>{
  btn.addEventListener("click", openEditModel);
})

document.querySelector(".js-edit-close").addEventListener('click',closeEditModal);

window.onclick = (event) => {
  const modal = document.getElementById('editProductModal');
  if (event.target === modal) {
    modal.style.display = 'none';
    document.getElementById('fileName').textContent = 'No file chosen';
  }
}
//display upload images names in edit model
document.getElementById('editProductImage').addEventListener('change', function() {
  document.getElementById('fileName')
      .textContent = this.files[0] ? this.files[0].name : 'No file chosen';
});

document.querySelectorAll('.js-edit-btn').forEach((btn) => {
  btn.addEventListener('click', async (event) => {
    const productId = event.currentTarget.dataset.id;
    try{
      const response = await fetch(`edit-product?id=${productId}`, {
        method: "GET",
      })

      if (response.ok) {
        console.log(response.message);
      }

    }catch(err){
      console.error(err.message);
    }
  });
});