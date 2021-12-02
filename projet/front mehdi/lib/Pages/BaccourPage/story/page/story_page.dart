import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:gestionuser/Pages/BaccourPage/story/data/stories.dart';
import 'package:gestionuser/Pages/BaccourPage/story/data/users.dart';
import 'package:gestionuser/Pages/BaccourPage/story/model/Story.dart';
import 'package:gestionuser/Pages/BaccourPage/story/model/user.dart';
import 'package:gestionuser/Pages/BaccourPage/story/page/story_list_page.dart';
import 'package:gestionuser/Pages/BaccourPage/story/widget/story_widget.dart';
import 'package:gestionuser/Pages/BaccourPage/story/model/user.dart';
import 'package:http/http.dart' as http;
import 'package:path_provider/path_provider.dart';

class StoryPage extends StatefulWidget {
  final User user;

  const StoryPage({
    @required this.user,
    Key key,
  }) : super(key: key);

  @override
  _StoryPageState createState() => _StoryPageState();
}

class _StoryPageState extends State<StoryPage> {
  PageController controller;

  @override
  void initState() {
    super.initState();
    //yourFunction();
    //usersk.add(new User(name: "q.user", imgUrl: 'assets/images/Login.jpg', stories: stories));
    final initialPage = usersm.indexOf(widget.user);
    controller = PageController(initialPage: initialPage);
  }

  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }
  /*List<Story>storyList=[];
  List<Story>storiesk=[];
   List<User> usersk=[];
  List<dynamic> caches;
  var fList;*/
  @override
  Widget build(BuildContext context) => PageView(
        controller: controller,
        children: usersm
            .map((user) => StoryWidget(
                  user: user,
                  controller: controller,
                ))
            .toList(),
      );
  /*Future<List<User>> getStory()async {
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
      storiesk.add(q);
      print(q.url);
      usersk.add(new User(name: q.user, imgUrl: 'assets/images/Login.jpg', stories: storiesk));
      storiesk.clear();
      // QuizList.add(quiz);
    }
    return usersk;

  }
  void yourFunction() {
    getStory().then((value) {
      setState(() {
        usersk=value;
        print(usersk.length);

      });
    });
    // storyList=await getStory();



  }*/
}
