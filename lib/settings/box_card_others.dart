import 'package:flutter/material.dart';
import 'package:transport_app/widgets/ts_button.dart';
import 'package:transport_app/widgets/tstext_field.dart';

class BoxCardOthers extends StatefulWidget {
  const BoxCardOthers({Key? key}) : super(key: key);

  @override
  State<BoxCardOthers> createState() => _BoxCardOthersState();
}

class _BoxCardOthersState extends State<BoxCardOthers> {
  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      actions: [
        const Padding(
          padding: EdgeInsets.only(bottom: 15),
          child: TsFormField(
            autoFocus: true,
            textInputAction: TextInputAction.next,
            labelText: "English Name",
            labelColor: Colors.black45,
            labelSize: 20,
          ),
        ),
        const Padding(
          padding: EdgeInsets.only(bottom: 15),
          child: TsFormField(
            autoFocus: true,
            textInputAction: TextInputAction.next,
            labelText: "Tamil Name",
            labelColor: Colors.black45,
            labelSize: 20,
          ),
        ),
        const Padding(
          padding: EdgeInsets.only(bottom: 15),
          child: TsFormField(
            autoFocus: true,
            textInputAction: TextInputAction.next,
            labelText: "Position",
            labelColor: Colors.black45,
            labelSize: 20,
          ),
        ),
        const Padding(
          padding: EdgeInsets.only(bottom: 15),
          child: TsFormField(
            autoFocus: true,
            textInputAction: TextInputAction.next,
            labelText: "Amount",
            labelColor: Colors.black45,
            labelSize: 20,
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
