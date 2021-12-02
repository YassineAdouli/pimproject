const mongoose = require("mongoose");
const Schema = mongoose.Schema;

const Employe = Schema({
    name:{
        type:String,
    },
    aptitudes1:{
        type: String,
    },
    aptitudes2:{
        type: String,
    },
    aptitudes3:{
        type: String,
    },
    aptitudes4:{
        type: String,
    },
    diplomemin:{
        type: String,
    },
    experiencemin:{
        type:String,
    },
    connaissancestheo1:{
        type:String,
    },
    connaissancestheo2:{
        type:String,
    },
    connaissancestheo3:{
        type:String,
    },
    connaissancestheo4:{
        type:String,
    },
    activitedebase1:{
        type:String,
    },
    activitedebase2:{
        type:String,
    },
    activitedebase3:{
        type:String,
    },
    activitedebase4:{
        type:String,
    },
});

module.exports = mongoose.model("Employe",Employe);
