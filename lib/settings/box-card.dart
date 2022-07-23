// ignore_for_file: file_names

import 'package:flutter/material.dart';
import 'package:transport_app/widgets/ts_button.dart';
import 'package:transport_app/widgets/tstext_field.dart';

class BoxCardWidget extends StatefulWidget {
  const BoxCardWidget({
    Key? key,
  }) : super(key: key);

  @override
  State<BoxCardWidget> createState() => _BoxCardWidgetState();
}

class _BoxCardWidgetState extends State<BoxCardWidget> {
  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      title: Flex(
        direction: Axis.vertical,
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: const [
          Text(
            "Box Name",
            style: TextStyle(
              fontSize: 18,
            ),
          ),
        ],
      ),
      content: Container(
          constraints: BoxConstraints(
            minWidth: MediaQuery.of(context).size.width * 0.25,
            maxWidth: MediaQuery.of(context).size.width * 0.35,
          ),
          child: const Text(
            "G-Box(S)",
            textAlign: TextAlign.center,
          )),
      actions: [
        const Padding(
          padding: EdgeInsets.only(bottom: 15),
          child: TsFormField(
            autoFocus: true,
            textInputAction: TextInputAction.next,
            labelSize: 20,
            hintText: "Enter Amount",
          ),
        ),
        TsButton(
          minWidth: double.infinity,
          buttonText: "Update",
          buttonColor: const Color.fromRGBO(63, 81, 181, 1),
          onPressed: () {
            Navigator.of(context).pop();
          },
        )
      ],
    );
  }
}
