const express = require("express");
const { Router } = express;
const booksController = require("../controllers/books");

const router = new Router();

router.route("/").get(booksController.getBooks).post(booksController.postBooks);
router.route("/by_author").get(booksController.getBooksByAuthor);
router.route("/by_publisher").get(booksController.getBooksByPublisher);
router
  .route("/:id")
  .get(booksController.getBookById)
  .delete(booksController.deleteBookById)
  .put(booksController.updateBookById);
router.route('/borrowers/last30days').get(booksController.getBorrowedLast30days);

module.exports = router;
