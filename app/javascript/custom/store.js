function store() {
    const createCookie = (name, value, days) => {
        let expires;
        if (days) {
          const date = new Date();
          date.setTime(date.getTime() + (days * 24 * 60 * 60 * 1000));
          expires = "; expires=" + date.toGMTString();
        } else {
          expires = "";
        }
        document.cookie = name + "=" + value + expires + "; path=/";
      }
    document.forms['new_user'].addEventListener('submit', () => {
        const email = document.getElementById('user_email').value;
        createCookie("email", email, 1);
    });
}

export default store;