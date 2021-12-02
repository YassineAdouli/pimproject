const express = require("express");
const router = express.Router();
const Employe = require("../models/employe.model");
const middleware = require("../middleware");

router.route("/ajoutEmploye").post((req,res) =>{
    console.log("inside employe");
    const employe =  Employe({
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
    employe
    .save()
    .then(()=>{
        console.log("Employe registered");
        res.status(200).json("Employee Ajouter");
    })
    .catch((err)=>{
        res.status(403).json({msg : err});
    });
});
router.route("/findEmploye").get((req,res)=>{
    Employe.find().then((data) => {
    res.json(data);
                
            }); 
        }
    );
     

    router.route("/getDataemploye").get((req, res) => {
        Employe.findOne({ name: "Administrateur de base de données" }, (err, result) => {
          if (err) return res.json({ err: err });
          if (result == null) return res.json({ data: [] });
          else return res.json(result );
        });
      });
    router.route("/ajoutemp").post((req,res)=>{
        if (req.body._id == '')
            insertRecord(req, res);
            else
            updateRecord(req, res);
    });
    function insertRecord(req, res) {
        var employe = new Employe();
        employe.name = req.body.name;
        employe.aptitudes1 = req.body.aptitudes1;
        employe.aptitudes2 = req.body.aptitudes2;
        employe.aptitudes3 = req.body.aptitudes3;
        employe.aptitudes4 = req.body.aptitudes4;
        employe.diplomemin = req.body.diplomemin;
        employe.experiencemin = req.body.experiencemin;
        employe.connaissancestheo1 = req.body.connaissancestheo1;
        employe.connaissancestheo2 = req.body.connaissancestheo2;
        employe.connaissancestheo3 = req.body.connaissancestheo3;
        employe.connaissancestheo4 = req.body.connaissancestheo4;
        employe.activitedebase1 = req.body.activitedebase1;
        employe.activitedebase2 = req.body.activitedebase2;
        employe.activitedebase3 = req.body.activitedebase3;
        employe.activitedebase4 = req.body.activitedebase4;
    
    
        
        employe.save((err, doc) => {
            if (!err)
                res.redirect('findEmploye');
            else {
                if (err.name == 'ValidationError') {
                    handleValidationError(err, req.body);
                    res.render("employe/addOrEdit", {
                        viewTitle: "Insert Employe",
                        employee: req.body
                    });
                }
                else
                    console.log('Error during record insertion : ' + err);
            }
        });
    }
   


    function updateRecord(req, res) {
        Employee.findOneAndUpdate({ _id: req.body._id }, req.body, { new: true }, (err, doc) => {
            if (!err) { res.redirect('employe/list'); }
            else {
                if (err.name == 'ValidationError') {
                    handleValidationError(err, req.body);
                    res.render("employe/addOrEdit", {
                        viewTitle: 'Update Employe',
                        employe: req.body
                    });
                }
                else
                    console.log('Error during record update : ' + err);
            }
        });
    }
    module.exports = router;
