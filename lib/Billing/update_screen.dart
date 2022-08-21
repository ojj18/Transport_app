import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:transport_app/common/config.dart';
import 'package:transport_app/widgets/ts_button.dart';
import 'package:transport_app/widgets/tstext_field.dart';

import 'package:http/http.dart' as http;

class ReceiverUpdateScreen extends StatefulWidget {
  const ReceiverUpdateScreen({Key? key}) : super(key: key);

  @override
  State<ReceiverUpdateScreen> createState() => _ReceiverUpdateScreenState();
}

class _ReceiverUpdateScreenState extends State<ReceiverUpdateScreen> {
  final TextEditingController _englishAddressController =
      TextEditingController();
  final TextEditingController _tamilAddressController = TextEditingController();
  final TextEditingController _phoneNumberController = TextEditingController();
  final TextEditingController _pinCodeController = TextEditingController();
  final TextEditingController _nameController = TextEditingController();
  final TextEditingController _placeController = TextEditingController();
  final TextEditingController _hintController = TextEditingController();
  final TextEditingController _remarkController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      title: const Text("Reciver details"),
      content: SizedBox(
        height: MediaQuery.of(context).size.width * 1,
        width: MediaQuery.of(context).size.width * 0.5,
        child: SingleChildScrollView(
          child: Flex(
            direction: Axis.vertical,
            children: [
              Padding(
                padding: const EdgeInsets.only(bottom: 15),
                child: TsFormField(
                  controller: _nameController,
                  // autoFocus: true,
                  textInputAction: TextInputAction.next,
                  labelText: "Name",
                  labelColor: Colors.black45,
                  labelSize: 20,
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(bottom: 15),
                child: TsFormField(
                  controller: _phoneNumberController,
                  // autoFocus: true,
                  textInputAction: TextInputAction.next,
                  labelText: "Phone Number",
                  labelColor: Colors.black45,
                  labelSize: 20,
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(bottom: 15),
                child: TsFormField(
                  controller: _englishAddressController,
                  // autoFocus: true,
                  textInputAction: TextInputAction.next,
                  labelText: "English Name",
                  labelColor: Colors.black45,
                  labelSize: 20,
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(bottom: 15),
                child: TsFormField(
                  controller: _tamilAddressController,
                  // autoFocus: true,
                  textInputAction: TextInputAction.next,
                  labelText: "Tamil Name",
                  labelColor: Colors.black45,
                  labelSize: 20,
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(bottom: 15),
                child: TsFormField(
                  controller: _pinCodeController,
                  // autoFocus: true,
                  textInputAction: TextInputAction.next,
                  labelText: "Pincode",
                  labelColor: Colors.black45,
                  labelSize: 20,
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(bottom: 15),
                child: TsFormField(
                  controller: _placeController,
                  //  autoFocus: true,
                  textInputAction: TextInputAction.next,
                  labelText: "Place",
                  labelColor: Colors.black45,
                  labelSize: 20,
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(bottom: 15),
                child: TsFormField(
                  controller: _hintController,
                  //  autoFocus: true,
                  textInputAction: TextInputAction.next,
                  labelText: "Hint",
                  labelColor: Colors.black45,
                  labelSize: 20,
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(bottom: 15),
                child: TsFormField(
                  controller: _remarkController,
                  //  autoFocus: true,
                  textInputAction: TextInputAction.next,
                  labelText: "Remark",
                  labelColor: Colors.black45,
                  labelSize: 20,
                ),
              ),
            ],
          ),
        ),
      ),
      actionsAlignment: MainAxisAlignment.spaceBetween,
      actions: [
        TsButton(
          // minWidth: double.infinity,
          buttonText: "Cancel",
          buttonColor: const Color.fromRGBO(63, 81, 181, 1),
          onPressed: () {
            Navigator.of(context).pop();
          },
        ),
        TsButton(
          // minWidth: double.infinity,
          buttonText: "Update",
          buttonColor: const Color.fromRGBO(63, 81, 181, 1),
          onPressed: () {
            final _englishAddress = _englishAddressController.text;
            final _tamilAddress = _tamilAddressController.text;
            final _phoneNumber = _phoneNumberController.text;
            final _pinCode = _pinCodeController.text;
            final _name = _nameController.text;
            final _place = _placeController.text;
            final _hint = _hintController.text;
            final _remark = _remarkController.text;
            addReciver(
              englishAddress: _englishAddress,
              tamilAddress: _tamilAddress,
              phoneNumber: _phoneNumber,
              pinCode: _pinCode,
              name: _name,
              place: _place,
              hint: _hint,
              remark: _remark,
            );
          },
        )
      ],
    );
  }

  addReciver(
      {String? englishAddress,
      String? tamilAddress,
      String? phoneNumber,
      String? pinCode,
      String? name,
      String? place,
      String? hint,
      String? remark}) {
    final url = Uri.https(baseUrl, receiver);
    http
        .post(url,
            body: json.encode({
              'englishAddress': englishAddress,
              'tamilAddress': tamilAddress,
              'phoneNumber': phoneNumber,
              'pinCode': pinCode,
              'name': name,
              'place': place,
              'hint': hint,
              'remark': remark,
            }))
        .then((value) => Navigator.pop(context));
  }
}
