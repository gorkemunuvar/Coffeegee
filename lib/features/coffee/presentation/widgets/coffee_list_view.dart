import 'package:flutter/material.dart';

import '../../domain/entities/coffee.dart';
import '../screens/coffee_details_screen.dart';
import 'coffee_card.dart';

class CoffeeListView extends StatelessWidget {
  const CoffeeListView(this.coffees, {this.showFavoriteButton = true, super.key});

  final List<Coffee> coffees;
  final bool showFavoriteButton;

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: coffees.length,
      itemBuilder: (context, i) => CoffeeCard(
        coffee: coffees[i],
        onTap: () => _onTap(context, coffees[i]),
        showFavoriteButton: showFavoriteButton,
      ),
    );
  }

  void _onTap(BuildContext context, Coffee coffee) {
    Navigator.of(context).push(
      MaterialPageRoute(
        builder: (context) => CoffeeDetailsScreen(coffee: coffee),
      ),
    );
  }
}
