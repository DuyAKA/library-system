const db = require("../models");
const Fine = db.fine;
const Op = db.Sequelize.Op;
const {sequelize, Sequelize}= require("../config/sequelize");
const fs = require('fs')

exports.getFindById = (req, res) => {
  const memberId = req.params.id; 
  Fine.findAll({
    attributes: [
      [sequelize.fn('SUM', sequelize.col('fine_amount')), 'total_fine_amount']
    ],
    include: [{
      model: db.loan,
      where: { member_id: memberId },
      attributes: []
    }],
    group: ['loan.member_id']
  })
  .then((data) => {
    if (data) {
      res.send(data);
    } else {
      res.status(404).send({
        message: `Cannot find Find with Member.id=${memberId}.`,
      });
    }
  })
  .catch((err) => {
    console.log(err);
    res.status(500).send({
      message: "Error retrieving Fine with member_id=" + memberId,
    });
  });

};
  
exports.findAllBAA = (req, res) => {
  db.book.findAll({ 
      include: [{
        model: db.author,
        through: {
          model: db.book_author,
        }
      }]
    })
    .then(data => {
      res.send(data);
    })
    .catch(err => {
      res.status(500).send({
        message:
          err.message || "Some error occurred while retrieving books."
      });
    });
};


exports.JSONreader = (req, res) => {
  const filePath = 'C:\\Users\\Admin\\University\\GitLab\\vgupe2023_team12\\Backend\\app\\controllers\\bus-data-sample.json';
  fs.readFile(filePath, 'utf8', (err, data) => {
    if (err) {
      res.status(400).send(err)
      return;
    }  
  })
}