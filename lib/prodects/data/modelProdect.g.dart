// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'modelProdect.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

dataresponse _$dataresponseFromJson(Map<String, dynamic> json) => dataresponse(
  (json['data'] as List<dynamic>)
      .map((e) => Recordotem.fromJson(e as Map<String, dynamic>))
      .toList(),
);

Map<String, dynamic> _$dataresponseToJson(dataresponse instance) =>
    <String, dynamic>{'data': instance.data};

Recordotem _$RecordotemFromJson(Map<String, dynamic> json) => Recordotem(
  json['id'] as String,
  Data.fromJson(json['data'] as Map<String, dynamic>),
);

Map<String, dynamic> _$RecordotemToJson(Recordotem instance) =>
    <String, dynamic>{'id': instance.id, 'data': instance.data};

Data _$DataFromJson(Map<String, dynamic> json) => Data(
  json['name'] as String,
  (json['price'] as num).toDouble(),
  json['category'] as String,
  json['in_stock'] as bool,
);

Map<String, dynamic> _$DataToJson(Data instance) => <String, dynamic>{
  'name': instance.name,
  'price': instance.price,
  'category': instance.category,
  'in_stock': instance.in_stock,
};
