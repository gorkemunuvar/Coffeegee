// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'coffee.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

CoffeeModel _$CoffeeModelFromJson(Map<String, dynamic> json) => CoffeeModel(
      json['name'] as String,
      json['country'] as String,
      json['type'] as String,
      json['roast'] as String,
      (json['flavors'] as List<dynamic>).map((e) => e as String).toList(),
      json['recipe'] as String,
      json['imageAssetUrl'] as String,
    );

Map<String, dynamic> _$CoffeeModelToJson(CoffeeModel instance) =>
    <String, dynamic>{
      'name': instance.name,
      'country': instance.country,
      'type': instance.type,
      'roast': instance.roast,
      'flavors': instance.flavors,
      'recipe': instance.recipe,
      'imageAssetUrl': instance.imageAssetUrl,
    };
