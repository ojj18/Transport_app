import 'package:firebase_auth/firebase_auth.dart';
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
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();

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
              TsFormField(
                controller: _emailController,
                autoFocus: false,
                textInputAction: TextInputAction.next,
                labelText: "User Name",
                labelColor: const Color.fromRGBO(65, 81, 176, 1),
                labelSize: 20,
                hintText: "Enter your Username",
              ),
              const SizedBox(
                height: 10,
              ),
              TsFormField(
                controller: _passwordController,
                autoFocus: false,
                textInputAction: TextInputAction.done,
                labelText: "Password",
                labelColor: const Color.fromRGBO(65, 81, 176, 1),
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
                onPressed: () async {
                  await FirebaseAuth.instance
                      .signInWithEmailAndPassword(
                        email: _emailController.text.trim(),
                        password: _passwordController.text.trim(),
                      )
                      .then((value) => {
                            Navigator.pushReplacementNamed(
                                context, DashboardScreen.routeName)
                          });
                },
              )
            ],
          ),
        ),
      ),
    );
  }
}
