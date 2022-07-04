import 'dart:ffi';

import 'package:flutter/material.dart';

class TsButton extends StatelessWidget {
  const TsButton({
    Key? key,
    this.buttonText,
    this.buttonColor,
    this.maxHeight = 100,
    this.minHeight = 50,
    this.maxWidth = double.infinity,
    this.minWidth = 100,
    this.onPressed,
  }) : super(key: key);

  final String? buttonText;
  final Color? buttonColor;
  final double? maxHeight;
  final double? minHeight;
  final double? maxWidth;
  final double? minWidth;
  final VoidCallback? onPressed;

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
        child: Text(buttonText!),
        style: ButtonStyle(
          backgroundColor: MaterialStateProperty.all(buttonColor),
        ),
      ),
    );
  }
}
