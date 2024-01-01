const token_verifier = require("../middleware/token_auth.js");
module.exports = app => {
    const member = require("../controllers/member.controller.js");
  
    var router = require("express").Router();

    router.post("/auth",member.authenticate);

    router.post("/reg", member.register);
  
    // Retrieve all Members
    router.get("/", member.findAll);

    // Getting current loaned book
    router.get("/loan", token_verifier.authenticateToken, member.getRentedBooks);
  
    // Get all loan by Token
    router.get("/loan_history", token_verifier.authenticateToken, member.getAllLoansByMember);

    // Retrieve a single Member with username
    router.get("/member_info", token_verifier.authenticateToken, member.findOne);
  
    // Update a Member with username
    router.put("/member_info", token_verifier.authenticateToken, member.update);
  
    // Delete a Member with username
    router.delete("/member_info", token_verifier.authenticateToken, member.delete);

    app.use('/api/member', router);
  }