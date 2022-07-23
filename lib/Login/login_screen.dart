import 'package:flutter/material.dart';
import 'package:transport_app/Dashboard/dashboard_screen.dart';
import 'package:transport_app/widgets/ts_button.dart';
import '../widgets/tstext_field.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({Key? key}) : super(key: key);

  static const routeName = "/Login";

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromRGBO(241, 241, 241, 1),
      appBar: AppBar(
        elevation: 0.0,
        backgroundColor: const Color.fromRGBO(63, 81, 181, 1),
        title: const Text('Transport'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(10.0),
        child: SingleChildScrollView(
          child: Flex(
            direction: Axis.vertical,
            children: [
              const Image(
                height: 150,
                image: AssetImage('assets/images/login.png'),
              ),
              const TsFormField(
                autoFocus: false,
                textInputAction: TextInputAction.next,
                labelText: "User Name",
                labelColor: Color.fromRGBO(65, 81, 176, 1),
                labelSize: 20,
                hintText: "Enter your Username",
              ),
              const SizedBox(
                height: 10,
              ),
              const TsFormField(
                autoFocus: false,
                textInputAction: TextInputAction.done,
                labelText: "Password",
                labelColor: Color.fromRGBO(65, 81, 176, 1),
                labelSize: 20,
                hintText: "Enter your password",
              ),
              const SizedBox(
                height: 30,
              ),
              TsButton(
                minWidth: double.infinity,
                buttonText: "LOGIN",
                buttonColor: const Color.fromRGBO(63, 81, 181, 1),
                onPressed: () {
                  Navigator.pushNamed(context, DashboardScreen.routeName);
                },
              )
            ],
          ),
        ),
      ),
    );
  }
}
