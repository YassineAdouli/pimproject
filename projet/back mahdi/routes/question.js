const express = require("express");
const router = express.Router();
const Question = require("../models/question.model");
const middleware = require("../middleware");

router.route("/ajoutQuestion").post((req,res) =>{
    console.log("inside question");
    const question =  Question({
        quest: req.body.quest,
        repon: req.body.repon,
        numquestion: req.body.numquestion,

        
        
    });
    question
    .save()
    .then(()=>{
        console.log("Question registered");
        res.status(200).json("Question Ajouter");
    })
    .catch((err)=>{
        res.status(403).json({msg : err});
    });
    
});


router.route("/findQuestion").get((req,res)=>{
    Question.find().then((data) => {
    res.json(data);
                
            });
             
        }
    );
    
module.exports = router;
