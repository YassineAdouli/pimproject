const mongoose = require("mongoose");
const Schema = mongoose.Schema;

const Rdv = Schema({
    id:{
        type:String,
        required: true,      
    },
    idR:{
        type: String,
        
    },
    idC:{
        type: String,
        
    },
    date:{
        type: String,
        
    },
    
    time:{
        type: String,
        
    },
    emailC:{
        type: String,
        
    },

    code:{
        type: String,
        
    },

    nomC:{
        type: String,
        
    },

    status:{
        type: String,
    },

});

module.exports = mongoose.model("Rdv",Rdv);
