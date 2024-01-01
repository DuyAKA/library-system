const db = require("../models");
const Loan = db.loan;
const Op = db.Sequelize.Op;
const {sequelize, Sequelize}= require("../config/sequelize");

// Create and Save a new Loan
exports.create = (req, res) => {
    // Validate request
    if (!req.body.book_id || !req.body.member_username) {
      res.status(400).send({
        message: "Content can not be empty!"
      });
      return;
    }

    var loan_date = new Date().toISOString().slice(0, 10);
    var due_date = new Date();
    if (req.body.loan_date){
      loan_date = req.body.loan_date;
    }

    if (req.body.duration) {
      due_date = new Date(due_date.getTime() + req.body.duration * 24 * 60 * 60 * 1000);
      // Add the specified number of days to the due_date and convert it to milliseconds
    } else {
      due_date = new Date(due_date.getTime() + 14 * 24 * 60 * 60 * 1000);
      // Add 14 days to the due_date and convert it to milliseconds
    }
    
    due_date = due_date.toISOString().slice(0, 10);

    // Create a Loan
    const loan = {
      book_id: req.body.book_id,
      member_username: req.body.member_username,
      returned_date: req.body.returned_date,
      loan_date: loan_date,
      due_date: due_date
    };
  
    // Save Loan in the database
    Loan.create(loan)
      .then(data => {
        res.status(200).send(data);
      })
      .catch(err => {
        res.status(500).send({
          message:
            err.message || "Some error occurred while creating the Loan."
        });
      });
  };

// Retrieve all Loans from the database.
exports.findAll = (req, res) => {
    Loan.findAll({ 
        order: [['id', 'ASC']],
      })
      .then(data => {
        res.status(200).send(data);
      })
      .catch(err => {
        res.status(500).send({
          message:
            err.message || "Some error occurred while retrieving Loans."
        });
      });
  };

exports.findAllLoaned = (req, res) => {
    const admin = res.locals.member.username;
    if (admin != 'admin'){
      return res.status(401).send({
        message:
          "Unauthorized"
      });
    }
    Loan.findAll({ 
        where: {
          returned_date: {
            [Op.eq]: null
          } 
        },
        include: [{
          model: db.book
        }],
        order: [['id', 'ASC']]
      })
      .then(data => {
        res.status(200).send(data);
      })
      .catch(err => {
        res.status(500).send({
          message:
            err.message || "Some error occurred while retrieving Loans."
        });
      });
  };

// Find a single Loan with an id
exports.findOne = (req, res) => {
    const admin = res.locals.member.username;
      if (admin != 'admin'){
        return res.status(401).send({
          message:
            "Unauthorized"
        });
      }
    const id = req.params.id;
    
    Loan.findByPk(
        id,
      )
      .then(data => {
        if (data) {
          res.status(200).send(data);
        } else {
          res.status(404).send({
            message: `Cannot find Loan with id=${id}.`
          });
        }
      })
      .catch(err => {
        res.status(500).send({
          message: "Error retrieving Loan with id=" + id
        });
      });
  };

// Update a Loan by the id in the request
exports.update = (req, res) => {
    const id = req.params.id;
  
    const admin = res.locals.member.username;
    if (admin != 'admin'){
      return res.status(401).send({
        message:
          "Unauthorized"
      });
    }

    Loan.update(req.body, {
      where: { id: id }
    })
      .then(num => {
        if (num == 1) {
          res.status(200).send({
            message: "Loan was updated successfully."
          });
        } else {
          res.status(404).send({
            message: `Cannot update Loan with id=${id}. Maybe Loan was not found or req.body is empty!`
          });
        }
      })
      .catch(err => {
        res.status(500).send({
          message: "Error updating Loan with id=" + id
        });
      });
  };

