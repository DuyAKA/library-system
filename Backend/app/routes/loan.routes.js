const token_verifier = require("../middleware/token_auth.js");

module.exports = app => {
    const loan = require("../controllers/loan.controller.js");
  
    var router = require("express").Router();

    //create a new loan but does not need user id as it's pass through
    router.post("/make_loan", token_verifier.authenticateToken ,loan.create_loan);

    // Expanding the loan
    router.put("/expand/:id",token_verifier.authenticateToken, loan.expand);
      
    // Finishing the loan
    router.put("/finish/:id", token_verifier.authenticateToken ,loan.finish);

    // Retrieve all Loans
    router.get("/", loan.findAll);

    router.get("/loaned", token_verifier.authenticateToken, loan.findAllLoaned);
  
    // Retrieve a single Loan with id
    router.get("/:id", token_verifier.authenticateToken , loan.findOne);
  
    // Update a Loan with id
    router.put("/:id", token_verifier.authenticateToken , loan.update);
  
    // Delete a Loan with id
    router.delete("/:id", token_verifier.authenticateToken ,  loan.delete);

    app.use('/api/loan', router);
  };