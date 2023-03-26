import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../core/presentation/widgets/widgets.dart';
import '../cubit/coffee_list_cubit.dart';
import '../widgets/widgets.dart';

class CoffeeListScreen extends StatefulWidget {
  const CoffeeListScreen({super.key});

  @override
  State<CoffeeListScreen> createState() => _CoffeeListScreenState();
}

class _CoffeeListScreenState extends State<CoffeeListScreen> with SingleTickerProviderStateMixin {
  @override
  Widget build(BuildContext context) {
    return const _CoffeeListView();
  }
}

class _CoffeeListView extends StatelessWidget {
  const _CoffeeListView();

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<CoffeeListCubit, CoffeeListState>(
      builder: (context, state) {
        return state.maybeWhen(
          initial: () => const LoadingWidget(),
          loading: () => const LoadingWidget(),
          loaded: (coffees) => CoffeeListView(coffees),
          couldNotLoad: (_) => const FailureWidget(),
          orElse: () => const SizedBox.shrink(),
        );
      },
    );
  }
}
