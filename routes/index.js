const express = require("express");
const controllers = require("../controllers");
const router = express.Router();

// routes
const books = "/Books"
router.route(`${books}`)
    .get(controllers.getAllBooks)
    .post(controllers.createBook)
    .delete(controllers.deleteBook);

router.route(`${books}/:id`)
    .get(controllers.getBook)
    .put(controllers.updateBook);

router.route(`${books}/ByAuthor`)
    .get(controllers.getAllBooks);

// router
//     .route("/:id")
//     .get(controllers.getBook)
//     .put(controllers.updateTodo)
//     .delete(controllers.deleteTodo);

module.exports = router;