import 'package:flutter/material.dart';

class CustomTextField extends StatelessWidget {
  final String _labelText;
  final String? _error;
  final bool _obscureText;
  final IconData _iconData;
  final Function()? _onIconPressedFunc;
  final Function(String) _onChangeFunc;

  const CustomTextField({
    required String labelText,
    required IconData iconData,
    required Function(String) onChangeFunc,
    bool obscureText = false,
    String? error,
    Function()? onIconPressedFunc,
    super.key,
  })  : _labelText = labelText,
        _error = error,
        _obscureText = obscureText,
        _iconData = iconData,
        _onIconPressedFunc = onIconPressedFunc,
        _onChangeFunc = onChangeFunc;

  @override
  Widget build(BuildContext context) {
    return TextField(
      obscureText: _obscureText,
      decoration: InputDecoration(
        suffixIcon: IconButton(
          onPressed: _onIconPressedFunc,
          icon: Icon(_iconData),
        ),
        labelText: _labelText,
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(20.0),
        ),
        contentPadding: const EdgeInsets.symmetric(
          horizontal: 15.0,
          vertical: 17.0,
        ),
        errorText: _error,
      ),
      onChanged: _onChangeFunc,
    );
  }
}
