module.exports = app => {
    const search = require("../controllers/search.controller.js");
  
    var router = require("express").Router();

    // Search Books base on book title
    router.get("/byBookTitle",search.searchByBookTitle);

    // Search Books base on author name
    router.get("/byAuthorName",search.searchByAuthorName);

    app.use('/api/search', router);
  };