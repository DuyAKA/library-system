module.exports = (sequelize, Sequelize) => {
  const Reservation = sequelize.define('reservation', {
    id: {
      type: Sequelize.INTEGER,
      allowNull: false,
      primaryKey: true,
      autoIncrement: true
    },
    book_id: {
      type: Sequelize.INTEGER,
      allowNull: false,
      references: {
        model: 'book',
        key: 'id'
      }
    },
    member_username: {
      type: Sequelize.INTEGER,
      allowNull: false,
      references: {
        model: 'member',
        key: 'username'
      }
    },
    reservation_date: {
      type: Sequelize.DATEONLY,
      allowNull: false
    },
    status: {
      type: Sequelize.STRING,
      allowNull: false,
    }
  }, {
    tableName: 'reservation',
    timestamps: false
  });
  

  return Reservation;
};
