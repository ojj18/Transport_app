import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter_typeahead/flutter_typeahead.dart';
import 'package:transport_app/common/config.dart';
import 'package:transport_app/widgets/ts_button.dart';
import 'package:http/http.dart' as http;

class PrintStatusScreen extends StatefulWidget {
  const PrintStatusScreen({Key? key}) : super(key: key);

  static const routeName = '/Printstatus';

  @override
  State<PrintStatusScreen> createState() => _PrintStatusScreenState();
}

class _PrintStatusScreenState extends State<PrintStatusScreen> {
  String? groupValue;
  final TextEditingController _senderPhoneNumberController =
      TextEditingController();
  final TextEditingController _senderAddressController =
      TextEditingController();

  final TextEditingController _receiverPhoneNumberController =
      TextEditingController();
  final TextEditingController _receiverAddressController =
      TextEditingController();

  // for getting the sender phone number list from database
  Future<List<String>> getSenderPhoneNumberList(String patern) async {
    List<String> senderPhoneNumberList = [];
    final url = Uri.https(baseUrl, sender);

    try {
      final response = await http.get(
        url,
      );

      final extractedData = json.decode(response.body) as Map<String, dynamic>;

      extractedData.forEach((senderId, senderNumber) {
        senderPhoneNumberList.add(senderNumber['phoneNumber']);
      });
    } catch (error) {
      rethrow;
    }

    return senderPhoneNumberList;
  }
  // for getting the sender address list from database

  Future<List<String>> getSenderAddressList(String patern) async {
    List<String> senderPhoneNumberList = [];
    final url = Uri.https(baseUrl, sender);

    try {
      final response = await http.get(
        url,
      );

      final extractedData = json.decode(response.body) as Map<String, dynamic>;

      extractedData.forEach((senderId, senderAddress) {
        senderPhoneNumberList.add(senderAddress['englishAddress']);
      });
    } catch (error) {
      rethrow;
    }

    return senderPhoneNumberList;
  }

  // for getting the receiver phone number list from database

  Future<List<String>> getReceiverPhoneNumberList(String patern) async {
    List<String> senderPhoneNumberList = [];
    final url = Uri.https(baseUrl, receiver);

    try {
      final response = await http.get(
        url,
      );

      final extractedData = json.decode(response.body) as Map<String, dynamic>;

      extractedData.forEach((senderId, senderNumber) {
        senderPhoneNumberList.add(senderNumber['phoneNumber']);
      });
    } catch (error) {
      rethrow;
    }

    return senderPhoneNumberList;
  }
  // for getting the receiver address list from database

