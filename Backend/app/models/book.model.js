module.exports = (sequelize, Sequelize) => {  
    const Book = sequelize.define('book', {
        id: {
          type: Sequelize.INTEGER,
          allowNull: false,
          primaryKey: true,
          autoIncrement: true
        },
        title: {
          type: Sequelize.STRING,
          allowNull: false
        },
        category: {
          type: Sequelize.STRING,
          allowNull: false,
        },
        publication_date: {
          type: Sequelize.DATEONLY,
          allowNull: false
        },
        copies_owned: {
          type: Sequelize.INTEGER,
          allowNull: false,
          defaultValue: 0
        },
        image: {
          type: Sequelize.STRING(500),
          allowNull: true,
        },
        description: {
            type: Sequelize.STRING(300),
            allowNull: true,
        }
      }, {
        tableName: 'book',
        timestamps: false,
      });
      
  
    return Book;
  };
  