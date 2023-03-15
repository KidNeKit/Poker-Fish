import 'package:flutter/material.dart';

class TableTag extends StatelessWidget {
  final String _tag;
  final Color _backgroundColor;
  final Color _color;

  const TableTag(
      {required String tag,
      required Color backgroundColor,
      Color color = Colors.white,
      super.key})
      : _tag = tag,
        _backgroundColor = backgroundColor,
        _color = color;

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 5,
      color: _backgroundColor,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(30.0),
      ),
      child: Padding(
        padding: const EdgeInsets.all(5.0),
        child: Text(
          _tag,
          style: TextStyle(color: _color),
        ),
      ),
    );
  }
}