  Future<List<String>> getReceiverAddressList(String patern) async {
    List<String> senderPhoneNumberList = [];
    final url = Uri.https(baseUrl, receiver);

    try {
      final response = await http.get(
        url,
      );

      final extractedData = json.decode(response.body) as Map<String, dynamic>;

      extractedData.forEach((senderId, senderAddress) {
        senderPhoneNumberList.add(senderAddress['englishAddress']);
      });
    } catch (error) {
      rethrow;
    }

    return senderPhoneNumberList;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        elevation: 0.0,
        backgroundColor: const Color.fromRGBO(63, 81, 181, 1),
        title: const Text('Transport'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(10.0),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Text(
                "Printer Status",
                style: TextStyle(
                  color: Colors.grey.shade600,
                  fontSize: 20,
                ),
              ),
              const SizedBox(
                height: 15,
              ),
              const Text(
                "Printer Not Connected!",
                style: TextStyle(
                  color: Colors.black,
                  fontSize: 22,
                ),
              ),
              const SizedBox(
                height: 10,
              ),
              Text(
                "Sender Details",
                style: TextStyle(
                  color: Colors.grey.shade600,
                  fontSize: 20,
                ),
              ),
              Container(
                height: 40,
                decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(3),
                    border: Border.all(
                        width: 1,
                        color: const Color.fromRGBO(211, 211, 211, 1))),
                child: TypeAheadField(
                  hideOnLoading: true,
                  minCharsForSuggestions: 1,
                  animationDuration: const Duration(milliseconds: 200),
                  textFieldConfiguration: TextFieldConfiguration(
                      keyboardType: TextInputType.number,
                      autofocus: false,
                      controller: _senderPhoneNumberController,
                      style: const TextStyle(fontSize: 16),
                      decoration: const InputDecoration(
                        contentPadding: EdgeInsets.only(left: 5),
                        border: InputBorder.none,
                        hintText: 'Phone Number',
                        hintStyle: TextStyle(fontSize: 20, color: Colors.grey),
                      )),
                  suggestionsCallback: (pattern) async {
                    return await getSenderPhoneNumberList(pattern);
                  },
                  itemBuilder: (context, suggestion) {
                    return ListTile(
                      title: Text(suggestion.toString()),
                      style: ListTileStyle.list,
                    );
                  },
                  onSuggestionSelected: (suggestion) {
                    setState(() {
                      _senderPhoneNumberController.text = suggestion.toString();
                    });
                  },
                ),
              ),
              const SizedBox(
                height: 10,
              ),
              Container(
                padding: const EdgeInsets.all(5.0),
                height: 100,
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(3),
                  border: Border.all(
                    width: 1,
                    color: const Color.fromRGBO(211, 211, 211, 1),
                  ),
                ),
                child: TypeAheadField(
                  hideOnLoading: true,
                  minCharsForSuggestions: 1,
                  animationDuration: const Duration(milliseconds: 200),
                  textFieldConfiguration: TextFieldConfiguration(
                      keyboardType: TextInputType.streetAddress,
                      autofocus: false,
                      controller: _senderAddressController,
                      style: const TextStyle(fontSize: 16),
                      decoration: const InputDecoration(
                        border: InputBorder.none,
                      )),
                  suggestionsCallback: (pattern) async {
                    return await getSenderAddressList(pattern);
                  },
                  itemBuilder: (context, suggestion) {
                    return ListTile(
                      title: Text(suggestion.toString()),
                      style: ListTileStyle.list,
                    );
                  },
                  onSuggestionSelected: (suggestion) {
                    setState(() {
                      _senderAddressController.text = suggestion.toString();
                    });
                  },
                ),
              ),
              const SizedBox(
                height: 10,
              ),
              Text(
                "Receiver Details",
                style: TextStyle(
                  color: Colors.grey.shade600,
                  fontSize: 20,
                ),
              ),
              Container(
                height: 40,
                decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(3),
                    border: Border.all(
                        width: 1,
                        color: const Color.fromRGBO(211, 211, 211, 1))),
                child: TypeAheadField(
                  hideOnLoading: true,
                  minCharsForSuggestions: 1,
                  animationDuration: const Duration(milliseconds: 200),
                  textFieldConfiguration: TextFieldConfiguration(
                      keyboardType: TextInputType.number,
                      autofocus: false,
                      controller: _receiverPhoneNumberController,
                      style: const TextStyle(fontSize: 16),
                      decoration: const InputDecoration(
                        contentPadding: EdgeInsets.only(left: 5),
                        border: InputBorder.none,
                        hintText: 'Phone Number',
                        hintStyle: TextStyle(fontSize: 20, color: Colors.grey),
                      )),
                  suggestionsCallback: (pattern) async {
                    return await getReceiverPhoneNumberList(pattern);
                  },
                  itemBuilder: (context, suggestion) {
                    return ListTile(
                      title: Text(suggestion.toString()),
                      style: ListTileStyle.list,
                    );
                  },
                  onSuggestionSelected: (suggestion) {
                    setState(() {
                      _receiverPhoneNumberController.text =
                          suggestion.toString();
                    });
                  },
                ),
              ),
              const SizedBox(
                height: 10,
              ),
              Container(
                padding: const EdgeInsets.all(5.0),
                height: 100,
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(3),
                  border: Border.all(
                    width: 1,
                    color: const Color.fromRGBO(211, 211, 211, 1),
                  ),
                ),
                child: TypeAheadField(
                  hideOnLoading: true,
                  minCharsForSuggestions: 1,
                  animationDuration: const Duration(milliseconds: 200),
                  textFieldConfiguration: TextFieldConfiguration(
                      keyboardType: TextInputType.streetAddress,
                      autofocus: false,
                      controller: _receiverAddressController,
                      style: const TextStyle(fontSize: 16),
                      decoration: const InputDecoration(
                        border: InputBorder.none,
                      )),
                  suggestionsCallback: (pattern) async {
                    return await getReceiverAddressList(pattern);
                  },
                  itemBuilder: (context, suggestion) {
                    return ListTile(
                      title: Text(suggestion.toString()),
                      style: ListTileStyle.list,
                    );
                  },
                  onSuggestionSelected: (suggestion) {
                    setState(() {
                      _receiverAddressController.text = suggestion.toString();
                    });
                  },
                ),
              ),
              const SizedBox(
                height: 10,
              ),
              SizedBox(
                height: 50,
                // width: 200,
                child: Row(
                  children: [
                    radioList(
                        radioValue: "TVM",
                        radioGroupValue: groupValue,
                        onChange: (value) {
                          setState(() {
                            groupValue = value;
                          });
                        }),
                    radioList(
                        radioValue: "GIN",
                        radioGroupValue: groupValue,
                        onChange: (value) {
                          setState(() {
                            groupValue = value;
                          });
                        }),
                    radioList(
                        radioValue: "VET",
                        radioGroupValue: groupValue,
                        onChange: (value) {
                          setState(() {
                            groupValue = value;
                          });
                        }),
                    radioList(
                        radioValue: "CHE",
                        radioGroupValue: groupValue,
                        onChange: (value) {
                          setState(() {
                            groupValue = value;
                          });
                        }),
                    radioList(
                        radioValue: "KAN",
                        radioGroupValue: groupValue,
                        onChange: (value) {
                          setState(() {
                            groupValue = value;
                          });
                        }),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
      bottomNavigationBar: Container(
        padding: const EdgeInsets.all(10.0),
        height: 65,
        child: TsButton(
          minWidth: double.infinity,
          buttonText: "NEXT",
          buttonColor: const Color.fromRGBO(63, 81, 181, 1),
          onPressed: () {
            //   Navigator.pushNamed(context, DashboardScreen.routeName);
          },
        ),
      ),
    );
  }

  Widget radioList(
      {String? radioValue, String? radioGroupValue, dynamic onChange}) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        Radio<String>(
            activeColor: Colors.pinkAccent,
            value: radioValue!,
            groupValue: radioGroupValue,
            onChanged: onChange),
        Text(radioValue),
      ],
    );
  }
}
