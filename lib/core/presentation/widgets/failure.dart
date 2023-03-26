import 'package:flutter/material.dart';

class FailureWidget extends StatelessWidget {
  const FailureWidget({this.message, super.key});

  final String? message;

  @override
  Widget build(BuildContext context) {
    return Center(child: Text(message ?? 'Something went wrong.'));
  }
}
