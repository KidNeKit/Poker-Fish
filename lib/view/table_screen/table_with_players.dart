import 'package:flutter/material.dart';

class TableWithPlayers extends StatelessWidget {
  const TableWithPlayers({super.key});

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Container(
        width: double.infinity,
        color: Theme.of(context).primaryColor,
        padding: const EdgeInsets.symmetric(horizontal: 60.0, vertical: 50.0),
        child: Container(
          height: 100,
          width: 100,
          decoration: BoxDecoration(
            color: Colors.blue,
            borderRadius: BorderRadius.circular(150.0),
          ),
        ),
      ),
    );
  }
}
