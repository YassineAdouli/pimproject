import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:gestionuser/Pages/BaccourPage/story/data/users.dart';
import 'package:gestionuser/Pages/BaccourPage/story/model/user.dart' as u;
import 'package:gestionuser/Pages/BaccourPage/story/model/Story.dart';
import 'package:gestionuser/Pages/BaccourPage/story/page/story_page.dart';
import 'package:http/http.dart' as http;



import '../main.dart';
class AfficheStory extends StatefulWidget {
  @override
  StoryListPage createState() => StoryListPage();

}
class StoryListPage extends State{
  @override
  void initState() {
    yourFunction();
    super.initState();
  }
  List<Story>storyList=[];
  List<Story>storiess=[];
  static List<u.User>userss=[];
  List<dynamic> caches;
  var fList;
  @override
  Widget build(BuildContext context) => Scaffold(
        appBar: AppBar(
          title: Text('Stories'),
        ),
        body: Padding(
          padding: const EdgeInsets.all(8.0),
          child: ListView(
            children: usersm
                .map((user) => ListTile(
                      title: Text(
                        user.name,
                        style: TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      leading: CircleAvatar(
                          backgroundImage: AssetImage(user.imgUrl)),
                      onTap: () {
                        Navigator.of(context).push(
                          MaterialPageRoute(
                            builder: (context) => StoryPage(user: user),
                          ),
                        );
                      },
                    ))
                .toList(),
          ),
        ),
      );
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
    print(caches[0]);
    fList = List<Story>.from(caches[0]);
    //for(Offer titre in fList )
    //offerTitre.add("titre.titre");
    Story story=new Story();
    for(Story q in fList){

      story.user=q.user;
      story.caption=q.caption;
      story.url=q.url;
      storiess.add(q);
      userss.add(new u.User(name: q.user, imgUrl: 'assets/images/Login.jpg', stories: storiess));
      storiess.clear();
      // QuizList.add(quiz);
    }
    return fList;

  }
  void yourFunction() async{
    getStory().then((value) {
      setState(() {
        storyList=value;
        print(userss.length);
      });
    });
   // storyList=await getStory();

    print('dfdf');

  }
}
