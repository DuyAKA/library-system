 const jwt = require('jsonwebtoken');
require("dotenv").config();
const secretKey = process.env.TOKEN_SECRET;
const db = require('../models'); // Import Sequelize database instance
exports.authenticateToken = (req, res, next) => {
  const authHeader = req.headers['authorization'];
  const token = authHeader && authHeader.split(' ')[1];
  // const token = authHeader;

  // uses the logical AND (&&) operator to check whether authHeader is truthy.
  // If authHeader is falsy (i.e., undefined, null, 0, false, or an empty string),
  // the expression evaluates to falsy and token is set to undefined.

  //retrieves the second element of the array using the index 1.
  //This assumes that the authHeader string is formatted as "Bearer token"
  if (!token) {
    // return res.status(401).json(token);
    return res.status(401).json(token);
  }

  try {
    const decodedToken = jwt.verify(token, secretKey);
    const { username } = decodedToken;
  
    // Retrieve the member from the database
    db.member.findOne({
      where: { username }
    }).then(member => {
      
      if (!member) {
        return res.status(403).json({loginState: "guest" })
        //return res.status(403).json("User not found");
      }
      
      if (req.baseUrl.startsWith('/api')){
        
        res.locals.member = member;
               
        next();

        return;
      }

      return res.json({loginState : ((member.username === "admin")? "admin" : "user"  )})
      
      
    }).catch(err => {
      console.error(err);
      return res.json({loginState: "guest" });
    });
  } catch (err) {
    
    return res.json({loginState: "guest" });
  }
}
