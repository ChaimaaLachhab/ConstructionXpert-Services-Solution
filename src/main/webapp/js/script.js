function displaySelectedImage(event) {
    const selectedFile = event.target.files[0];
    const reader = new FileReader();

    reader.onload = function () {
        const output = document.getElementById('selectedImage');
        output.src = reader.result;
        const uploadBtn = document.querySelector('.btn2');
        uploadBtn.style.display = 'none';
    }

    reader.readAsDataURL(selectedFile);
}