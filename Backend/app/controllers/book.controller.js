const db = require("../models");
const Book = db.book;

// Create and Save a new Book
exports.create = (req, res) => {
    const admin = res.locals.member.username;
    if (admin != 'admin'){
      return res.status(401).send({
        message:
          "Unauthorized"
      });
    }

    // Validate request
    if (!req.body.title || !req.body.category || !req.body.copies_owned || !req.body.publication_date || !req.body.description || !req.body.image) {
      res.status(400).send({
        message: "Content can not be empty!"
      });
      return;
    }
  
    // Create a Book
    const book = {
      title: req.body.title,
      category: req.body.category,
      publication_date: req.body.publication_date,
      copies_owned: req.body.copies_owned,
      image: req.body.image,
      description: req.body.description
    };
  
    // Save Book in the database
    Book.create(book)
      .then(data => {
        res.status(200).send(data);
      })
      .catch(err => {
        res.status(500).send({
          message:
            err.message || "Some error occurred while creating the Book."
        });
      });
  };

// Retrieve all Books from the database.
exports.findAll = (req, res) => {
    Book.findAll({ 
      include: [{
        model: db.author,
        through: {
          model: db.book_author,
          attributes: [],
        },
        order: [['id', 'ASC']]
      }],
      order: [['id', 'ASC']]
    })
    .then(data => {
      res.status(200).send(data);
    })
    .catch(err => {
      res.status(500).send({
        message:
          err.message || "Some error occurred while retrieving books."
      });
    });
  };

// Find a single Book with an id
exports.findOne = (req, res) => {
    const admin = res.locals.member.username;
      if (admin != 'admin'){
        return res.status(401).send({
          message:
            "Unauthorized"
        });
      }
    const id = req.params.id;
    Book.findByPk(
        id
      )
      .then(data => {
        if (data) {
          res.status(200).send(data);
        } else {
          res.status(404).send({
            message: `Cannot find Book with id=${id}.`
          });
        }
      })
      .catch(err => {
        res.status(500).send({
          message: "Error retrieving Book with id=" + id
        });
      });
  };

// Update a Book by the id in the request
exports.update = (req, res) => {
    const id = req.params.id;
      
    Book.update(req.body, {
      where: { id: id }
    })
      .then(num => {
        if (num == 1) {
          res.status(200).send({
            message: "Book was updated successfully."
          });
        } else {
          res.status(404).send({
            message: `Cannot update Book with id=${id}. Maybe Book was not found or req.body is empty!`
          });
        }
      })
      .catch(err => {
        res.status(500).send({
          message: "Error updating Book with id=" + id
        });
      });
  };

// Delete a Book with the specified id in the request
exports.delete = (req, res) => {
    const admin = res.locals.member.username;
    if (admin != 'admin'){
      return res.status(401).send({
        message:
          "Unauthorized"
      });
    }
    const id = req.params.id;
  
    Book.destroy({
      where: { id: id }
    })
      .then(num => {
        if (num == 1) {
          res.status(200).send({
            message: "Book was deleted successfully!"
          });
        } else {
          res.status(404).send({
            message: `Cannot delete Book with id=${id}. Maybe Book was not found!`
          });
        }
      })
      .catch(err => {
        res.status(500).send({
          message: "Could not delete Book with id=" + id
        });
      });
  };

  
  
  
  
  
  
  


