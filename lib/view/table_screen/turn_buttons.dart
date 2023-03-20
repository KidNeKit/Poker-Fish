import 'package:flutter/material.dart';

class TurnButtons extends StatelessWidget {
  const TurnButtons({super.key});

  @override
  Widget build(BuildContext context) {
    var height = MediaQuery.of(context).size.height;
    return Container(
      height: 0.2 * height,
      width: double.infinity,
      color: Colors.amber,
    );
  }
}
