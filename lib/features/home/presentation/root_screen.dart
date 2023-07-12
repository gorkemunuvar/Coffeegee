import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../core/injection/injection.dart';
import '../../coffee/presentation/cubit/coffee_list_cubit.dart';
import '../../coffee/presentation/cubit/favorites_cubit.dart';
import '../../coffee/presentation/screens/coffe_list_screen.dart';
import '../../coffee/presentation/screens/favorites_screen.dart';

class RootScreen extends StatefulWidget {
  const RootScreen({super.key});

  @override
  State<RootScreen> createState() => _RootScreenState();
}

class _RootScreenState extends State<RootScreen> {
  int _selectedIndex = 0;
  static const optionStyle = TextStyle(fontSize: 30, fontWeight: FontWeight.bold);

  static const List<Widget> _widgetOptions = <Widget>[
    CoffeeListScreen(),
    FavoritesScreen(),
  ];

  void _onItemTapped(int index) {
    setState(() => _selectedIndex = index);
  }

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(create: (context) => getIt<CoffeeListCubit>()..fetchCoffees()),
        BlocProvider(create: (context) => getIt<FavoritesCubit>()..init()),
      ],
      child: Scaffold(
        appBar: AppBar(title: const Text('Coffeegee')),
        body: Center(
          child: _widgetOptions.elementAt(_selectedIndex),
        ),
        bottomNavigationBar: BottomNavigationBar(
          items: const <BottomNavigationBarItem>[
            BottomNavigationBarItem(
              icon: Icon(Icons.coffee),
              label: 'Coffees',
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.favorite),
              label: 'Favorites',
            ),
          ],
          currentIndex: _selectedIndex,
          selectedItemColor: Colors.amber[800],
          onTap: _onItemTapped,
        ),
      ),
    );
  }
}
