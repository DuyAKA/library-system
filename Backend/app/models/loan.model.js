module.exports = (sequelize, Sequelize) => {
  const Loan = sequelize.define('loan', {
    id: {
      type: Sequelize.INTEGER,
      primaryKey: true,
      allowNull: false,
      autoIncrement: true
    },
    book_id: {
      type: Sequelize.INTEGER,
      allowNull: false,
      references: {
        model: 'Book',
        key: 'id'
      }
    },
    member_username: {
      type: Sequelize.STRING,
      allowNull: false,
      references: {
        model: 'Member',
        key: 'username'
      }
    },
    loan_date: {
      type: Sequelize.DATEONLY,
      allowNull: false
    },
    returned_date: {
      type: Sequelize.DATEONLY
    },
    due_date: {
      type: Sequelize.DATEONLY
    },
    fee: {
      type: Sequelize.INTEGER
    }, 
    extent_times: {
      type: Sequelize.INTEGER
    }
  }, {
    tableName: 'loan',
    timestamps: false // assuming the table doesn't have createdAt/updatedAt columns
  });

  return Loan;
};
