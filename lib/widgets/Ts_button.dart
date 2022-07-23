// ignore_for_file: file_names

import 'package:flutter/material.dart';

class TsButton extends StatelessWidget {
  const TsButton(
      {Key? key,
      this.buttonText,
      this.buttonColor,
      this.maxHeight = 100,
      this.minHeight = 50,
      this.maxWidth = double.infinity,
      this.minWidth = 100,
      this.onPressed,
      this.buttonTextColor})
      : super(key: key);

  final String? buttonText;
  final Color? buttonColor;
  final double? maxHeight;
  final double? minHeight;
  final double? maxWidth;
  final double? minWidth;
  final VoidCallback? onPressed;
  final Color? buttonTextColor;

  @override
  Widget build(BuildContext context) {
    return ConstrainedBox(
      constraints: BoxConstraints(
        maxHeight: maxHeight!,
        minHeight: minHeight!,
        maxWidth: maxWidth!,
        minWidth: minWidth!,
      ),
      child: ElevatedButton(
        onPressed: onPressed,
        child: Text(
          buttonText!,
          style: TextStyle(color: buttonTextColor),
        ),
        style: ButtonStyle(
          backgroundColor: MaterialStateProperty.all(buttonColor),
        ),
      ),
    );
  }
}
