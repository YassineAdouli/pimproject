const mongoose = require("mongoose");

const Schema = mongoose.Schema;

const Quest = Schema(
  {
    type:String,
    question: String,
    answer1: String,
    answer2: String,
    answer3: String,
    answer4: String,
    reponse1: String,
    reponse2: String,
    reponse3: String,
    reponse4: String,
  }
);

module.exports = mongoose.model("Quest", Quest);