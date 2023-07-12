import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';

class FavoriteIconButton extends StatefulWidget {
  const FavoriteIconButton({this.isFilled = false, required this.onPressed, super.key});

  final bool isFilled;
  final VoidCallback onPressed;

  @override
  State<FavoriteIconButton> createState() => _FavoriteIconButtonState();
}

class _FavoriteIconButtonState extends State<FavoriteIconButton> {
  late bool _isFilled;

  @override
  void initState() {
    super.initState();
    _isFilled = widget.isFilled;
  }

  @override
  Widget build(BuildContext context) {
    return IconButton(
      onPressed: _onPressed,
      icon: _Icon(isFilled: _isFilled),
    );
  }

  void _onPressed() {
    setState(() => _isFilled = !_isFilled);
    widget.onPressed();
  }
}

class _Icon extends StatelessWidget {
  const _Icon({this.isFilled = false});

  final bool isFilled;

  @override
  Widget build(BuildContext context) {
    return isFilled
        ? const Icon(Icons.favorite, color: Colors.red)
        : const Icon(Icons.favorite_border, color: Colors.grey);
  }
}
