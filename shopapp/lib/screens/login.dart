import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

import 'package:shopapp/screens/sign.dart';

import './products_overview_screen.dart';
class Login extends StatefulWidget {
  const Login({Key? key}) : super(key: key);

  @override
  State<Login> createState() => _LoginState();
}

class _LoginState extends State<Login> {
  TextEditingController _Email = TextEditingController();
  TextEditingController _password = TextEditingController();
  bool eye = true;

  getSignin() async {
    try {
      await FirebaseAuth.instance.signInWithEmailAndPassword(
          email: _Email.text, password: _password.text);
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(
          builder: (context) => ProductsOverviewScreen(),
        ),
      );
    } catch (e) {
      showDialog(
          context: context,
          builder: (context) {
            return AlertDialog(
              title: Text("User does not exist"),
            );
          });
    }
  }

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      extendBodyBehindAppBar: true,
      appBar: AppBar(
        brightness: Brightness.dark,
        backgroundColor: Colors.transparent,
        elevation: 0,
      ),
      body: SingleChildScrollView(
        child: SizedBox(
          height: size.height,
          child: Container(
            alignment: Alignment.center,
            decoration: const BoxDecoration(
              gradient: LinearGradient(
                begin: Alignment.topLeft,
                end: Alignment.bottomRight,
                colors: [
                  Color(0xffFEC37B),
                  Color(0xffFF4184),
                ],
              ),
            ),
            child: Container(
              width: size.width * .9,
              height: size.width * 1.1,
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(15),
              ),
              child: Padding(
                padding: const EdgeInsets.all(12.0),
                child: Column(
                  children: [
                    Padding(
                      padding: const EdgeInsets.all(20.0),
                      child: Text(
                        'Login',
                        style: TextStyle(
                          fontSize: 20,
                          fontWeight: FontWeight.w600,
                          color: Colors.black.withOpacity(.7),
                        ),
                      ),
                    ),
                    SizedBox(),
                    Padding(
                      padding: const EdgeInsets.all(10.0),
                      child: TextField(
                        controller: _Email,
                        decoration: const InputDecoration(
                            prefixIcon: Icon(Icons.email),
                            border: OutlineInputBorder(),
                            hintText: "Enter Your Email"),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(10.0),
                      child: TextField(
                        obscureText: eye,
                        controller: _password,
                        decoration: InputDecoration(
                            prefixIcon: const Icon(Icons.lock),
                             suffixIcon: GestureDetector(
                                onTap: () {
                                  setState(() {
                                    eye = !eye;
                                  });
                                },
                                child: const Icon(Icons.remove_red_eye)
                                ),
                            border: const OutlineInputBorder(),
                            hintText: "Enter Your Password"),
                            
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(12.0),
                      child: Row(
                        children: [
                          Expanded(
                            child: ElevatedButton(
                              onPressed: () {
                                getSignin();
                              },
                              child: Text("Login"),
                            ),
                          ),
                          const SizedBox(
                            width: 10,
                          ),
                          const Expanded(
                              child: Text(
                            "Forgot Password!",
                            style: TextStyle(
                                fontSize: 12,
                                color: Color.fromARGB(255, 38, 17, 234)),
                          )),
                        ],
                      ),
                    ),
                    const Text(
                      "Don't Have an Account?",
                      style: TextStyle(
                        fontSize: 14,
                        color: Color.fromARGB(255, 38, 17, 234),
                      ),
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    GestureDetector(
                        onTap: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => Sign(),
                            ),
                          );
                        },
                        child: const Text(
                          "Sign up",
                          style: TextStyle(
                            fontSize: 18,
                            color: Color.fromARGB(255, 249, 7, 7),
                          ),
                        ))
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
