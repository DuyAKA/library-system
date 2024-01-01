const token_verifier = require("../middleware/token_auth.js");
module.exports = app => {
    const author = require("../controllers/author.controller.js");
  
    var router = require("express").Router();
  
    // Create a new Author
    router.post("/", token_verifier.authenticateToken, author.create);
  
    // Retrieve all Authors
    router.get("/", author.findAll);
  
    // Retrieve a single Author with id
    router.get("/:id", token_verifier.authenticateToken, author.findOne);
  
    // Update a Author with id
    router.put("/:id", token_verifier.authenticateToken, author.update);
  
    // Delete a Author with id
    router.delete("/:id", token_verifier.authenticateToken, author.delete);
  
    app.use('/api/author', router);
  };