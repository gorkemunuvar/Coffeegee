import 'package:flutter/material.dart';

import '../../domain/entities/coffee.dart';

class CoffeeCard extends StatelessWidget {
  const CoffeeCard({required this.coffee, required this.onTap, super.key});

  final Coffee coffee;
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Card(
        margin: const EdgeInsets.symmetric(vertical: 4.0, horizontal: 16),
        child: Padding(
          padding: const EdgeInsets.all(12.0),
          child: Row(
            children: [
              _Image(imageAssetUrl: coffee.imageAssetUrl),
              const SizedBox(width: 16),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      coffee.name,
                      style: const TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    const SizedBox(height: 8),
                    Text(
                      coffee.roast,
                      style: const TextStyle(
                        fontSize: 14,
                        fontWeight: FontWeight.w300,
                      ),
                    ),
                    Text(
                      coffee.flavors.join(', '),
                      style: const TextStyle(
                        fontSize: 14,
                        fontWeight: FontWeight.w300,
                      ),
                    )
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class _Image extends StatelessWidget {
  const _Image({required this.imageAssetUrl});

  final String imageAssetUrl;
  @override
  Widget build(BuildContext context) {
    return Image.asset(
      imageAssetUrl,
      width: 100,
      height: 100,
      fit: BoxFit.cover,
    );
  }
}
