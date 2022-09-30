const booksRoutes = require('./books');
const {Router} = require('express')
const router = new Router();

router.use('/books', booksRoutes);

module.exports = router;
