module.exports = (sequelize, Sequelize) => {
  const FeePayment = sequelize.define('fee_payment', {
    loan_id: {
      type: Sequelize.INTEGER,
      primaryKey: true,
      allowNull: false,
    },
    payment_date: {
      type: Sequelize.DATE,
    },
    payment_amount: {
      type: Sequelize.INTEGER,
    }
  }, {
    tableName: 'fee_payment',
    timestamps: false
  });
  

  return FeePayment;
};
