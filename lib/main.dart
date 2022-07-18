import 'package:flutter/material.dart';
import 'package:transport_app/Billing/print_status_screen.dart';
import 'package:transport_app/Dashboard/dashboard_screen.dart';
import 'package:transport_app/settings/settings_screen.dart';
import '../Login/login_screen.dart';

main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      initialRoute: LoginScreen.routeName,
      routes: {
        LoginScreen.routeName: (context) => const LoginScreen(),
        DashboardScreen.routeName: (context) => const DashboardScreen(),
        PrintStatusScreen.routeName: (context) => const PrintStatusScreen(),
        SettingsScreen.routeName:(context) =>  SettingsScreen()

      },
    );
  }
}
