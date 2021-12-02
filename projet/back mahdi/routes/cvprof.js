const express = require("express");
const router = express.Router();
const Cvprof = require("../models/cvprof.model");
const middleware = require("../middleware");

router.route("/ajoutCvprof").post((req,res) =>{
    console.log("inside Cvprof");
    const cvprof =  Cvprof({
        username: req.body.username,
        lastname: req.body.lastname,
        email: req.body.email,
        mobile: req.body.mobile,
        adress: req.body.adress,
        date: req.body.date,
        name: req.body.name,
        aptitudes1: req.body.aptitudes1,
        aptitudes2: req.body.aptitudes2,
        aptitudes3: req.body.aptitudes3,
        aptitudes4: req.body.aptitudes4,
        diplomemin: req.body.diplomemin,
        experiencemin: req.body.experiencemin,
        connaissancestheo1:req.body.connaissancestheo1,
        connaissancestheo2:req.body.connaissancestheo2,
        connaissancestheo3:req.body.connaissancestheo3,
        connaissancestheo4:req.body.connaissancestheo4,
        activitedebase1:req.body.activitedebase1,
        activitedebase2:req.body.activitedebase2,
        activitedebase3:req.body.activitedebase3,
        activitedebase4:req.body.activitedebase4,
    });
    cvprof
    .save()
    .then(()=>{
        console.log("cvprof registered");
        res.status(200).json("cvprof Ajouter");
    })
    .catch((err)=>{
        res.status(403).json({msg : err});
    });
});
router.route("/findCvprof").get((req,res)=>{
    Cvprof.find().then((data) => {
    res.json(data);
                
            }); 
        }
    );
     

    router.route("/getDataCvprof").get((req, res) => {
        Cvprof.findOne({ name: "Administrateur de base de données" }, (err, result) => {
          if (err) return res.json({ err: err });
          if (result == null) return res.json({ data: [] });
          else return res.json(result );
        });
      });

    module.exports = router;
