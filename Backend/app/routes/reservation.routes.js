module.exports = app => {
    const reservation = require("../controllers/reservation.controller.js");
  
    var router = require("express").Router();
  
    // Create a new Reservation
    router.post("/", reservation.create);
  
    // Retrieve all Reservations
    router.get("/", reservation.findAll);
  
    // Retrieve a single Reservation with id
    router.get("/:id", reservation.findOne);
  
    // Update a Reservation with id
    router.put("/:id", reservation.update);
  
    // Delete a Reservation with id
    router.delete("/:id", reservation.delete);
    
    app.use('/api/reservation', router);
  };