const AppError = require("../utils/appError");
const conn = require("../services/db");

function successResponse(req, res, next, columns) {
    conn.query(`select ${columns} from books`, function (err, data, fields) {
        if (err) return next(new AppError(err));
        res.status(200).json({
            status: "success",
            length: data?.length,
            data: data
        });
    });
}

exports.getAllBooks = async (req, res, next) => {
    // console.log(req);
    successResponse(req, res, next, `book_ID, book_title, book_edition, book_author, book_publisher`);
};


exports.createBook = (req, res, next) => {
    // Request needs checking since we expect data from client
    if (!req.body) return next(new AppError("No form data found", 404));
    const values = [req.body.name, "pending"];

    conn.query(
        "INSERT INTO books (book_ID, book_title, book_edition, book_author, book_publisher, book_copies, book_costs, book_remarks) VALUES(?)",
        [values],
        function (err, data, fields) {
            if (err) return next(new AppError(err, 500));
            res.status(201).json({
                status: "success",
                message: "todolist created!"
            });
        }
    );
};


exports.getBook = (req, res, next) => {
    if (!req.params.id) {
        return next(new AppError("No todo id found, 404"));
    }

    conn.query(
        "select * from books where book_ID = ?",
        // "SELECT * FROM Customers WHERE Country='Mexico';",
        [req.params.id],
        function (err, data, fields) {
            if (err) return next(new AppError(err, 500));
            res.status(200).json({
                status: "success",
                length: data?.length,
                data: data
            });
        }
    );
};


exports.updateBook = (req, res, next) => {
    if (!req.params.id) {
        return next(new AppError("No todo id found", 404));
    }

    conn.query(
        "UPDATE books SET status='completed' WHERE id=?",
        [req.params.id],
        function (err, data, fields) {
            if (err) return next(new AppError(err, 500));
                res.status(201).json({
                status: "success",
                message: "todo updated!",
            });
        }
    )
}


exports.deleteBook = (req, res, next) => {
    if (!req.params.id) {
        return next(new AppError("No todo id found", 404));
    }

    conn.query(
        "DELETE FROM books WHERE id=?",
        [req.params.id],
        function (err, fields) {
            if (err) return next(new AppError(err, 500));
            res.status(201).json({
                status: "success",
                message: "todo deleted!"
            });
        }
    );
}