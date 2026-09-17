// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'UsersResponse.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

responseUsers _$responseUsersFromJson(Map<String, dynamic> json) =>
    responseUsers(
      (json['data'] as List<dynamic>)
          .map((e) => Informationuser.fromJson(e as Map<String, dynamic>))
          .toList(),
      Supporrt.fromJson(json['support'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$responseUsersToJson(responseUsers instance) =>
    <String, dynamic>{'data': instance.data, 'support': instance.support};

Informationuser _$InformationuserFromJson(Map<String, dynamic> json) =>
    Informationuser(
      (json['id'] as num).toInt(),
      json['email'] as String,
      json['first_name'] as String,
      json['last_name'] as String,
      json['avatar'] as String,
    );

Map<String, dynamic> _$InformationuserToJson(Informationuser instance) =>
    <String, dynamic>{
      'id': instance.id,
      'email': instance.email,
      'first_name': instance.first_name,
      'last_name': instance.last_name,
      'avatar': instance.avatar,
    };

Supporrt _$SupporrtFromJson(Map<String, dynamic> json) =>
    Supporrt(json['text'] as String, json['url'] as String);

Map<String, dynamic> _$SupporrtToJson(Supporrt instance) => <String, dynamic>{
  'url': instance.url,
  'text': instance.text,
};
