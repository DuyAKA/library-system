require("dotenv").config();

module.exports = {
    HOST: process.env.PG_HOST_DEP, //Using Docker: PG_HOST_DOCKER ; Using localhost: PG_HOST_DEV
    USER: process.env.PG_USER,
    PASSWORD: process.env.PG_PASSWORD_DEP,
    DB: process.env.PG_DB,
    dialect: process.env.PG_DIALECT,
    port: process.env.PG_PORT,
    pool: {
      max: 5,
      min: 0,
      acquire: 30000,
      idle: 10000
    }
  };

