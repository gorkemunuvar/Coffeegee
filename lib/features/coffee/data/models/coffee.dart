import 'package:freezed_annotation/freezed_annotation.dart';

import '../../domain/entities/coffee.dart';

part 'coffee.g.dart';

@JsonSerializable()
class CoffeeModel {
  const CoffeeModel(
    this.name,
    this.country,
    this.type,
    this.roast,
    this.flavors,
    this.recipe,
    this.imageAssetUrl,
  );

  factory CoffeeModel.fromJson(Map<String, dynamic> json) => _$CoffeeModelFromJson(json);

  factory CoffeeModel.fromEntity(Coffee coffee) => CoffeeModel(
        coffee.name,
        coffee.country,
        coffee.type,
        coffee.roast,
        coffee.flavors,
        coffee.recipe,
        coffee.imageAssetUrl,
      );

  final String name;
  final String country;
  final String type;
  final String roast;
  final List<String> flavors;
  final String recipe;
  final String imageAssetUrl;
}
