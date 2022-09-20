// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:transport_app/Billing%20List/billing_list.dart';
import 'package:transport_app/Billing/print_status_screen.dart';
import 'package:transport_app/settings/settings_screen.dart';

class DashboardScreen extends StatefulWidget {
  const DashboardScreen({Key? key}) : super(key: key);

  static String routeName = "/Dashboard";

  @override
  State<DashboardScreen> createState() => _DashboardScreenState();
}

class _DashboardScreenState extends State<DashboardScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        elevation: 0.0,
        backgroundColor: const Color.fromRGBO(63, 81, 181, 1),
        title: const Text('Transport'),
        // actions: [
        //   PopupMenuButton(
        //     onSelected: (value) {
        //       if (value == 0) {
        //         Navigator.pushReplacementNamed(
        //             context, SettingsScreen.routeName);
        //       } else if (value == 2) {
        //         Navigator.pushReplacementNamed(
        //             context, BillingListScreen.routeName);
        //       }
        //     },
        //     itemBuilder: (context) => [
        //       PopupMenuItem(
        //         child: Text("Settings"),
        //         value: 0,
        //       ),
        //       PopupMenuItem(
        //         child: Text("Offline sync"),
        //         value: 1,
        //       ),
        //       PopupMenuItem(
        //         child: Text("Bill List"),
        //         value: 2,
        //       ),
        //       PopupMenuItem(
        //         child: Text("TC List"),
        //       ),
        //       PopupMenuItem(
        //         child: Text("Bluetooth"),
        //       ),
        //     ],
        //   ),
        // ],
      ),
      body: Padding(
        padding: const EdgeInsets.all(10.0),
        child: GridView.count(
          mainAxisSpacing: 10,
          crossAxisSpacing: 10,
          crossAxisCount: 2,
          childAspectRatio: 4 / 6,
          children: [
            cardWidget("assets/images/bill.png", "BILLING", () {
              Navigator.pushNamed(context, BillingListScreen.routeName);
            }),
          ],
        ),
      ),
    );
  }

  Widget cardWidget(String imageUrl, String labelText, VoidCallback onTap) {
    return InkWell(
      onTap: onTap,
      child: Container(
        decoration: BoxDecoration(
            border: Border.all(
                width: 1, color: const Color.fromRGBO(211, 211, 211, 1))),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Padding(
              padding: const EdgeInsets.only(top: 60),
              child: Image(
                image: AssetImage(imageUrl),
                height: 120,
              ),
            ),
            Container(
              height: 50,
              width: double.infinity,
              color: const Color.fromRGBO(63, 81, 181, 1),
              child: Center(
                  child: Text(
                labelText,
                style: const TextStyle(color: Colors.white),
              )),
            )
          ],
        ),
      ),
    );
  }
}
