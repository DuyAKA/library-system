const token_verifier = require("../middleware/token_auth.js");
module.exports = app => {
    const book_author = require("../controllers/book_author.controller");
  
    var router = require("express").Router();
  
    // Create a new BookAuthor
    router.post("/", token_verifier.authenticateToken, book_author.create);
  
    // Retrieve all BookAuthors
    router.get("/", book_author.findAll);
  
    // Retrieve a single BookAuthor with id
    router.get("/:book_id/:author_id", token_verifier.authenticateToken, book_author.findOne);
  
    // Update a BookAuthor with id
    router.put("/:book_id/:author_id", token_verifier.authenticateToken, book_author.update);
  
    // Delete a BookAuthor with id
    router.delete("/:book_id/:author_id", token_verifier.authenticateToken, book_author.delete);
  
    app.use('/api/book_author', router);
  };