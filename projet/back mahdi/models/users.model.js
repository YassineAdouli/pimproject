const mongoose = require("mongoose");
const Schema = mongoose.Schema;

const User = Schema({
    username:{
        type:String,
        required: true,
        unique:true,
    },
    password:{
        type: String,
        required: true,
    },
    email:{
        type: String,
        required: true,
    },
    role:{
        type: String,
        required: true,
    },
    upgrade:{
        type: String,
        required: true,
    },
    acount:{
        type: String,
        required: true,
    },
});

module.exports = mongoose.model("User",User);