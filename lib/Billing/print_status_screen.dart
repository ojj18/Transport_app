import 'package:flutter/material.dart';
import 'package:transport_app/widgets/Ts_button.dart';
import 'package:transport_app/widgets/Ts_text_dropdown.dart';

class PrintStatusScreen extends StatefulWidget {
  const PrintStatusScreen({Key? key}) : super(key: key);

  static const routeName = '/Printstatus';

  @override
  State<PrintStatusScreen> createState() => _PrintStatusScreenState();
}

class _PrintStatusScreenState extends State<PrintStatusScreen> {
  final ScrollController _listScrollController = ScrollController();
  final ScrollController _customScrollController = ScrollController();
  String? groupValue;
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
                child: TextFormField(
                  style: const TextStyle(fontSize: 20),
                  cursorHeight: 25,
                  cursorColor: Colors.pinkAccent,
                  decoration: const InputDecoration(
                    contentPadding: EdgeInsets.only(left: 5),
                    hintText: "Phone Number",
                    hintStyle: TextStyle(fontSize: 20, color: Colors.grey),
                    border: InputBorder.none,
                  ),
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
                        color: const Color.fromRGBO(211, 211, 211, 1))),
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
                padding: const EdgeInsets.all(5.0),
                height: 40,
                decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(3),
                    border: Border.all(
                        width: 1,
                        color: const Color.fromRGBO(211, 211, 211, 1))),
                child: const Text(
                  "Phone Number",
                  style: TextStyle(
                    color: Colors.grey,
                    fontSize: 20,
                  ),
                ),
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
                        color: const Color.fromRGBO(211, 211, 211, 1))),
              )
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
