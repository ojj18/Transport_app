import 'package:flutter/material.dart';
import 'package:transport_app/settings/box-card.dart';
import 'package:transport_app/settings/box_card_others.dart';
import 'package:transport_app/widgets/ts_button.dart';
import 'package:transport_app/widgets/ts_container.dart';

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

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        elevation: 0.0,
        backgroundColor: const Color.fromRGBO(63, 81, 181, 1),
        title: const Text('Transport'),
      ),
      body: ListView.builder(
          itemCount: 20,
          itemBuilder: (BuildContext ctxt, int index) {
            return TsContainer(
              onPressed: () {
                showDialog(
                    context: context,
                    builder: (BuildContext context) {
                      return others == true
                          ? const BoxCardOthers()
                          : const BoxCardWidget();
                    });
              },
            );
          }),
      floatingActionButton: FloatingActionButton(
        // isExtended: true,
        child: const Icon(Icons.add),
        backgroundColor: const Color.fromRGBO(63, 81, 181, 1),
        onPressed: () {},
      ),
      bottomNavigationBar: Flex(
        direction: Axis.horizontal,
        children: [
          TsButton(
            minWidth: MediaQuery.of(context).size.width * 0.5,
            buttonText: "BOXES",
            buttonTextColor: Colors.black,
            buttonColor: Colors.white54,
            onPressed: () {},
          ),
          TsButton(
            buttonText: "OTHERS",
            minWidth: MediaQuery.of(context).size.width * 0.5,
            buttonColor: Colors.white54,
            buttonTextColor: Colors.black,
            onPressed: () {
              others = true;
            },
          )
        ],
      ),
    );
  }
}
