const db = require("../models");
const BookAuthor = db.book_author;
const Op = db.Sequelize.Op;

// Create and Save a new BookAuthor
exports.create = (req, res) => {
    const admin = res.locals.member.username;
    if (admin != 'admin'){
      return res.status(401).send({
        message:
          "Unauthorized"
      });
    }
    // Validate request
    if (!req.body.book_id || !req.body.author_id) {
      res.status(400).send({
        message: "Content can not be empty!"
      });
      return;
    }
  
    // Create a BookAuthor
    const book_author = {
      book_id: req.body.book_id,
      author_id: req.body.author_id
    };
  
    // Save Author in the database
    BookAuthor.create(book_author)
      .then(data => {
        res.status(200).send(data);
      })
      .catch(err => {
        res.status(500).send({
          message:
            err.message || "Some error occurred while creating the BookAuthor."
        });
      });
  };

// Retrieve all BookAuthor from the database.
exports.findAll = (req, res) => {  
  BookAuthor.findAll({ 
        attributes: ['book_id', 'author_id'],
        order: [['book_id', 'ASC']]
      })
      .then(data => {
        res.status(200).send(data);
      })
      .catch(err => {
        res.status(500).send({
          message:
            err.message || "Some error occurred while retrieving BookAuthors."
        });
      });
  };

// Find a single BookAuthor with an id
exports.findOne = (req, res) => {
  const admin = res.locals.member.username;
    if (admin != 'admin'){
      return res.status(401).send({
        message:
          "Unauthorized"
      });
    }
  const book_id = req.params.book_id;
  const author_id = req.params.author_id;
  
  BookAuthor.findOne({
        where: {
          book_id: book_id,
          author_id: author_id
        },
        attributes: ['book_id', 'author_id'],
        order: [['book_id', 'ASC']]
      })
      .then(data => {
        if (data) {
          res.status(200).send(data);
        } else {
          res.status(404).send({
            message: `Cannot find BookAuthor with book_id=${book_id} and author_id=${author_id}.`
          });
        }
      })
      .catch(err => {
        res.status(500).send({
          message: "Error retrieving BookAuthor with book_id=" + book_id+" and author_id=" + author_id
        });
      });
  };

// Update a BookAuthor by the id in the request
exports.update = (req, res) => {
    const admin = res.locals.member.username;
      if (admin != 'admin'){
        return res.status(401).send({
          message:
            "Unauthorized"
        });
      }
    const book_id = req.params.book_id;
    const author_id = req.params.author_id;

    BookAuthor.update(req.body, {
      where: {
        book_id: book_id,
        author_id: author_id
      }
    })
      .then(num => {
        if (num == 1) {
          res.status(200).send({
            message: "BookAuthor was updated successfully."
          });
        } else {
          res.status(404).send({
            message: `Cannot update BookAuthor with book_id=${book_id} and author_id=${author_id}. Maybe BookAuthor was not found or req.body is empty!`
          });
        }
      })
      .catch(err => {
        res.status(500).send({
          message: "Error updating Author with book_id=" + book_id + " and author_id=" + author_id
        });
      });
  };

// Delete a BookAuthor with the specified id in the request
exports.delete = (req, res) => {
    const admin = res.locals.member.username;
      if (admin != 'admin'){
        return res.status(401).send({
          message:
            "Unauthorized"
        });
      }
    const book_id = req.params.book_id;
    const author_id = req.params.author_id;
  
    BookAuthor.destroy({
      where: { 
        book_id: book_id,
        author_id: author_id
       }
    })
      .then(num => {
        if (num == 1) {
          res.status(200).send({
            message: "BookAuthor was deleted successfully!"
          });
        } else {
          res.status(404).send({
            message: `Cannot delete BookAuthor with book_id=${book_id} and author_id=${author_id}. Maybe Author was not found!`
          });
        }
      })
      .catch(err => {
        res.status(500).send({
          message: "Could not delete Author with book_id=" + book_id + " and author_id=" + author_id
        });
      });
  };

