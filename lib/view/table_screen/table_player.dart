import 'package:flutter/material.dart';

class TablePlayer extends StatelessWidget {
  const TablePlayer({super.key});

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    double cardWidth = 0.45 * size.width;
    double cardHeight = 0.15 * size.height;
    return SizedBox(
      height: cardHeight,
      width: cardWidth,
      child: Stack(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              CircleAvatar(
                backgroundColor: Theme.of(context).primaryColor,
                radius: (cardWidth - 20) / 4.5,
              ),
              const SizedBox(width: 1.0),
              Container(
                height: (cardWidth - 20) / 2.25,
                width: (cardWidth - 20) / 3.75,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10.0),
                  color: Colors.amber,
                  border: Border.all(color: Theme.of(context).primaryColor),
                ),
              ),
              const SizedBox(width: 2.0),
              Container(
                height: (cardWidth - 20) / 2.25,
                width: (cardWidth - 20) / 3.75,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10.0),
                  color: Colors.amber,
                  border: Border.all(color: Theme.of(context).primaryColor),
                ),
              ),
            ],
          ),
          Align(
            alignment: Alignment.bottomCenter,
            child: Container(
              width: cardWidth,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10.0),
                color: Colors.amber,
                border: Border.all(
                    color: Theme.of(context).primaryColor, width: 2.0),
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisSize: MainAxisSize.min,
                children: [
                  Container(
                    width: double.infinity,
                    padding: const EdgeInsets.all(10.0),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10.0),
                      color: Theme.of(context).primaryColor,
                    ),
                    child: const Center(
                      child: Text('Username'),
                    ),
                  ),
                  Container(
                    width: double.infinity,
                    padding: const EdgeInsets.all(5.0),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10.0),
                    ),
                    child: const Center(
                      child: Text('\$\$\$'),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
