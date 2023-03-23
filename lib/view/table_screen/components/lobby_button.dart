import 'package:flutter/material.dart';

class LobbyButton extends StatelessWidget {
  final String _text;
  final Function() _onPressedFunc;
  const LobbyButton(
      {required String text, required Function() onPressedFunc, super.key})
      : _text = text,
        _onPressedFunc = onPressedFunc;

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: ElevatedButton(
        onPressed: _onPressedFunc,
        child: Text(_text),
      ),
    );
  }
}
