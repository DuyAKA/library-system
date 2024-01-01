const db = require("../models");
const Member = db.member;
const Op = db.Sequelize.Op;

const jwt = require('jsonwebtoken');
const secretKey = 'mysecretkey';
const bcrypt = require('bcryptjs');

// Retrieve all Members from the database.
exports.findAll = (req, res) => {
    Member.findAll({ 
      })
      .then(data => {
        res.status(200).send(data);
      })
      .catch(err => {
        res.status(500).send({
          message:
            err.message || "Some error occurred while retrieving Members."
        });
      });
  };

// Find a single Member with an username
exports.findOne = (req, res) => {
    const username = res.locals.member.username;

    Member.findOne({
      where: { username: username },
    })
      .then(data => {
        if (data) {
          res.status(200).send(data);
        } else {
          res.status(404).send({
            message: `Cannot find Member with username=${username}.`
          });
        }
      })
      .catch(err => {
        res.status(500).send({
          message: "Error retrieving Member with username=" + username
        });
      });
  };

// Update a Member by the id in the request
exports.update = (req, res) => {
    const username = res.locals.member.username;
  
    Member.update(req.body, {
      where: { username: username }
    })
      .then(num => {
        if (num == 1) {
          res.status(200).send({
            message: "Member was updated successfully."
          });
        } else {
          res.status(404).send({
            message: `Cannot update Member with id=${id}. Maybe Member was not found or req.body is empty!`
          });
        }
      })
      .catch(err => {
        res.status(500).send({
          message: "Error updating Member with id=" + username
        });
      });
  };

// Delete a Member with the specified id in the request
exports.delete = (req, res) => {
    const username = res.locals.member.username;
  
    Member.destroy({
      where: { username: username }
    })
      .then(num => {
        if (num == 1) {
          res.status(200).send({
            message: "Member was deleted successfully!"
          });
        } else {
          res.status(404).send({
            message: `Cannot delete Member with id=${id}. Maybe Member was not found!`
          });
        }
      })
      .catch(err => {
        res.status(500).send({
          message: "Could not delete Member with id=" + username
        });
      });
  };

exports.authenticate = (req, res) => {
  const { username, password } = req.body;

  // Find the user by their username
  member = Member.findOne({
    where: { username: username },
  })
  .then(member => {
    if (!member) {
      res.status(401).json({ error: 'No such user found' });
    } else {
      // Compare the hashed password with the plaintext password
      bcrypt.compare(password, member.password, (err, result) => {
        if (err || !result) {
          res.status(401).json({ error: 'Wrong password' });
        } else {
          const token = jwt.sign({ username}, secretKey, {
            expiresIn: '30m'});
          res.status(202).json({ token });
        }
      });
    }
  })
  .catch(err => {
    res.status(500).json({ error: err.message });
  });
};

exports.register = (req, res) => {
  const { first_name, last_name, username, password, email } = req.body;

  // Hash the password before storing it in the database
  bcrypt.hash(password, 10, (err, hash) => {
    if (err) {
      res.status(500).json({ error: err.message });
    } else {
      // Create a new member with the hashed password
      const member = {
        first_name: first_name,
        last_name: last_name,
        joined_date: new Date().toISOString().slice(0, 10),
        status: "active",
        username: username,
        password: hash,
        email: email
      };

      Member.create( member )
      .then(() => {
        res.status(200).send("Registration Successful!");
      })
      .catch(err => {
        res.status(500).json({ error: err });
      });
    }
  });
};

exports.getRentedBooks = (req, res) => {
  const username = res.locals.member.username;
  // const username = req.params.username;
  var bookIDs = [];
  console.log(username);
  db.loan.findAll({
    where: { 
      member_username: username,
      returned_date: null
    },
    include: [{
      model: db.book,
      include: [{model: db.author}]  
    }],
  }).then(data => {
    res.status(200).send(data);
  }).catch(error => {
    res.status(500).send(error);
  });
};

exports.getAllLoansByMember = (req, res) => {
  const username = res.locals.member.username;
  db.loan.findAll({
    where: { 
      member_username: username,
    },
    include: [{
      model: db.book,
      include: [{model: db.author}]  
    }],
    order: [['loan_date', 'DESC']]
  }).then(data => {
    res.status(200).send(data);
  }).catch(error => {
    res.status(500).send(error);
  });
};