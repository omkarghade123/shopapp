import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:shopapp/screens/login.dart';

class Sign extends StatefulWidget {
  const Sign({Key? key}) : super(key: key);

  @override
  State<Sign> createState() => _SignState();
}

TextEditingController _Email = TextEditingController();
TextEditingController _password = TextEditingController();
bool eye = true;

TextEditingController _name = TextEditingController();

class _SignState extends State<Sign> {
  getuser() async {
    // SharedPreferences _prefrence = await SharedPreferences.getInstance();
    // _prefrence.setString("name", _name.text);

    try {
      await FirebaseAuth.instance.createUserWithEmailAndPassword(
          email: _Email.text, password: _password.text);
      Navigator.pushReplacement(
          context, MaterialPageRoute(builder: (context) => const Login()));
    } catch (e) {
      showDialog(
          context: this.context,
          builder: (context) {
            return const AlertDialog(
              title: Text("Enter your detail and try again"),
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
            height: double.infinity,
            width: double.infinity,
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
                child: Column(children: [
                  Padding(
                    padding: const EdgeInsets.all(10.0),
                    child: Text(
                      'Sign In',
                      style: TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.w600,
                        color: Colors.black.withOpacity(.7),
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(10.0),
                    child: TextField(
                      controller: _name,
                      decoration: const InputDecoration(
                          prefixIcon: Icon(Icons.account_circle),
                          border: OutlineInputBorder(),
                          hintText: "Enter Username"),
                    ),
                  ),
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
                              child:const Icon(Icons.remove_red_eye)),
                          border:const OutlineInputBorder(),
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
                              getuser();
                            },
                            child:const Text("SIGN UP"),
                          ),
                        ),
                      ],
                    ),
                  ),
                  Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        const Text(
                          "Already have Account ",
                          style: TextStyle(
                            fontSize: 10,
                            color: Color.fromARGB(255, 38, 17, 234),
                          ),
                        ),
                        GestureDetector(
                            onTap: () {
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder: (context) =>const Login(),
                                ),
                              );
                            },
                            child:const Text(
                              "Login",
                              style: TextStyle(
                                fontSize: 14,
                                color: Color.fromARGB(255, 249, 7, 7),
                              ),
                            ))
                      ]),
                ]),
              ),
            ),
          ),
        ),
        ),
        );
  }
}
