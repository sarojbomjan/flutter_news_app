import "package:flutter/material.dart";
import "package:week1/pages/button_page.dart";
import "package:week1/pages/forgot_password.dart";
import "package:week1/pages/login_page.dart";
import "package:week1/pages/register.dart";

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: LoginPage(),
      routes: {
        '/forgotpassword': (context) => ForgotPassword(),
        "/signup": (context) => RegistrationPage(),
        "/pagecontent": (context) => PageContent(),
      },
    );
  }
}
