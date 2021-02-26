const track = () => {
    const scriptURL = 'https://script.google.com/macros/s/AKfycbyrgoY6RcgHkvOp2a0OJPzNZr21tvLGkmE9jIMpUOMTWo0PluHI/exec';

    let name = document.getElementById('navbarDropdown').getAttribute('data-name').toLowerCase();

    const formData = new FormData();

    formData.append('name', name)
    if (name != 'fernando' && name != '') {
        fetch(scriptURL, { 
                method: 'POST',
                body: formData
            })
                .then(response => console.log('SUCCESS!!', response))
                .catch(error => console.log('ERROR', error.message))
        
        document.cookie = 'email' + '=;expires=Thu, 01 Jan 1970 00:00:01 GMT;';

    }
}
export default track;