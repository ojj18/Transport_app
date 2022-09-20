import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:transport_app/common/config.dart';
import 'package:transport_app/widgets/ts_container.dart';
import 'package:http/http.dart' as http;

class SettingsScreen extends StatefulWidget {
  const SettingsScreen({
    Key? key,
  }) : super(key: key);

  static String routeName = "/TsSettings";

  @override
  State<SettingsScreen> createState() => _SettingsScreenState();
}

class _SettingsScreenState extends State<SettingsScreen> {
  bool others = false;
  List<String> gBoxValueList = [];
  Future<List<String>> getGboxList() async {
    final url = Uri.https(baseUrl, gBox);

    try {
      final response = await http.get(url);
      final extractedData = json.decode(response.body);
      extractedData.forEach((key, value) {
        gBoxValueList.add(value);
      });
    } catch (error) {
      rethrow;
    }
    return gBoxValueList;
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
        body: TsContainer(
          onPressed: (value) {
            showDialog(
                context: context,
                builder: (BuildContext context) {
                  return AlertDialog(
                    content: Column(
                      children: [
                        const Text(
                          'Box Name',
                          style: TextStyle(
                            fontSize: 18,
                            color: Colors.grey,
                          ),
                        ),
                        Text(gBoxValueList[value])
                      ],
                    ),
                  );
                });
          },
        ));
  }
}
