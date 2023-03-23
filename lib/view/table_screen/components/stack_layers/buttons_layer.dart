import 'package:flutter/material.dart';

import '../lobby_button.dart';

class ButtonsLayer extends StatelessWidget {
  const ButtonsLayer({super.key});

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    return Positioned(
      bottom: 0,
      child: SizedBox(
        width: size.width,
        child: Padding(
          padding: const EdgeInsets.all(5.0),
          child: Column(
            children: [
              Row(
                children: [
                  LobbyButton(text: 'Fold', onPressedFunc: () {}),
                  const SizedBox(width: 5.0),
                  LobbyButton(text: 'Check', onPressedFunc: () {}),
                  const SizedBox(width: 5.0),
                  LobbyButton(text: 'Bet', onPressedFunc: () {}),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
