

import 'dart:convert';

import 'package:gestionuser/Pages/BaccourPage/story/data/stories.dart';
import 'package:gestionuser/Pages/BaccourPage/story/model/Story.dart';
import 'package:gestionuser/Pages/BaccourPage/story/model/user.dart';
import 'package:http/http.dart' as http;
final users = [
  User(
    name: 'yassineaa',
    imgUrl: 'assets/images/Login.jpg',
    stories: stories,
  ),

];

List<Story>storiesk=[];
List<User> usersk=[];
List<dynamic> caches;
final usersm=yourFunction();
var fList;
Future<List<User>> getStory()async {
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
    q.mediaType= MediaType.image;
    storiesk.add(new Story(mediaType: MediaType.image,caption: q.caption, url: q.url));
    print(storiesk.length);
    usersk.add(new User(name: q.user, imgUrl: 'assets/images/Login.jpg', stories: storyList));
    storiesk.clear();
    // QuizList.add(quiz);
  }
  return usersk;

}
 List<User> yourFunction() {
  getStory().then((value) {
      usersk=value;
      print(usersk.length);
    });
  return usersk;
  // storyList=await getStory();
}