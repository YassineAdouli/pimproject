const express = require("express");
const { createIndexes } = require("../models/users.model");
const Answer = require("../models/answer.model");
const config = require("../config");
const jwt = require("jsonwebtoken");
const middleware = require("../middleware");
const router = express.Router();


    


router.route("/ajoutAnswer").post((req,res) =>{
    console.log("inside Answer");
    const answer = Answer({
        score: req.body.score,
        nom: req.body.nom,
        email: req.body.email,
        nomOffer: req.body.nomOffer,
        
    });
    answer
    .save()
    .then(()=>{
        console.log("answer registered");
        res.status(200).json("Ok");
    })
    .catch((err)=>{
        res.status(403).json({msg : err});
    });
    
});


router.route("/findAnswer").get((req,res)=>{
    Answer.find().then((data) => {
    res.json(data);
                
            });
             
        }





    );




module.exports = router;