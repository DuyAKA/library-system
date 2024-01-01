const db = require("../models");
const Reservation = db.reservation;
const Op = db.Sequelize.Op;

// Create and Save a new Reservation
exports.create = (req, res) => {
    // Validate request
    if (!req.body.book_id || !req.body.member_username || !req.body.status) {
      res.status(400).send({
        message: "Content can not be empty!"
      });
      return;
    }

    var reservation_date = new Date().toISOString().slice(0, 10);
    if (req.body.reservation_date){
      reservation_date = req.body.reservation_date;
    }
  
    // Create a Reservation
    const reservation = {
      book_id: req.body.book_id,
      member_username: req.body.member_username,
      status: req.body.status,
      reservation_date: reservation_date
    };
  
    // Save Reservation in the database
    Reservation.create(reservation)
      .then(data => {
        res.send(data);
      })
      .catch(err => {
        res.status(500).send({
          message:
            err.message || "Some error occurred while creating the Reservation."
        });
      });
  };

// Retrieve all Reservations from the database.
exports.findAll = (req, res) => {
    Reservation.findAll({ 
        attributes: ['id', 'book_id', 'member_username','reservation_date','status'],
        order: [['id', 'ASC']]
      })
      .then(data => {
        res.send(data);
      })
      .catch(err => {
        res.status(500).send({
          message:
            err.message || "Some error occurred while retrieving Reservations."
        });
      });
  };

// Find a single Reservation with an id
exports.findOne = (req, res) => {
    const id = req.params.id;
  
    Reservation.findByPk(
        id,
        { attributes: ['id', 'book_id', 'member_username','reservation_date','status'] }
      )
      .then(data => {
        if (data) {
          res.send(data);
        } else {
          res.status(404).send({
            message: `Cannot find Reservation with id=${id}.`
          });
        }
      })
      .catch(err => {
        res.status(500).send({
          message: "Error retrieving Reservation with id=" + id
        });
      });
  };

// Update a Reservation by the id in the request
exports.update = (req, res) => {
    const id = req.params.id;
  
    Reservation.update(req.body, {
      where: { id: id }
    })
      .then(num => {
        if (num == 1) {
          res.send({
            message: "Reservation was updated successfully."
          });
        } else {
          res.send({
            message: `Cannot update Reservation with id=${id}. Maybe Reservation was not found or req.body is empty!`
          });
        }
      })
      .catch(err => {
        res.status(500).send({
          message: "Error updating Reservation with id=" + id
        });
      });
  };

// Delete a Reservation with the specified id in the request
exports.delete = (req, res) => {
    const id = req.params.id;
  
    Reservation.destroy({
      where: { id: id }
    })
      .then(num => {
        if (num == 1) {
          res.send({
            message: "Reservation was deleted successfully!"
          });
        } else {
          res.send({
            message: `Cannot delete Reservation with id=${id}. Maybe Reservation was not found!`
          });
        }
      })
      .catch(err => {
        res.status(500).send({
          message: "Could not delete Reservation with id=" + id
        });
      });
  };

