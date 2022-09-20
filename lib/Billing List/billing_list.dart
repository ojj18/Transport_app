import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:transport_app/common/config.dart';
import 'package:http/http.dart' as http;
import 'package:transport_app/model/billing_model.dart';

class BillingListScreen extends StatefulWidget {
  const BillingListScreen({Key? key}) : super(key: key);

  static const routeName = '/BillinglistScreen';

  @override
  State<BillingListScreen> createState() => _BillingListScreenState();
}

class _BillingListScreenState extends State<BillingListScreen> {
  BillingModel _billingModel = BillingModel();
  Map<String, dynamic> extractedData = Map<String, dynamic>();
  final List<BillingModel> _billingList = [];
  getBillingList() async {
    final url = Uri.https(baseUrl, billed);

    try {
      final response = await http.get(
        url,
      );
      extractedData = json.decode(response.body);
      extractedData.forEach((key, value) {
        _billingModel = BillingModel.fromJson(value);
        _billingList.add(_billingModel);
      });
    } catch (error) {
      rethrow;
    }
    return _billingList;
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
        body: FutureBuilder(
            future: getBillingList(),
            builder: (context, snapShot) {
              if (snapShot.connectionState == ConnectionState.done) {
                return ListView.builder(
                  itemCount: _billingList.length,
                  itemBuilder: (context, index) {
                    _billingList.sort(((a, b) {
                      return a.time!.compareTo(b.time!);
                    }));
                    return Column(
                      children: [
                        Container(
                          padding: const EdgeInsets.all(10),
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.start,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Text(
                                    _billingList[index].billNo!,
                                    style: const TextStyle(
                                      fontSize: 20,
                                    ),
                                  ),
                                  Text(
                                    _billingList[index].total!,
                                    style: const TextStyle(
                                      fontSize: 20,
                                    ),
                                  ),
                                ],
                              ),
                              const SizedBox(
                                height: 10,
                              ),
                              Text(
                                _billingList[index].date! +
                                    " " +
                                    _billingList[index].time!,
                                style: const TextStyle(
                                  fontSize: 14,
                                ),
                              ),
                            ],
                          ),
                        ),
                        const Divider(
                          color: Colors.grey,
                        )
                      ],
                    );
                  },
                );
              } else {
                return const Center(
                  child: CircularProgressIndicator(
                    color: Colors.white,
                    backgroundColor: Color.fromRGBO(63, 81, 181, 1),
                  ),
                );
              }
            }));
  }
}
