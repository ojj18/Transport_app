// ignore_for_file: file_names

import 'package:flutter/material.dart';

class TsFormField extends StatelessWidget {
  const TsFormField(
      {Key? key,
      this.labelText,
      this.hintText,
      this.labelColor,
      this.labelSize,
      this.autoFocus = false,
      this.textInputAction})
      : super(key: key);

  final String? labelText;
  final String? hintText;
  final Color? labelColor;
  final double? labelSize;
  final TextInputAction? textInputAction;
  final bool autoFocus;

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        if (labelText != null)
          Text(
            labelText!,
            style: TextStyle(
              fontSize: labelSize,
              color: labelColor,
            ),
          ),
        Container(
          margin: const EdgeInsets.only(top: 5),
          color: Colors.white,
          height: 50,
          child: TextFormField(
            // textAlign: TextAlign.center,
            // textAlignVertical: TextAlignVertical.center,
            cursorColor: Colors.pinkAccent,
            cursorHeight: 30,
            cursorWidth: 2.0,
            autofocus: autoFocus,
            textInputAction: textInputAction,
            decoration: InputDecoration(
              hintText: hintText,
              enabledBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(3),
                borderSide: const BorderSide(
                    width: 1, color: Color.fromRGBO(211, 211, 211, 1)),
              ),
              focusedBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(3),
                borderSide: const BorderSide(
                    width: 1, color: Color.fromRGBO(211, 211, 211, 1)),
              ),
            ),
          ),
        )
      ],
    );
  }
}
