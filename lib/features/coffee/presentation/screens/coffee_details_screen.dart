import 'package:flutter/material.dart';

import '../../domain/entities/coffee.dart';

class CoffeeDetailsScreen extends StatelessWidget {
  const CoffeeDetailsScreen({required this.coffee, super.key});

  final Coffee coffee;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(coffee.name),
      ),
      body: Column(
        children: [
          Image.asset(
            coffee.imageAssetUrl,
            width: MediaQuery.of(context).size.width,
            height: 300,
            fit: BoxFit.fitWidth,
          ),
          const SizedBox(height: 16),
          _CoffeeDetailsColumn(coffee: coffee),
        ],
      ),
    );
  }
}

class _CoffeeDetailsColumn extends StatelessWidget {
  const _CoffeeDetailsColumn({required this.coffee, super.key});

  final Coffee coffee;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(12.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            coffee.name,
            style: const TextStyle(
              fontSize: 20,
              fontWeight: FontWeight.bold,
            ),
          ),
          const SizedBox(height: 8),
          _CoffeeInfoRow(
            title: 'Type',
            description: coffee.type,
          ),
          const SizedBox(height: 8),
          _CoffeeInfoRow(
            title: 'Origin',
            description: coffee.country,
          ),
          const SizedBox(height: 8),
          _CoffeeInfoRow(
            title: 'Roast',
            description: coffee.roast,
          ),
          const SizedBox(height: 8),
          _CoffeeInfoRow(
            title: 'Flavors',
            description: coffee.flavors.join(', '),
          ),
          const SizedBox(height: 8),
          _CoffeeInfoRow(
            title: 'Recipe',
            description: coffee.recipe,
          )
        ],
      ),
    );
  }
}

class _CoffeeInfoRow extends StatelessWidget {
  const _CoffeeInfoRow({required this.title, required this.description});

  final String title;
  final String description;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          title,
          style: const TextStyle(
            fontSize: 16,
            fontWeight: FontWeight.bold,
          ),
        ),
        const SizedBox(width: 8),
        Text(
          description,
          maxLines: 100,
          overflow: TextOverflow.clip,
          style: const TextStyle(
            fontSize: 15,
            fontWeight: FontWeight.w300,
          ),
        ),
      ],
    );
  }
}
