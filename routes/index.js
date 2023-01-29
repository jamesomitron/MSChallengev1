const express = require("express");
const controllers = require("../controllers");
const router = express.Router();

// routes
const books = "/Books";
const borrowed = "/Borrowed";
const returned = "/Returned";

router.route(`${books}`)
    .get(controllers.getAllBooks)
    .post(controllers.createBook)
    .delete(controllers.deleteBook);

router.route(`${books}/ByAuthor`)
    .get(controllers.getAllBooksByAuthor); 

router.route(`${books}/ByPublisher`)
    .get(controllers.getAllBooksByPublisher); 

router.route(`${books}/Borrowed`)
    .get(controllers.getBorrowedRecords);

router.route(`${books}/Borrowed/Last30Days`)
    .get(controllers.getBorrowedRecordsWithin30days);

// router.route(`${books}/Borrowed/:dateFrom/:dateTo`)
//     .get(controllers.getBorrowedRecordsBetweenDates);

router.route(`${books}/:id`)
    .get(controllers.getBook)
    .put(controllers.updateBook);

router.route(`${borrowed}`)
    .get(controllers.getBorrowedRecords)
    .post(controllers.createBook);

router.route(`${borrowed}/:id`)
    .get(controllers.getRecord);


router.route(`${returned}`)
    .get(controllers.getReturnedRecords);

router.route(`${returned}/:id`)
    .get(controllers.getSpecificReturnRecord);

module.exports = router;