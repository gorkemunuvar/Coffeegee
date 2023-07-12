import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../core/presentation/widgets/widgets.dart';
import '../cubit/favorites_cubit.dart';
import '../widgets/widgets.dart';

class FavoritesScreen extends StatefulWidget {
  const FavoritesScreen({super.key});

  @override
  State<FavoritesScreen> createState() => _FavoritesScreenState();
}

class _FavoritesScreenState extends State<FavoritesScreen> with SingleTickerProviderStateMixin {
  @override
  Widget build(BuildContext context) {
    return const _FavoritesListView();
  }
}

class _FavoritesListView extends StatelessWidget {
  const _FavoritesListView();

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<FavoritesCubit, FavoritesState>(
      builder: (context, state) {
        return state.maybeWhen(
          initial: () => const LoadingWidget(),
          loading: () => const LoadingWidget(),
          loaded: (coffees) => coffees.isNotEmpty
              ? CoffeeListView(
                  coffees,
                  showFavoriteButton: false,
                )
              : const _NotFoundWidget(),
          couldNotLoad: (_) => const FailureWidget(),
          orElse: () => const SizedBox.shrink(),
        );
      },
    );
  }
}

class _NotFoundWidget extends StatelessWidget {
  const _NotFoundWidget();

  @override
  Widget build(BuildContext context) {
    return const Center(child: Text('No favorites found.'));
  }
}