// Delete a Loan with the specified id in the request
exports.delete = (req, res) => {
    const id = req.params.id;
    const admin = res.locals.member.username;
    if (admin != 'admin'){
      return res.status(401).send({
        message:
          "Unauthorized"
      });
    }
    Loan.destroy({
      where: { id: id }
    })
      .then(num => {
        if (num == 1) {
          res.status(200).send({
            message: "Loan was deleted successfully!"
          });
        } else {
          res.status(404).send({
            message: `Cannot delete Loan with id=${id}. Maybe Loan was not found!`
          });
        }
      })
      .catch(err => {
        res.status(500).send({
          message: "Could not delete Loan with id=" + id
        });
      });
  };

  //create a new loan based on token
exports.create_loan = (req, res) => {
  const member_username = res.locals.member.username;
  const bookId = req.body.book_id;

  const loanDate = new Date().toISOString().slice(0, 10);
  var due_date = new Date;
  if (req.body.duration) {
    due_date = new Date(due_date.getTime() + req.body.duration * 24 * 60 * 60 * 1000);
    // Add the specified number of days to the due_date and convert it to milliseconds
  } else {
    due_date = new Date(due_date.getTime() + 14 * 24 * 60 * 60 * 1000);
    // Add 14 days to the due_date and convert it to milliseconds
  }

  const loan = {
    book_id: bookId,
    member_username: member_username,
    loan_date: loanDate,
    due_date: due_date
  };

  Loan.create(loan)
    .then(data => {
      res.status(200).send(data);
    })
    .catch(err => {
      res.status(500).send({
        message:
          err.message || "Some error occurred while creating the Loan."
      });
    });
};

exports.finish = (req, res) => {
  const username = res.locals.member.username;
  const loan_id = req.params.id;
  const returned_date = new Date().toISOString().slice(0, 10);

  Loan.findByPk(
    loan_id
  )
  .then(data => {
    if (data.fee != 0){
      return res.status(402).send("Need to pay fee");
    } else {
      Loan.update({
        returned_date: returned_date
      }, {
        where: { 
          id: loan_id, 
          returned_date: null, 
          member_username: username
        }
      })
        .then(num => {
          if (num == 1) {
            Loan.findByPk(
              loan_id
            )
            .then(data => {
              db.book.update({
                copies_owned: sequelize.literal('copies_owned + 1')
              }, {
                where: {
                  id: data.book_id
                }
              })
              .then(data => {
                res.status(200).send({
                  message: "Loan was updated successfully."
                });
              })
              .catch(err => {
                console.log("book error "+ err);
              });
            })
            .catch(err => {
              console.log("book error "+ err);
            });
    
          } else {
            return res.status(405).send("Book already returned");
          }
        })
        .catch(err => {
          res.status(500).send({
            message: "Error updating Loan with id=" + loan_id
          });
        });
    }
  })
};

exports.expand = (req, res) => {
  const loan_id = req.params.id;
  const username = res.locals.member.username;
  Loan.findByPk(
    loan_id
  )
  .then(data => {
    if (data.returned_date != null){
      return res.status(405).send("Book already returned");
    }
    if (!req.body.duration) {
      return res.status(400).send("Missing duration");
    }
    const current_due_date = new Date(data.due_date);
    const new_due_date = new Date(current_due_date.getTime() + req.body.duration * 24 * 60 * 60 * 1000);
    Loan.update({
      due_date: new_due_date,
      extent_times: sequelize.literal('extent_times + 1'),
      fee: sequelize.literal('fee + 25000 * (extent_times + 1)'),
    }, {
      where: {
        id: data.id,
        member_username: username
      }
    })
      .then(num => {
        if (num == 1) {
          res.status(200).send({
            message: "Loan was updated successfully."
          });
        } else {
          res.status(404).send({
            message: `Cannot update Loan with id=${loan_id}. Maybe Loan was not found or empty!`
          });
        }
      })
      .catch(err => {
        res.status(500).send({
          message: "Error updating Loan with id=" + loan_id
        });
      });
  })
  .catch(err => {
    res.status(500).send({
      message:
        err.message || "Some error occurred while retrieving Loans."
    });
  });
};