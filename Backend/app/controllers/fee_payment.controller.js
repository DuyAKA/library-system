const db = require("../models");
const FeePayment = db.fee_payment;
const Op = db.Sequelize.Op;

// Create and Save a new FeePayment
exports.create = (req, res) => {
    // Validate request
    if (!req.body.member_username || !req.body.payment_amount) {
      res.status(400).send({
        message: "Content can not be empty!"
      });
      return;
    }

    var payment_date = new Date().toISOString().slice(0, 10);
    if (req.body.fine_date){
      payment_date = req.body.payment_date;
    }
  
    // Create a FeePayment
    const fine_payment = {
      member_username: req.body.member_username,
      payment_date: payment_date,
      payment_amount: req.body.payment_amount,
    };
  
    // Save FeePayment in the database
    FeePayment.create(fine_payment)
      .then(data => {
        res.status(200).send(data);
      })
      .catch(err => {
        res.status(500).send({
          message:
            err.message || "Some error occurred while creating the FeePayment."
        });
      });
  };

// Retrieve all FeePayment from the database.
exports.findAll = (req, res) => {
    FeePayment.findAll({ 
        order: [['id', 'ASC']]
      })
      .then(data => {
        res.status(200).send(data);
      })
      .catch(err => {
        res.status(500).send({
          message:
            err.message || "Some error occurred while retrieving FeePayments."
        });
      });
  };

// Find a single FeePayment with an id
exports.findOne = (req, res) => {
    const id = req.params.id;
  
    FeePayment.findByPk(
        id,
      )
      .then(data => {
        if (data) {
          res.status(200).send(data);
        } else {
          res.status(404).send({
            message: `Cannot find FeePayment with id=${id}.`
          });
        }
      })
      .catch(err => {
        res.status(500).send({
          message: "Error retrieving FeePayment with id=" + id
        });
      });
  };

// Update a FeePayment by the id in the request
exports.update = (req, res) => {
    const id = req.params.id;
  
    FeePayment.update(req.body, {
      where: { id: id }
    })
      .then(num => {
        if (num == 1) {
          res.status(200).send({
            message: "FeePayment was updated successfully."
          });
        } else {
          res.status(404).send({
            message: `Cannot update FeePayment with id=${id}. Maybe FeePayment was not found or req.body is empty!`
          });
        }
      })
      .catch(err => {
        res.status(500).send({
          message: "Error updating FeePayment with id=" + id
        });
      });
  };

// Delete a FeePayment with the specified id in the request
exports.delete = (req, res) => {
    const id = req.params.id;
  
    FeePayment.destroy({
      where: { id: id }
    })
      .then(num => {
        if (num == 1) {
          res.status(200).send({
            message: "FeePayment was deleted successfully!"
          });
        } else {
          res.status(404).send({
            message: `Cannot delete FeePayment with id=${id}. Maybe FeePayment was not found!`
          });
        }
      })
      .catch(err => {
        res.status(500).send({
          message: "Could not delete FeePayment with id=" + id
        });
      });
  };


