const express = require("express");
const { createIndexes } = require("../models/users.model");
const Rdv = require("../models/rdv.model");
const config = require("../config");
const jwt = require("jsonwebtoken");
const middleware = require("../middleware");
const router = express.Router();


    


router.route("/ajoutRdv").post((req,res) =>{
    console.log("inside rdv");
    const rdv =  Rdv({
        id: req.body.id,
        idR: req.body.idR,
        idC: req.body.idC,
        date: req.body.date,
        time: req.body.time,
        emailC: req.body.emailC,
        code:req.body.code,
        nomC:req.body.nomC,
        status:req.body.status,
    });
    rdv
    .save()
    .then(()=>{
        console.log("meet registered");
        res.status(200).json("Ok");
    })
    .catch((err)=>{
        res.status(403).json({msg : err});
    });
    
});


router.route("/findRdv").get((req,res)=>{
    Rdv.find().then((data) => {
    res.json(data);
                
            });
             
        }





    );

router.route("/updaterdv/:_id").patch((req,res)=>{
    //User.findOneAndUpdate(
    Rdv.updateMany(
        {_id:req.params._id},
        {$set: {status: req.body.status}},
        (err, result)=>{
            if(err) return res.status(500).json({msg: err});
            const msg ={
                msg: "Status successfuly updated",
                _id: req.params._id,
    
            };
            return res.json(msg);
        }
        
    );
    });


module.exports = router;
