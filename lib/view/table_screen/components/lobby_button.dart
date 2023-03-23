import 'package:flutter/material.dart';

import '../../../resources/colors.dart';

class LobbyButton extends StatelessWidget {
  final String _text;
  final Function() _onPressedFunc;
  const LobbyButton(
      {required String text, required Function() onPressedFunc, super.key})
      : _text = text,
        _onPressedFunc = onPressedFunc;

  @override
  Widget build(BuildContext context) {
    var height = MediaQuery.of(context).size.height;
    return Expanded(
      child: Container(
        height: 0.07 * height,
        decoration: BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
            colors: [
              greyColor.withOpacity(0.9),
              greyColor.withOpacity(0.9),
              greyColor,
              greyColor,
              greyColor.withOpacity(0.9),
            ],
          ),
          borderRadius: BorderRadius.circular(20.0),
        ),
        child: ElevatedButton(
          onPressed: _onPressedFunc,
          style: ElevatedButton.styleFrom(
            backgroundColor: Colors.transparent,
            shadowColor: Colors.transparent,
            elevation: 5.0,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(20.0),
            ),
          ),
          child: Text(
            _text,
            style: Theme.of(context).textTheme.labelLarge,
          ),
        ),
      ),
    );
  }
}
