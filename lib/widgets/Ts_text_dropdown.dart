// ignore_for_file: must_be_immutable

import 'package:flutter/material.dart';

class TsDropDown extends StatefulWidget {
  TsDropDown(
      {Key? key,
      this.hintText,
      this.minHeight = 50,
      this.maxHeight = 300,
      this.minWidth = 100,
      this.maxWidth = double.maxFinite,
      this.initialValue = "",
      this.items,
      this.valueChanged})
      : super(key: key);
  String? hintText;
  double minHeight;
  double maxHeight;
  double minWidth;
  double maxWidth;
  String? initialValue;
  late List<DropdownMenuItem<dynamic>>? items = [];
  ValueChanged? valueChanged;

  @override
  State<TsDropDown> createState() => _TsDropDownState();
}

class _TsDropDownState extends State<TsDropDown> {
  @override
  Widget build(BuildContext context) {
    return Container(
      constraints: BoxConstraints(
        minHeight: widget.minHeight,
        maxHeight: widget.maxHeight,
        minWidth: widget.minWidth,
        maxWidth: widget.maxWidth,
      ),
      color: Colors.white,
      child: FormField(builder: (FormFieldState<String> state) {
        return InputDecorator(
          decoration: InputDecoration(
            hintText: widget.hintText,
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(3),
              borderSide: const BorderSide(
                  width: 1, color: Color.fromRGBO(211, 211, 211, 1)),
            ),
          ),
          isEmpty: widget.initialValue == "",
          child: DropdownButtonHideUnderline(
              child: DropdownButton<dynamic>(
                  value: widget.initialValue,
                  items: widget.items,
                  onChanged: (value) {
                    widget.valueChanged!(value);
                  })),
        );
      }),
    );
  }
}
