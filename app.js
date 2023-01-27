const express = require('express');

const app = express();
const port = 3000;

app.get('/', (req, res) => {
    res.send('Hello World!')
})

// Route for books
app.get('/books', (req, res) => {
    // code to handle the request and create a new user
    res.send("youre ib books");
})

app.post('/books', (req, res) => {
    // code to handle the request and create a new user
})


/* app.get('/books/:id', (req, res) => {
    // code to handle the request and update the user with the specified id
});

app.put('/books/:id', (req, res) => {
    // code to handle the request and update the user with the specified id
});

app.delete('/books/:id', (req, res) => {
    // code to handle the request and delete the user with the specified id
}); */

  
app.listen(port, () => {
    console.log(`Example app listening on port ${port}`)
})