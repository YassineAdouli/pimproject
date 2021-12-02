import 'dart:async';
import 'dart:convert';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:gestionuser/ModelAnnonce1/Offer.dart';
import 'package:gestionuser/Pages/BaccourPage/MyText.dart';
import 'package:gestionuser/Pages/BaccourPage/afficheQuiz.dart';
import 'package:http/http.dart' as http;

import '../../NetworkHandler.dart';

void main() => runApp(AfficheOffer());

class AfficheOffer extends StatefulWidget {
  @override
  _MyAfficheOffer createState() => _MyAfficheOffer(offer);
  var offer;
  NetworkHandler networkHandler = NetworkHandler();
  AfficheOffer({Key key, @required this.offer}) : super(key: key);
}

class _MyAfficheOffer extends State<AfficheOffer> {
  var offer;
  _MyAfficheOffer(String o) {
    this.offer = o;
  }
  @override
  void dispose() {
    super.dispose();
  }

  @override
  void initState() {
    super.initState();
    dataoffers();
  }

  //var
  NetworkHandler networkHandler = NetworkHandler();
  Offer offreModel = Offer();
  void dataoffers() async {
    var response = await networkHandler.get("/offer/id/" + offer);
    offreModel = Offer.fromJson(response["data"]);

    setState(() {
      offreModel = Offer.fromJson(response["data"]);
    });
  }

  final _scaffoldkey = GlobalKey<ScaffoldState>();
  int _counter = 120;
  TextEditingController TitreC = TextEditingController();
  TextEditingController MyController = TextEditingController();
  TextEditingController expC = TextEditingController();
  TextEditingController descC = TextEditingController();
  TextEditingController entrC = TextEditingController();
  TextEditingController sexeC = TextEditingController();
  TextEditingController contrC = TextEditingController();
  TextEditingController postC = TextEditingController();
  TextEditingController adrC = TextEditingController();
  TextEditingController salC = TextEditingController();

  @override
  Widget build(BuildContext context) {
    //Size size = MediaQuery.of(context).size;
    print(offreModel.titre);
    TitreC.text = offreModel.titre;
    MyController.text = offreModel.skill;
    expC.text = offreModel.experience;
    descC.text = offreModel.post;
    entrC.text = offreModel.descentr;
    sexeC.text = offreModel.sexe;
    contrC.text = offreModel.typecont;
    postC.text = offreModel.post;
    adrC.text = offreModel.adresse;
    salC.text = offreModel.salaire;

    return Scaffold(
      appBar: AppBar(
        title: Text(offreModel.titre),
      ),
      body: ListView(children: [
        /* Text('Titre'
                ),
                MyText(
                  hintText: 'Titre',
                  enable: false,
                  Controller: TitreC,
                ),*/
        Text('Skills'),
        MyText(
          enable: false,
          Controller: MyController,
        ),
        Text('Experience'),
        MyText(
          hintText: 'Experience',
          enable: false,
          Controller: expC,
        ),
        Text('Descrepsion'),
        MyText(
          hintText: 'Descrepsion',
          linesize: 5,
          enable: false,
          Controller: descC,
        ),
        Text('Entreprise'),
        MyText(
          hintText: 'Entreprise',
          enable: false,
          Controller: entrC,
        ),
        Text('Sexe'),
        MyText(
          hintText: 'Sexe',
          enable: false,
          Controller: sexeC,
        ),
        Text('Type contrat'),
        MyText(hintText: 'Type contrat', enable: false, Controller: contrC),
        Text('Post'),
        MyText(
          hintText: 'Post',
          enable: false,
          Controller: postC,
        ),
        Text('Adresse'),
        MyText(
          hintText: 'Adresse',
          enable: false,
          Controller: adrC,
        ),
        Text('Salaire'),
        MyText(
          hintText: 'Salaire',
          enable: false,
          Controller: salC,
        ),
        Container(
            margin: EdgeInsets.symmetric(horizontal: 20),
            child: RaisedButton(
                child: Text("Submit Quiz"),
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) =>
                            AfficheQuiz(nom: offreModel.titre)),
                  );
                })),
        SizedBox(
          height: 70,
        )
      ]),
    );
  }
}
