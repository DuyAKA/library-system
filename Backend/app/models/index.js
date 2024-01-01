const {sequelize, Sequelize}= require("../config/sequelize");

const db = {};

db.Sequelize = Sequelize;
db.sequelize = sequelize;

const data = require("./associations.js")(sequelize, Sequelize);
db.author = data.Author;
db.book = data.Book;
db.book_author = data.BookAuthor;
db.fine = data.Fine;
db.fee_payment = data.FeePayment;
db.loan = data.Loan;
db.member = data.Member;
db.reservation = data.Reservation;

module.exports = db;