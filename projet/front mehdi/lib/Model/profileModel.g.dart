// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'profileModel.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ProfileModel _$ProfileModelFromJson(Map<String, dynamic> json) {
  return ProfileModel(
    date: json['date'] as String,
    about: json['about'] as String,
    name: json['name'] as String,
    profession: json['profession'] as String,
    titleline: json['titleline'] as String,
    username: json['username'] as String,
  );
}

Map<String, dynamic> _$ProfileModelToJson(ProfileModel instance) =>
    <String, dynamic>{
      'name': instance.name,
      'username': instance.username,
      'profession': instance.profession,
      'date': instance.date,
      'titleline': instance.titleline,
      'about': instance.about,
    };