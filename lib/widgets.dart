import 'package:flutter/material.dart';

class ProductivityButton extends StatelessWidget {
  final Color color;
  final String text;
  final double size;
  final VoidCallback onPressed;
  const ProductivityButton(
      {super.key,
      required this.color,
      required this.text,
      required this.onPressed,
      required this.size});

  @override
  Widget build(BuildContext context) {
    return MaterialButton(
      onPressed: onPressed,
      color: color,
      minWidth: size,
      child: Text(
        text,
        style: const TextStyle(color: Colors.white),
      ),
    );
  }
}

typedef CallbackSetting = void Function(String, int);

class SettingsButton extends StatelessWidget {
  final Color color;
  final String text;
  final double size;
  final int value;
  final String setting;
  final CallbackSetting callback;
  SettingsButton(
      this.color, this.text, this.size, this.value, this.setting, this.callback,
      {super.key});
  @override
  Widget build(BuildContext context) {
    return MaterialButton(
      onPressed: () => callback(setting, value),
      color: color,
      minWidth: size,
      child: Text(text, style: const TextStyle(color: Colors.white)),
    );
  }
}
