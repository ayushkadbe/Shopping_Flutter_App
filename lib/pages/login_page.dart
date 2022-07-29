import 'package:flutter/material.dart';
import 'package:myapp/utils/routes.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({Key? key}) : super(key: key);

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  String name = "";
  bool changeButton = false; //for animation of login button

  @override
  Widget build(BuildContext context) {
    return Material(
      color: Colors.white,
      //child: Center(
      /*To make Column Page Elements responsive on both Large Screens as well as small
         screen wrap Column in Scroll.
         >>This fix the error of Overflow on small screens
        */
      child: SingleChildScrollView(
        child: Column(
          children: [
            Image.asset(
              "assets/images/login_image.png",
              fit: BoxFit.scaleDown,
            ),

            //for spacing between two as well as any content inside it
            const SizedBox(
              height: 20.0,
            ),

            Text(
              "Welcome $name",
              // ignore: prefer_const_constructors
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
            ),
            const SizedBox(
              height: 20.0,
            ),

            Padding(
              padding:
                  const EdgeInsets.symmetric(vertical: 18.0, horizontal: 32.0),
              child: Column(
                children: [
                  TextFormField(
                    decoration: const InputDecoration(
                      hintText: "Enter Username",
                      labelText: "Username",
                    ),
                    //$name in front of welcome
                    onChanged: (value) {
                      name = value;
                      setState(
                          () {}); //Now in statefulwidget we have to build whole screen again
                      //so call BuildState again using setState() method to change the state
                    },
                  ),
                  TextFormField(
                    obscureText: true,
                    decoration: const InputDecoration(
                      hintText: "Enter Password",
                      labelText: "Password",
                    ),
                  ),
                  const SizedBox(height: 30.0),

                  InkWell(
                    //animate button to red from primary color on click
                    splashColor: Colors.red,
                    onTap: () async {
                      //now to change the state on login button click to show animation
                      setState(() {
                        changeButton = true;
                      });
                      await Future.delayed(const Duration(seconds: 1));
                      Navigator.pushNamed(context, MyRoutes.homeRoute);
                    },
                    child: Ink(
                      //Ink can be used instead of Container or AnimatedCointer for More features.
                      //conditional statement for animation when changebutton = true;
                      width: changeButton ? 70 : 130,
                      height: 50,

                      child: changeButton
                          ? const Icon(Icons.done, color: Colors.white)
                          : const Text(
                              "Login",
                              style: TextStyle(
                                color: Colors.white,
                                fontSize: 20,
                              ),
                            ),
                      decoration: BoxDecoration(
                        color: Colors.blue,
                        borderRadius:
                            BorderRadius.circular(changeButton ? 70 : 8),
                      ),
                    ),
                  ),

                  // ElevatedButton(
                  //   style: TextButton.styleFrom(
                  //     textStyle: const TextStyle(fontSize: 19),
                  //     minimumSize: const Size(127, 45),
                  //   ),
                  //   onPressed: () {
                  //     Navigator.pushNamed(context, MyRoutes.homeRoute);
                  //   },
                  //   child: const Text("Login"),
                  // )
                ],
              ),
            ),
          ],
        ),
      ),
      //),
    );
  }
}
