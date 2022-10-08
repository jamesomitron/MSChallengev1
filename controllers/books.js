const helper = require("../helper");
const config = require("../config");
const {
  getDbDataService,
  postDbDataService,
} = require("../services/requestService");
const { errorHandler } = require("../helper/errorHandler");

const getBooks = async function (req, res, next) {
  try {
    let books = await getDbDataService(`SELECT * FROM books`);
    res.status(200).json({ status: 200, data: books });
  } catch (err) {
    console.error(`Error while getting books `, err.message);
    next(err);
  }
};

const postBooks = async function (req, res, next) {
  const {
    book_title,
    book_edition,
    book_author,
    book_publisher,
    book_copies,
    book_costs,
    book_remarks,
  } = req.body;
  try {
    let book = await postDbDataService(
      "books",
      "(book_title, book_edition, book_author, book_publisher, book_copies, book_costs, book_remarks)",
      `('${book_title}', '${book_edition}', '${book_author}', '${book_publisher}', '${book_copies}', '${book_costs}', '${book_remarks}')`
    );
    errorHandler(res, book, "post");
  } catch (err) {
    console.error(`Error while creating book profile`, err);
    res.status(400).json({ status: 400, message: err });
    next(err);
  }
};

const getBooksByAuthor = async function (req, res, next) {
  try {
    let books = await getDbDataService(
      `SELECT * FROM books WHERE book_author='${req.query.book_author}'`
    );
    errorHandler(res, books);
  } catch (err) {
    console.error(`Error while getting books by this author `, err.message);
    next(err);
  }
};
const getBooksByPublisher = async function (req, res, next) {
  try {
    let books = await getDbDataService(
      `SELECT * FROM books WHERE book_publisher='${req.query.book_publisher}'`
    );
    errorHandler(res, books);
  } catch (err) {
    console.error(`Error while getting books by this author `, err.message);
    next(err);
  }
};

const getBookById = async function (req, res, next) {
  try {
    let book = await getDbDataService(
      `SELECT * FROM books WHERE book_ID=${req.params.id}`
    );
    errorHandler(res, book);
  } catch (err) {
    console.error(`Error while getting books by this author `, err.message);
    res.status(400).json({ status: 400, message: err });
    next(err);
  }
};

const deleteBookById = async function (req, res, next) {
  try {
    let book = await getDbDataService(
      `DELETE FROM books WHERE book_ID=${req.params.id}`
    );
    errorHandler(res, book);
  } catch (err) {
    console.error(`Error while getting books by this author `, err.message);
    res.status(400).json({ status: 400, message: err });
    next(err);
  }
};

const updateBookById = async function (req, res, next) {
  let params = "";
  try {
    for (let key in req.body) {
      params += key + ` = "${req.body[key]}", `;
    }
    params = params.substring(0, params.length - 2);

    let book = await getDbDataService(
      `UPDATE books SET ${params} WHERE book_ID=${req.params.id}`
    );
    errorHandler(res, book);
  } catch (err) {
    console.error(`Error while getting books by this author `, err.message);
    res.status(400).json({ status: 400, message: err });
    next(err);
  }
};

const getBorrowedLast30days = async (req, res, next)=>{
  try {
    let book = await getDbDataService(
      `SELECT * FROM borrowersrecords WHERE DATE(borrowers_dateborrowed) >= (DATE(NOW()) - INTERVAL 30 DAY) AND DATE(borrowers_dateborrowed) < DATE(NOW())`
    );
    errorHandler(res, book);
  } catch (err) {
    console.error(`Error while getting books by this author `, err.message);
    res.status(400).json({ status: 400, message: err });
    next(err);
  }
}

module.exports = {
  getBooks,
  postBooks,
  getBooksByAuthor,
  getBooksByPublisher,
  getBookById,
  deleteBookById,
  updateBookById,
  getBorrowedLast30days,
};
