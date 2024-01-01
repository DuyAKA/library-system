const token_verifier = require("../middleware/token_auth.js");

module.exports = app => {
    const book = require("../controllers/book.controller.js");
  
    var router = require("express").Router();
  
    // Create a new Book
    router.post("/", token_verifier.authenticateToken, book.create);
  
    // Retrieve all Books
    router.get("/", book.findAll);
  
    // Retrieve a single Book with id
    router.get("/:id", token_verifier.authenticateToken, book.findOne);
  
    // Update a Book with id
    router.put("/:id", token_verifier.authenticateToken, book.update);
  
    // Delete a Book with id
    router.delete("/:id", token_verifier.authenticateToken, book.delete);

    app.use('/api/book', router);
  };