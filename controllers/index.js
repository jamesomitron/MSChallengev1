const AppError = require("../utils/appError");
const conn = require("../services/db");
const timeDiff = require("time-difference");

function getQuery(req, res, next, table, identifier) {
    conn.query(
        `select * from ${table} where ${identifier} = ?`,
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
}

function successResponse(req, res, next, query) {
    conn.query(`${query}`, function (err, data, fields) {
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
    successResponse(req, res, next, `select book_ID, book_title, book_edition, book_author, book_publisher from books`);
};

exports.getAllBooksByAuthor = async (req, res, next) => {
    successResponse(req, res, next, `SELECT book_author from books`);
};

exports.getAllBooksByPublisher = async (req, res, next) => {
    successResponse(req, res, next, `SELECT book_publisher from books`);
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
        return next(new AppError("No book id found, 404"));
    }

    getQuery(req, res, next, "books", "book_ID");
};

exports.getRecord = (req, res, next) => {
    if (!req.params.id) {
        return next(new AppError("No record id found, 404"));
    }

    getQuery(req, res, next, "borrowersrecords", "borrowers_ID");
}

exports.getReturnedRecords = (req, res, next) => {
    successResponse(req, res, next, "select * from bookreturnrecords");
}

exports.getSpecificReturnRecord = (req, res, next) => {
    if (!req.params.id) {
        return next(new AppError("No record id found, 404"));
    }

    getQuery(req, res, next, "bookreturnrecorddetails", "return_ID");
}

exports.getBorrowedRecords = (req, res, next) => {
    successResponse(req, res, next, `select * from borrowersrecords`);
}

exports.getBorrowedRecordsWithin30days = (req, res, next) => {
    conn.query(`select * from borrowersrecords`, function (err, data, fields) {
        if (err) return next(new AppError(err));
        
        // modify data
        data = data.filter(item => {
            const startDate = item.borrowers_dateborrowed;
            const endDate = item.borrowers_duereturndate;

            const days = timeDiff.absoluteDifference(startDate, endDate);
            // console.log(days)
            return days < 30? true: false; 
        });

        res.status(200).json({
            status: "success",
            message: "List of borrowed records within the last 30 days",
            length: data?.length,
            data: data
        });
    });
}

// exports.getBorrowedRecordsBetweenDates = (req, res, next) => {
//     if (!req.params.startDate && !req.params.endDate) {
//         return next(new AppError("No borrower record id found, 404"));
//     }
//     const query = `SELECT * FROM borrowersrecords WHERE borrowers_dateborrowed, borrowers_duereturndate= ?`;
//     conn.query(query, [req.params.startDate, req.params.startDate] ,function (err, data, fields) {
//         if (err) return next(new AppError(err));

//         res.status(200).json({
//             status: "success",
//             message: "List of borrowed records within the last 30 days",
//             length: data?.length,
//             data: data
//         });
//     });
// }

exports.updateBook = (req, res, next) => {
    if (!req.params.id) {
        return next(new AppError("No book id found", 404));
    }

    conn.query(
        "UPDATE books SET status='completed' WHERE id=?",
        [req.params.id],
        function (err, data, fields) {
            if (err) return next(new AppError(err, 500));
                res.status(201).json({
                status: "success",
                message: "book updated!",
            });
        }
    )
}


exports.deleteBook = (req, res, next) => {
    if (!req.params.id) {
        return next(new AppError("No book id found", 404));
    }

    conn.query(
        "DELETE FROM books WHERE id=?",
        [req.params.id],
        function (err, fields) {
            if (err) return next(new AppError(err, 500));
            res.status(201).json({
                status: "success",
                message: "book deleted!"
            });
        }
    );
}