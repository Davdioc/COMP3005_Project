const express = require('express');
const bodyParser = require('body-parser');
const session = require('express-session');
const pool = require('./db'); // Import the database connection pool
const bcrypt = require('bcrypt');

const app = express();
const PORT = 3001;

app.use(bodyParser.urlencoded({ extended: true }));
app.use(session({
    secret: 'your_secret_key',
    resave: false,
    saveUninitialized: true
}));

// Serve static files like CSS, images, etc.
app.use(express.static('public'));

// Routes
app.get('/', (req, res) => {
    res.sendFile(__dirname + '/public/login.html');
});

app.get('/register', (req, res) => {
    res.sendFile(__dirname + '/public/register.html');
});

app.post('/register', async (req, res) => {
    const { firstname, lastname, email, password, phone } = req.body;
    try {
        console.log("Registering user...");
        const newUser = await pool.query(
            'INSERT INTO member (first_name, last_name, email, password, phone) VALUES ($1, $2, $3, $4, $5) RETURNING *',
            [firstname, lastname, email, password, phone]
        );
        res.redirect('/login'); // Redirect to login page after successful registration
    } catch (error) {
        console.error(error);
        res.send('Failed to register');
    }
});

app.get('/login', (req, res) => {
    res.sendFile(__dirname + '/public/login.html');
});

app.post('/login', async (req, res) => {
    const { email, password } = req.body;
    try {
        const result = await pool.query(
            'SELECT * FROM member WHERE email = $1',
            [email]
        );
        if (result.rows.length > 0) {
            const user = result.rows[0];
            if (user.password==password) {
                req.session.user = { firstName: user.first_name, lastName: user.last_name, email: user.email };  // set user session or any other identifier
                res.redirect('/dashboard');
            } else {
                res.send('Invalid username or password');
            }
        } else {
            res.send('User not found');
        }
    } catch (error) {
        console.error(error);
        res.status(500).send('Login error');
    }
});
app.set('view engine', 'ejs');
app.set('views', './views')
app.use('/dashboard', express.static('path/to/dashboard'));
app.get('/dashboard', (req, res) => {
    if (req.session.user) {
        res.render('dashboard', { user: req.session.user });
    } else {
        res.redirect('/login');
    }
});
app.listen(PORT, () => {
    console.log(`Server running on http://localhost:${PORT}`);
});