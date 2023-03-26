import 'package:cofeegee/features/coffee/presentation/screens/coffe_list_screen.dart';
import 'package:cofeegee/features/home/presentation/root_screen.dart';
import 'package:flutter/material.dart';

class Cofeegee extends StatelessWidget {
  const Cofeegee({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Coffeegee',
      theme: ThemeData(primarySwatch: Colors.blue),
      home: const RootScreen(),
    );
  }
}
