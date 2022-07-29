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

  //a global key for the form widget to be used globally
  final _formKey = GlobalKey<FormState>();
  moveToHome(BuildContext context) async {
    //if at currentState every Validation is passed then only GO TO ROUTE using login button
    if (_formKey.currentState!.validate()) {
      //now to change the state on login button click to show animation
      setState(() {
        changeButton = true;
      });
      Navigator.pushNamed(context, MyRoutes.homeRoute);
      //After Login if the User comes back to login screen then it resets to normal Login BUtton without animation
      setState(() {
        changeButton = false;
      });
    }
  }

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
        child: Form(
          key: _formKey,
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
                padding: const EdgeInsets.symmetric(
                    vertical: 18.0, horizontal: 32.0),
                child: Column(
                  children: [
                    TextFormField(
                      decoration: const InputDecoration(
                        hintText: "Enter Username",
                        labelText: "Username",
                      ),
                      //username validation
                      validator: (value) {
                        if (value!.isEmpty) {
                          return ("Username can't be empty");
                        }
                        return null;
                      },
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
                      //password validation
                      validator: (value) {
                        if (value!.isEmpty) {
                          return ("Password can't be empty");
                        } else if (value.length < 6) {
                          return ("Password length should be more than 6");
                        }
                        return null;
                      },
                    ),
                    const SizedBox(height: 30.0),
                    Material(
                      color: Colors.blue,
                      //Decoration needs to given to Material not inside InkWell
                      borderRadius:
                          BorderRadius.circular(changeButton ? 70 : 8),

                      child: InkWell(
                        onTap: () => moveToHome(context),
                        child: AnimatedContainer(
                          duration: const Duration(seconds: 1),
                          //conditional statement for animation when changebutton = true;
                          width: changeButton ? 70 : 130,
                          height: 50,
                          alignment: Alignment.center,
                          child: changeButton
                              ? Icon(Icons.done, color: Colors.white)
                              : const Text(
                                  "Login",
                                  style: TextStyle(
                                    color: Colors.white,
                                    fontSize: 20,
                                  ),
                                ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
      //),
    );
  }
}
