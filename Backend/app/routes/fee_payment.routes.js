const token_verifier = require("../middleware/token_auth.js");
module.exports = app => {
    const fee_payment = require("../controllers/fee_payment.controller.js");
  
    var router = require("express").Router();
  
    // Create a new Author
    router.post("/", fee_payment.create);
  
    // Retrieve all Authors
    router.get("/", fee_payment.findAll);
  
    // Retrieve a single Author with id
    router.get("/:id", fee_payment.findOne);
  
    // Update a Author with id
    router.put("/:id", fee_payment.update);
  
    // Delete a Author with id
    router.delete("/:id", fee_payment.delete);
  
    app.use('/api/fee_payment', router);
  };