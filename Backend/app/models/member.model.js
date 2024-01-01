module.exports = (sequelize, Sequelize) => {
  const Member = sequelize.define('member', {
    first_name: {
      type: Sequelize.STRING,
      allowNull: false
    },
    last_name: {
      type: Sequelize.STRING,
      allowNull: false
    },
    joined_date: {
      type: Sequelize.DATEONLY,
      allowNull: false
    },
    username: {
      type: Sequelize.STRING,
      primaryKey: true,
      allowNull: false,
    },
    password: {
      type: Sequelize.STRING,
      allowNull: false
    },
    email: {
      type: Sequelize.STRING
    }
  }, {
    tableName: 'member',
    timestamps: false
  });

  return Member;
};
