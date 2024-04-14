document.addEventListener('DOMContentLoaded', function () {
    const form = document.getElementsByTagName('form')[0];
    if (form.id === "registerForm") {
        form.addEventListener('submit', function (event) {
            event.preventDefault();
            const username = document.getElementById('username').value;
            const password = document.getElementById('password').value;
            localStorage.setItem(username, password);
            alert('Registration successful!');
            window.location.href = 'login.html';
        });
    } else if (form.id === "loginForm") {
        form.addEventListener('submit', function (event) {
            event.preventDefault();
            const username = document.getElementById('username').value;
            const password = document.getElementById('password').value;
            const storedPassword = localStorage.getItem(username);
            if (password === storedPassword) {
                window.location.href = '/dashboard/index.html'; // Assume a directory exists
            } else {
                alert('Incorrect username or password.');
            }
        });
    }
});