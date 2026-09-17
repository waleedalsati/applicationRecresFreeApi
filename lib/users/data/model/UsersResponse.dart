import 'package:json_annotation/json_annotation.dart';

import 'UsersResponse.dart';



part 'UsersResponse.g.dart';
@JsonSerializable()
class responseUsers{

List<Informationuser>data;

Supporrt support;


responseUsers(this.data ,this.support);
factory responseUsers.fromJson(Map<String,dynamic>json )=>_$responseUsersFromJson(json);








}

@JsonSerializable()

class Informationuser{

int id ;
 String email;
 String first_name;
 String last_name;
 String avatar;
 Informationuser(this.id,this.email, this.first_name ,this.last_name,this.avatar);
   factory Informationuser.fromJson(Map<String,dynamic>json )=>_$InformationuserFromJson(json);

}
@JsonSerializable()

class Supporrt{
String  url;
String text ;
Supporrt(this.text,this.url);
factory Supporrt.fromJson(Map<String,dynamic>json )=>_$SupporrtFromJson(json);





}