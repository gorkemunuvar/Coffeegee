import 'dart:convert';

import 'package:injectable/injectable.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../models/coffee.dart';

abstract class ICoffeeLocalDataSource {
  Future<List<CoffeeModel>> getFavorites();
  Future<void> deleteFavorite(int id);
  Future<void> addFavorite(CoffeeModel coffee);
}

@Injectable(as: ICoffeeLocalDataSource)
class CoffeeLocalDataSource implements ICoffeeLocalDataSource {
  @override
  Future<List<CoffeeModel>> getFavorites() async {
    final prefs = await SharedPreferences.getInstance();
    final favorites = prefs.getStringList('favorites');
    if (favorites == null) return [];

    return favorites.map((e) => CoffeeModel.fromJson(jsonDecode(e))).toList();
  }

  @override
  Future<void> addFavorite(CoffeeModel coffee) async {
    final prefs = await SharedPreferences.getInstance();
    final favorites = prefs.getStringList('favorites');

    if (favorites == null) {
      await prefs.setStringList('favorites', [jsonEncode(coffee.toJson())]);
    } else {
      favorites.add(jsonEncode(coffee.toJson()));
      await prefs.setStringList('favorites', favorites);
    }
  }

  @override
  Future<void> deleteFavorite(int id) async {
    final prefs = await SharedPreferences.getInstance();
    final favorites = prefs.getStringList('favorites');
    if (favorites == null) throw Exception('No favorites found');

    favorites.removeWhere((element) => CoffeeModel.fromJson(jsonDecode(element)).id == id);
    await prefs.setStringList('favorites', favorites);
  }
}
