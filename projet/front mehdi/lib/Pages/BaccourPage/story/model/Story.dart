import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
part 'story.g.dart';
enum MediaType { image, text }

class Story {
   MediaType mediaType;
   String url;
   double duration;
   String caption;
   String date;
   Color color;
   String user;
   Image image;

  Story({
    this.mediaType,
    @required this.caption,
    @required this.user,
    this.date,
    this.url,
    this.image,
    this.duration = 5.0,
    this.color = Colors.grey,
  });
  factory Story.fromJson(Map<String, dynamic> json) =>
      _$StoryFromJson(json);
  Map<String, dynamic> toJson() => _$StoryToJson(this);
}
