module.exports = (sequelize, Sequelize) => {
  const BookAuthor = sequelize.define('book_author', {
    book_id: {
      type: Sequelize.INTEGER,
      allowNull: false,
      primaryKey: true,
      references: {
        model: 'book',
        key: 'id'
      }
    },
    author_id: {
      type: Sequelize.INTEGER,
      allowNull: false,
      primaryKey: true,
      references: {
        model: 'author',
        key: 'id'
      }
    }
  }, {
    tableName: 'book_author',
    timestamps: false // assuming the table doesn't have createdAt/updatedAt columns
  });

  return BookAuthor;
};
