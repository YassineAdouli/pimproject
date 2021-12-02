const express = require("express");
const { createIndexes } = require("../models/Quest.model");
const Qcm = require("../models/Quest.model");

const config = require("../config");
const jwt = require("jsonwebtoken");
const middleware = require("../middleware");
const router = express.Router();


router.route("/findquestion").get((req,res)=>{
    Qcm.find().then((data) => {
    res.json(data);
                
            });
             
        }
    );

router.route("/ajoutquestion").post((req,res) =>{
    console.log("inside the register");
    const qcm = new Qcm({
        type: req.body.type,
        question: req.body.question,
        answer1: req.body.answer1,
        answer2: req.body.answer2,
        answer3: req.body.answer3,
        answer4: req.body.answer4,
        reponse1: req.body.reponse1,
        reponse2: req.body.reponse2,
        reponse3: req.body.reponse3,
        reponse4: req.body.reponse4,

    });
    qcm
    .save()
    .then(()=>{
        console.log("question registered");
        res.status(200).json("Ok");
    })
    .catch((err)=>{
        res.status(403).json({msg : err});
    });
    
});

    





module.exports = router;