const db = require("../models");
const Book = db.book;
const Op = db.Sequelize.Op;
const {sequelize, Sequelize}= require("../config/sequelize");


// Sreach a Book using the Book.title
exports.searchByBookTitle = (req, res) => {
    // const title = req.body.title;
    const title = req.query.title;
    Book.findAll({ 
      include: [{
        model: db.author,
        through: {
          model: db.book_author,
          attributes: [],
        },
        order: [['id', 'ASC']]
      }],
      order: [['id', 'ASC']],
      where: {
        title: {
          [Op.iLike]: `%${title}%` // Use iLike to do a case-insensitive search
        }
      }
    })
    .then(data => {
      if (data) {
        res.status(200).send(data);
      } else {
        res.status(404).send({
          message: `Cannot find Book with title=${title}.`
        });
      }
    })
    .catch(err => {
      res.status(500).send({
        message: "Error retrieving Book with title=" + title
      });
    });
  };

// Sreach Books using the the Author's name
  exports.searchByAuthorName = (req, res) => {
    const authorName = req.query.authorName;
    var bookIDs = [];
    Book.findAll({
      attributes: ['id'],
      include: [
        {
          model: db.author,
          attributes: [],
          where: {
            [Op.or]: [
              sequelize.where(
                sequelize.fn('concat', sequelize.col('authors.first_name'), ' ', sequelize.col('authors.last_name')),
                {
                  [Op.iLike]: `%${authorName}%`
                }
              ),
            ],
          },
          through: {
            model: db.book_author,
            attributes: [],
          },
        },
      ],
    })
    .then((data) => {
      data.map(book => {
        bookIDs.push(book.id);
      });
      Book.findAll({ 
        include: [{
          model: db.author,
          through: {
            model: db.book_author,
            attributes: [],
          },
          order: [['id', 'ASC']]
        }],
        order: [['id', 'ASC']],
        where: {
          id: {
            [Op.in]: bookIDs
          }
        }
      })
      .then(data => {
        if (data) {
          res.status(200).send(data);
        } else {
          res.status(404).send({
            message: `Cannot find Book with authorName=${authorName}.`
          });
        }
      })
      .catch(err => {
        res.status(500).send({
          message: "Error retrieving Book with authorName=" + authorName,
        });
      });
    })
    .catch((err) => {
      console.log(err);
      res.status(500).send({
        message: "Error retrieving Book with authorName=" + authorName,
      });
    });
  };
