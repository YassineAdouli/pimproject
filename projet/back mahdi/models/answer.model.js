
const mongoose = require("mongoose");

const Schema = mongoose.Schema;

const Answer = Schema(
  { 
    score:String,
    nom: String,
    email: String,
    nomOffer: String,
  
  }
);

module.exports = mongoose.model("Answer", Answer);

