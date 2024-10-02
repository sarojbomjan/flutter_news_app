import 'package:flutter/material.dart';
import 'package:week1/pages/home_page.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;

    return Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          //image
          Padding(
            padding: const EdgeInsets.only(left: 2),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Icon(
                  Icons.food_bank,
                  color: Colors.black,
                  size: 30,
                ),
                SizedBox(
                  width: 100,
                ),
                Icon(
                  Icons.arrow_back,
                  color: Colors.black,
                ),
              ],
            ),
          ),
          SizedBox(
            height: 40,
          ),
          //container
          Container(
            decoration: BoxDecoration(
                color: Color(0xffE1D7C6),
                borderRadius: BorderRadius.circular(30)),
            width: size.width / 1.1,
            height: size.height / 2.5, // Adjusted height
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Column(
                children: [
                  Text(
                    "Sign In",
                    style: TextStyle(
                        color: Colors.black,
                        fontSize: 40,
                        fontWeight: FontWeight.bold),
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  Container(
                    width: size.width / 1.8,
                    height: 55,
                    child: TextField(
                      decoration: InputDecoration(
                        prefixIcon: Icon(Icons.person),
                        border: OutlineInputBorder(),
                        hintText: "Username",
                      ),
                    ),
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  Container(
                    width: size.width / 1.8,
                    height: 55,
                    child: TextField(
                      decoration: InputDecoration(
                        prefixIcon: Icon(Icons.lock),
                        border: OutlineInputBorder(),
                        hintText: "Password",
                      ),
                    ),
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  SizedBox(
                    width: 200,
                    child: ElevatedButton(
                      onPressed: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(builder: (context) => HomePage()),
                        );
                      },
                      style: ButtonStyle(
                        backgroundColor:
                            MaterialStateProperty.all<Color>(Color(0xffC5705D)),
                      ),
                      child: Text(
                        "Sign in",
                        style: TextStyle(color: Colors.black),
                      ),
                    ),
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      //Sign Up
                      GestureDetector(
                        onTap: () {
                          Navigator.pushNamed(context, "/signup");
                        },
                        child: Text(
                          "Sign Up",
                          style: TextStyle(
                              color: Colors.black,
                              fontSize: 15,
                              fontWeight: FontWeight.bold),
                        ),
                      ),
                      SizedBox(width: 30),
                      //forgot password
                      GestureDetector(
                        onTap: () {
                          Navigator.pushNamed(context, "/forgotpassword");
                        },
                        child: Text(
                          "Forgot Password",
                          style: TextStyle(
                            color: Colors.black,
                            fontSize: 15,
                            decoration: TextDecoration.underline,
                          ),
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
