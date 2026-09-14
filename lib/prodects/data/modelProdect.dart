
import 'package:json_annotation/json_annotation.dart';
part 'modelProdect.g.dart';


@JsonSerializable()
class dataresponse{


List <Recordotem> data;

dataresponse (this.data,);

factory dataresponse.fromJson(Map<String,dynamic>json )=>_$dataresponseFromJson(json);





}


@JsonSerializable()
class Recordotem{
  String id;

  Data data;
  Recordotem(this.id,this.data);
  factory Recordotem.fromJson(Map<String ,dynamic>json)=>_$RecordotemFromJson(json);

}
@JsonSerializable()
class Data{


  String name;
  double price ;
  String category;
  bool in_stock;
Data(this.name,this.price,this.category,this.in_stock);
factory Data.fromJson(Map<String,dynamic>json)=>_$DataFromJson(json);

}