const express = require("express");
const { createIndexes } = require("../models/users.model");
const Story = require("../models/story.model");
const config = require("../config");
const jwt = require("jsonwebtoken");
const middleware = require("../middleware");
const router = express.Router();


    


router.route("/ajoutStory").post((req,res) =>{
    console.log("inside Story");
    const story =  Story({
        user: req.body.user,
        caption: req.body.caption,
        url: req.body.url,
    });
    story
    .save()
    .then(()=>{
        console.log("Story registered");
        res.status(200).json("Ok");
    })
    .catch((err)=>{
        res.status(403).json({msg : err});
    });
    
});


router.route("/findStory").get((req,res)=>{
    Story.find().then((data) => {
    res.json(data);
                
            });
             
        }





    );



module.exports = router;