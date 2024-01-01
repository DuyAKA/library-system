module.exports = (sequelize, Sequelize) => {
    const Book = require('./book.model')(sequelize, Sequelize);
    const Author = require('./author.model')(sequelize, Sequelize);
    const Member = require('./member.model')(sequelize, Sequelize);
    const BookAuthor = require('./book_author.model')(sequelize, Sequelize);
    const Loan = require('./loan.model')(sequelize, Sequelize);
    const FeePayment = require('./fee_payment.model')(sequelize, Sequelize);
    const Reservation = require('./reservation.model')(sequelize, Sequelize);

    // Define associations between models
    Book.belongsToMany(Author, { through: BookAuthor, foreignKey: 'book_id' });
    Author.belongsToMany(Book, { through: BookAuthor, foreignKey: 'author_id' });

    Loan.belongsTo(Book, { foreignKey: 'book_id' });
    Book.hasMany(Loan, { foreignKey: 'book_id' });
    Loan.belongsTo(Member, { foreignKey: 'member_username' });
    Member.hasMany(Loan, { foreignKey: 'member_username' });

    Reservation.belongsTo(Book, { foreignKey: 'book_id' });
    Book.hasMany(Reservation, { foreignKey: 'book_id' });
    Reservation.belongsTo(Member, { foreignKey: 'member_username' });
    Member.hasMany(Reservation, { foreignKey: 'member_username' });

    return {
        Book,
        Author,
        Member,
        Loan,
        FeePayment,
        Reservation,
        BookAuthor
    };
};