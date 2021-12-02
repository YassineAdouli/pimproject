import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:gestionuser/Pages/BaccourPage/story/model/Story.dart';
import 'package:gestionuser/Pages/BaccourPage/utility/shared_prefs.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:http/http.dart' as http;
final stories = [
  Story(
    mediaType: MediaType.image,
    url: "https://resize2.prod.docfr.doc-media.fr/rcrop/380,288,center-middle/img/var/doctissimo/storage/images/fr/www/psychologie/tests-de-personnalite/tests-de-caractere/etes-vous-une-personne-positive/4473269-3-fre-FR/Etes-vous-une-personne-positive.jpg",
    caption: 'Check this out',

  ),

];


List<Story>storiesk=[];
//List<User> usersk=[];
List<dynamic> caches;
final storyList=yourFunction();
var fList;
Future<List<Story>> getStory()async {
  final urlList = ["http://192.168.1.144:5000/story/findStory"];
  print("dfdfg");
  final responses = await Future.wait(
    urlList.map((String url) {
      return http.get(url);
    }),
  );

  caches = responses.map((response) {
    return (json.decode(response.body) as List)
        .map((data) => Story.fromJson(data))
        .toList();
  }).toList();
  //print(caches[0]);
  fList = List<Story>.from(caches[0]);
  //for(Offer titre in fList )
  //offerTitre.add("titre.titre");
  Story story=new Story();
  for(Story q in fList){


    story.caption=q.caption;
    story.url=q.url;
    story.mediaType= MediaType.image;
    storiesk.add(story);
  }
  return storiesk;

}
List<Story> yourFunction() {
  getStory().then((value) {
    storiesk=value;
    print(storiesk.length);
  });
  return storiesk;
  // storyList=await getStory();
}
