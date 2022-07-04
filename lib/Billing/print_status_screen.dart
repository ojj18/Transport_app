import 'package:flutter/material.dart';

class PrintStatusScreen extends StatefulWidget {
  const PrintStatusScreen({Key? key}) : super(key: key);

  static const routeName = '/Printstatus';

  @override
  State<PrintStatusScreen> createState() => _PrintStatusScreenState();
}

class _PrintStatusScreenState extends State<PrintStatusScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        elevation: 0.0,
        backgroundColor: const Color.fromRGBO(63, 81, 181, 1),
        title: const Text('Transport'),
      ),
    );
  }
}
