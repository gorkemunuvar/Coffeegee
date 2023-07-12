import 'package:cofeegee/features/coffee/presentation/cubit/coffee_list_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../domain/entities/coffee.dart';
import '../cubit/favorites_cubit.dart';
import 'widgets.dart';

class CoffeeCard extends StatelessWidget {
  const CoffeeCard({
    required this.coffee,
    required this.onTap,
    this.showFavoriteButton = true,
    super.key,
  });

  final Coffee coffee;
  final VoidCallback onTap;
  final bool showFavoriteButton;

  @override
  Widget build(BuildContext context) => GestureDetector(
        onTap: onTap,
        child: Card(
          margin: const EdgeInsets.symmetric(vertical: 4.0, horizontal: 16),
          child: Padding(
            padding: const EdgeInsets.all(12.0),
            child: Row(
              children: [
                _Image(imageAssetUrl: coffee.imageAssetUrl),
                const SizedBox(width: 16),
                Expanded(child: _Info(coffee: coffee, showFavoriteButton: showFavoriteButton)),
              ],
            ),
          ),
        ),
      );
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

class _Info extends StatelessWidget {
  const _Info({required this.coffee, this.showFavoriteButton = true});

  final Coffee coffee;
  final bool showFavoriteButton;

  @override
  Widget build(BuildContext context) {
    return Column(
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
        ),
        if (showFavoriteButton)
          Row(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              FavoriteIconButton(
                isFilled: coffee.isFavorite,
                onPressed: () => _onFavoriteButtonPressed(context),
              ),
            ],
          ),
      ],
    );
  }

  void _onFavoriteButtonPressed(BuildContext context) {
    context.read<CoffeeListCubit>().fetchCoffees();
    context.read<FavoritesCubit>().onFavoriteButtonPressed(coffee);
  }
}
