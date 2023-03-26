import 'dart:convert';

import 'package:flutter/services.dart';
import 'package:injectable/injectable.dart';

import '../../models/coffee.dart';

abstract class ICoffeeRemoteDataSource {
  Future<List<CoffeeModel>> getCoffeeList();
}

@Injectable(as: ICoffeeRemoteDataSource)
class CoffeeRemoteDataSource implements ICoffeeRemoteDataSource {
  @override
  Future<List<CoffeeModel>> getCoffeeList() async {
    await Future.delayed(const Duration(seconds: 2));

    final json = await rootBundle.loadString('assets/mocks/coffee_list.json');
    final List<dynamic> jsonList = jsonDecode(json);
    final coffees = jsonList.map((json) => CoffeeModel.fromJson(json)).toList();
    return coffees;
  }
}
