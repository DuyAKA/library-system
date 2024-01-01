const express = require("express");
const bodyParser = require("body-parser");
const cors = require("cors");
require("dotenv").config();
const swaggerUI = require('swagger-ui-express');
const fs = require('fs');
const YAML = require('js-yaml');
const helmet = require('helmet');
const app = express();

const db = require("./app/models");

db.sequelize.sync()
  .then(() => {
    console.log("Synced db.");
  })
  .catch((err) => {
    console.log("Failed to sync db: " + err.message);
  });

// db.sequelize.sync({ force: true })
//     .then(() => {
//         console.log("Drop and re-sync db.");
//     });

var corsOptions = {
  origin: "https://endlib-frontend.fly.dev"
};

app.use(cors(corsOptions));

// parse requests of content-type - application/json
app.use(express.json());

// parse requests of content-type - application/x-www-form-urlencoded
app.use(express.urlencoded({ extended: true }));

// simple route
app.get("/", (req, res) => {
  res.json({ message: "Testing backend" });
});

const swaggerJsDoc = YAML.load(fs.readFileSync('./Document/api.yaml', 'utf8'));
app.use('/api-docs', swaggerUI.serve, swaggerUI.setup(swaggerJsDoc));

app.use(
  helmet.contentSecurityPolicy({
    directives: {
      defaultSrc: ["'self'"],
      connectSrc: ["'self'", "https://endlib-backend.fly.dev"],
    },
  })
);

verifier = require("./app/middleware/token_auth.js");

app.get("/verify", verifier.authenticateToken);

require("./app/routes/author.routes")(app);
require("./app/routes/book.routes")(app);
require("./app/routes/book_author.routes")(app);
require("./app/routes/fee_payment.routes")(app);
require("./app/routes/loan.routes")(app);
require("./app/routes/member.routes")(app);
require("./app/routes/reservation.routes")(app);
require("./app/routes/search.routes")(app);
require("./app/routes/test.routes")(app);
require("./app/routes/reset_credential.routes")(app);

// set port, listen for requests
const PORT = process.env.PORT_BACKEND;
app.listen(PORT, () => {
  console.log(`Server is running on port ${PORT}.`);
});
