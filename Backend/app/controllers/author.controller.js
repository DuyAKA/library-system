const db = require("../models");
const Author = db.author;
const Op = db.Sequelize.Op;

// Create and Save a new Author
exports.create = (req, res) => {
    // Validate request
    if (!req.body.first_name || !req.body.last_name) {
      res.status(400).send({
        message: "Content can not be empty!"
      });
      return;
    }
    
    const admin = res.locals.member.username;
    if (admin != 'admin'){
      return res.status(401).send({
        message:
          "Unauthorized"
      });
    }

    // Create a Author
    const author = {
      first_name: req.body.first_name,
      last_name: req.body.last_name,
      description: req.body.description
    };
  
    // Save Author in the database
    Author.create(author)
      .then(data => {
        res.status(200).send(data);
      })
      .catch(err => {
        res.status(500).send({
          message:
            err.message || "Some error occurred while creating the Author."
        });
      });
  };

// Retrieve all Authors from the database.
exports.findAll = (req, res) => {
    Author.findAll({ 
        attributes: ['id', 'first_name', 'last_name','description'],
        order: [['id', 'ASC']]
      })
      .then(data => { 
        res.status(200).send(data);
      })
      .catch(err => {
        res.status(500).send({
          message:
            err.message || "Some error occurred while retrieving authors."
        });
      });
  };

// Find a single Author with an id
exports.findOne = (req, res) => {
    const id = req.params.id;
  
    const admin = res.locals.member.username;
    if (admin != 'admin'){
      return res.status(401).send({
        message:
          "Unauthorized"
      });
    }

    Author.findByPk(
        id,
        { attributes: ['id', 'first_name', 'last_name','description'] }
      )
      .then(data => {
        if (data) {
          res.status(200).send(data);
        } else {
          res.status(404).send({
            message: `Cannot find Author with id=${id}.`
          });
        }
      })
      .catch(err => {
        res.status(500).send({
          message: "Error retrieving Author with id=" + id
        });
      });
  };

// Update a Author by the id in the request
exports.update = (req, res) => {
    const id = req.params.id;
  
    const admin = res.locals.member.username;
    if (admin != 'admin'){
      return res.status(401).send({
        message:
          "Unauthorized"
      });
    }

    Author.update(req.body, {
      where: { id: id }
    })
      .then(num => {
        if (num == 1) {
          res.status(200).send({
            message: "Author was updated successfully."
          });
        } else {
          res.status(404).send({
            message: `Cannot update Author with id=${id}. Maybe Author was not found or req.body is empty!`
          });
        }
      })
      .catch(err => {
        res.status(500).send({
          message: "Error updating Author with id=" + id
        });
      });
  };

// Delete a Author with the specified id in the request
exports.delete = (req, res) => {
    const admin = res.locals.member.username;
    if (admin != 'admin'){
      return res.status(401).send({
        message:
          "Unauthorized"
      });
    }
    const id = req.params.id;
  
    Author.destroy({
      where: { id: id }
    })
      .then(num => {
        if (num == 1) {
          res.status(200).send({
            message: "Author was deleted successfully!"
          });
        } else {
          res.status(404).send({
            message: `Cannot delete Author with id=${id}. Maybe Author was not found!`
          });
        }
      })
      .catch(err => {
        res.status(500).send({
          message: "Could not delete Author with id=" + id
        });
      });
  };


