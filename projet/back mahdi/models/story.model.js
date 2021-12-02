
const mongoose = require("mongoose");

const Schema = mongoose.Schema;

const Story = Schema(
  { 
    user:String,
    caption: String,
    url: String,
   
  
  }
);

module.exports = mongoose.model("Story", Story);