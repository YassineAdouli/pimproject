const mongoose = require("mongoose");
const Schema = mongoose.Schema;
const question = Schema({
    numquestion:{
        type:String,
    },
    quest:{
        type:String,
    },
    repon:{
        type: String,
    },
});

module.exports = mongoose.model("Question",question);
