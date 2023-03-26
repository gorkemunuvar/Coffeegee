import '../../data/models/coffee.dart';

class Coffee {
  const Coffee({
    required this.name,
    required this.country,
    required this.type,
    required this.roast,
    required this.flavors,
    required this.recipe,
    required this.imageAssetUrl,
  });

  factory Coffee.fromModel(CoffeeModel model) => Coffee(
        name: model.name,
        country: model.country,
        type: model.type,
        roast: model.roast,
        flavors: model.flavors,
        recipe: model.recipe,
        imageAssetUrl: model.imageAssetUrl,
      );

  final String name;
  final String country;
  final String type;
  final String roast;
  final List<String> flavors;
  final String recipe;
  final String imageAssetUrl;
}
