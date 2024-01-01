module.exports = (sequelize, Sequelize) => {
  const Author = sequelize.define('author', {
    id: {
      type: Sequelize.INTEGER,
      allowNull: false,
      autoIncrement: true,
      primaryKey: true,
    },
    first_name: {
      type: Sequelize.STRING,
      allowNull: false,
    },
    last_name: {
      type: Sequelize.STRING,
      allowNull: false,
    },
    description: {
      type: Sequelize.STRING(300),
      allowNull: true,
    },
  }, {
    tableName: 'author',
    timestamps: false,
  });

  return Author;
};
