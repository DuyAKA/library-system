const crypto = require('crypto');
  const algorithm = 'aes-256-cbc';
  const secretKey = crypto.createHash('sha256').update('mysecretkey').digest();; // must be 32 bytes long to be used with aes-256-cbc
  //will be truncated if longer ?

function generateEncryptedString(email, expiresInMinutes) {
  const iv = crypto.randomBytes(16);
  const cipher = crypto.createCipheriv(algorithm, secretKey, iv);
  const timestamp = Date.now() + expiresInMinutes * 60 * 1000; // Add expiration timestamp
  let encrypted = cipher.update(email + '|' + timestamp, 'utf8', 'hex');
  encrypted += cipher.final('hex');
  return `${iv.toString('hex')}:${encrypted}`;
}

function decryptEncryptedString(encryptedString) {
  const [iv, encryptedEmail] = encryptedString.split(':');
  const decipher = crypto.createDecipheriv(algorithm, secretKey, Buffer.from(iv, 'hex'));
  let emailWithTimestamp = decipher.update(encryptedEmail, 'hex', 'utf8');
  emailWithTimestamp += decipher.final('utf8');
  const [email, timestamp] = emailWithTimestamp.split('|'); // Split email and timestamp
  if (timestamp < Date.now()) {
    throw new Error('Encrypted string has expired');
  }
  return email;
}

module.exports = app => {

  const db = require("../models/");
  const Member = db.member;
  const express = require('express');
  const nodemailer = require('nodemailer');
  const router = express.Router();
  const bcrypt = require('bcryptjs');



  router.post('/forgot-password', async (req, res) => {
    try {
    
      const transporter = nodemailer.createTransport({
        service: 'gmail',
        auth: {
          user: 'vgupeteam12@gmail.com'          ,
          pass: 'cdnyeuyqrrualpmb'
        }
      });
      const mailOptions = {
        from: 'VGU_PE_12',
        to: req.body.email,
        subject: 'Reset Your EndLib Password',
        text: `Your secret key (expiring in 10 minutes) for resetting your password is ${generateEncryptedString(req.body.email,10)}`
      };
      await transporter.sendMail(mailOptions);
  
      res.json({ email: req.body.email });

  
    } catch (err) {
      console.error(err);
      res.status(500).send('An error occurred while processing your request.');
    }
  });

router.post('/reset-password', async (req, res) => {
    try {
      // Decrypt the encrypted string to get the email address
      const email = decryptEncryptedString(req.body.encryptedString);
      
      //res.send(email);
      try {
          const member = await Member.findOne({ where: { email: email } });
          
          
          if(member) password = req.body.new_password;
  
          bcrypt.hash(password, 10, (err, hash) => {
            if (err) {
              res.status(500).json({ error: err.message });
            }else 
            member.update({
              password : hash
            }).then( ()=>{
              res.json("password changed successfully");
            }
            ).catch(err => {
                res.status(500).json({ error: err.message });
              });
          }
          )
          
        }  catch (err) {
          console.error(err);
          res.status(401).send({ message: "User not found" });
        }
        
        
    } catch (err) {
      if(err.message === "Encrypted string has expired"){
        res.status(402).send("Your Secret Key has expired, get another one");
      }
      else res.status(500).send('An error occurred while processing your request.');
    }
  }
);
  
  app.use('/api/reset', router);
}