import 'package:flutter/material.dart';
import 'package:shopapp/screens/login.dart';

class FirstScreen extends StatefulWidget {
  const FirstScreen({Key? key}) : super(key: key);

  @override
  State<FirstScreen> createState() => _FirstScreenState();
}

class _FirstScreenState extends State<FirstScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(12.0),
        child: ListView(
          children: [
            Image.asset("assets/family.png"),
            Center(
              child: Text(
                "Welcome",
                style: TextStyle(fontWeight: FontWeight.bold, fontSize: 30),
              ),
            ),
            Center(
              child: Text(
                "To MyShop",
                style: TextStyle(fontWeight: FontWeight.bold, fontSize: 30),
              ),
            ),
            GestureDetector(
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => Login(),
                  ),
                );
              },
              child: Container(
                height: 70,
                width: double.infinity,
                child: Card(
                  color: Color.fromARGB(255, 237, 23, 8),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(30.0),
                  ),
                  child: Row(
                    children: [
                      Padding(
                        padding: const EdgeInsets.all(10.0),
                        child: CircleAvatar(
                          backgroundColor: Color.fromARGB(255, 61, 26, 219),
                          child: Icon(Icons.ac_unit_sharp),
                          radius: 25,
                        ),
                      ),
                      SizedBox(
                        width: 10,
                      ),
                      Text(
                        "Login with google",
                        style: TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 25,
                            color: Colors.white),
                      )
                    ],
                  ),
                ),
              ),
            ),
            Container(
              height: 70,
              width: double.infinity,
              child: Card(
                color: Color.fromARGB(255, 6, 20, 142),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(30.0),
                ),
                child: Row(
                  children: [
                    Padding(
                      padding: const EdgeInsets.all(10.0),
                      child: CircleAvatar(
                        backgroundColor: Color.fromARGB(255, 69, 25, 215),
                        child: Icon(Icons.facebook),
                        radius: 25,
                      ),
                    ),
                    SizedBox(
                      width: 10,
                    ),
                    Text(
                      "Login with facebook",
                      style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 25,
                          color: Colors.white),
                    )
                  ],
                ),
              ),
            ),
            // SizedBox(
            //   height: 10,
            // ),
            // Center(
            //   child: Text(
            //     "Alredy have account?",
            //     style: TextStyle(
            //       fontSize: 20,
            //     ),
            //   ),
            // ),
            // Center(
            //   child: GestureDetector(
            //     onTap: () {
            //        Navigator.push(
            //       context,
            //       MaterialPageRoute(
            //         builder: (context) => Login(),
            //       ),
            //     );
            //     },
            //     child: Text(
            //       "Login",
            //       style: TextStyle(
            //           fontWeight: FontWeight.bold,
            //           fontSize: 20,
            //           color: Colors.blue),
            //     ),
          ],
        ),
      ),
    );
  }
}
