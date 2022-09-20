import 'dart:convert';

import 'package:flutter/material.dart';

import '../common/config.dart';
import 'package:http/http.dart' as http;

class TsContainer extends StatefulWidget {
  const TsContainer({
    this.onPressed,
    Key? key,
  }) : super(key: key);

  final Function? onPressed;

  @override
  State<TsContainer> createState() => _TsContainerState();
}

class _TsContainerState extends State<TsContainer> {
  @override
  void initState() {
    getGboxList();
    super.initState();
  }

  List<String> gBoxValueList = [];
  List<String> gBoxNameList = [];

  Future<List<String>> getGboxList() async {
    final url = Uri.https(baseUrl, gBox);

    try {
      final response = await http.get(url);
      final extractedData = json.decode(response.body);
      extractedData.forEach((key, value) {
        gBoxValueList.add(value);
        gBoxNameList.add(key);
      });
    } catch (error) {
      rethrow;
    }
    return gBoxValueList;
  }

  @override
  Widget build(BuildContext context) {
    return SizedBox(
        height: MediaQuery.of(context).size.height * 1,
        width: MediaQuery.of(context).size.width * 1,
        child: ListView.builder(
            itemCount: gBoxValueList.length,
            itemBuilder: (context, index) {
              return SizedBox(
                height: 100,
                width: 400,
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: InkWell(
                    child: Flex(
                      direction: Axis.vertical,
                      children: [
                        Flex(
                          direction: Axis.horizontal,
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(
                              gBoxNameList[index],
                              style: const TextStyle(
                                  fontSize: 20, color: Colors.black),
                            ),
                            Container(
                              height: 40,
                              width: 50,
                              color: const Color.fromRGBO(63, 81, 181, 1),
                              alignment: Alignment.center,
                              child: Text(
                                gBoxValueList[index],
                                style: const TextStyle(
                                    fontSize: 20, color: Colors.white),
                              ),
                            ),
                          ],
                        ),
                        const Divider(
                          color: Colors.black26,
                          height: 20,
                          thickness: 1,
                        )
                      ],
                    ),
                    onTap: widget.onPressed!(),
                  ),
                ),
              );
            }));
  }
}
