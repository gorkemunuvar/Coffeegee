import '../../data/models/coffee.dart';

class Coffee {
  Coffee({
    required this.id,
    required this.name,
    required this.country,
    required this.type,
    required this.roast,
    required this.flavors,
    required this.recipe,
    required this.imageAssetUrl,
    this.isFavorite = false,
  });

  factory Coffee.fromModel(CoffeeModel model) => Coffee(
        id: model.id,
        name: model.name,
        country: model.country,
        type: model.type,
        roast: model.roast,
        flavors: model.flavors,
        recipe: model.recipe,
        imageAssetUrl: model.imageAssetUrl,
      );

  final int id;
  final String name;
  final String country;
  final String type;
  final String roast;
  final List<String> flavors;
  final String recipe;
  final String imageAssetUrl;
  bool isFavorite;

  Coffee copyWith({
    int? id,
    String? name,
    String? country,
    String? type,
    String? roast,
    List<String>? flavors,
    String? recipe,
    String? imageAssetUrl,
    bool? isFavorite,
  }) =>
      Coffee(
        id: id ?? this.id,
        name: name ?? this.name,
        country: country ?? this.country,
        type: type ?? this.type,
        roast: roast ?? this.roast,
        flavors: flavors ?? this.flavors,
        recipe: recipe ?? this.recipe,
        imageAssetUrl: imageAssetUrl ?? this.imageAssetUrl,
        isFavorite: isFavorite ?? this.isFavorite,
      );
}
