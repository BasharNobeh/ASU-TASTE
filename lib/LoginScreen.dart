
import 'package:flutter/material.dart';
import 'package:flutter_application_1/Homescreen.dart';

import 'package:flutter_application_1/Signup.dart';
import 'package:flutter_application_1/main.dart';
import 'package:google_fonts/google_fonts.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _TasteLoginScreenState();
}

class _TasteLoginScreenState extends State<LoginScreen> {
  FocusNode focusNode = FocusNode();
  var obscureTexthowPassword = true;
  var passwordIsTapped = false;
  var passowrdIsValid = false;
  var visibility = false;

  var passwordController = TextEditingController();
  var emailContoller = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: null,
        body: SafeArea(
            child: Container(
          margin: const EdgeInsets.only(top: 30),
          padding: const EdgeInsets.all(15),
          width: double.infinity,
          child: SingleChildScrollView(
            child:
                Column(mainAxisAlignment: MainAxisAlignment.center, children: [
              const ImageIcon(AssetImage("lib/images/LogoIconNbg.png"),
                  size: 120, color: Colors.pink),
              Text(
                "Taste",
                style: GoogleFonts.tangerine(
                  color: const Color.fromARGB(255, 248, 95, 106),
                  fontSize: 50,
                  fontWeight: FontWeight.bold,
                ),
              ),
              Container(
                padding: const EdgeInsets.symmetric(vertical: 40),
                margin: const EdgeInsets.symmetric(horizontal: 30),
                child: Column(
                  children: [
                    const SizedBox(
                      height: 15,
                    ),
                    const Align(
                      alignment: Alignment.centerLeft,
                      child: Text(
                        "Hey There ! Happy To See You Again.",
                        style: TextStyle(
                          fontSize: 18,
                        ),
                      ),
                    ),
                    const SizedBox(
                      height: 15,
                    ),
                    Visibility(
                      visible: visibility,
                      child: Align(
                        alignment: Alignment.centerLeft,
                        child: Text(
                          "Email or Password is wrong , Please try again",
                          style: TextStyle(color: Colors.red),
                        ),
                      ),
                    ),
                    TextFormField(
                      style: const TextStyle(fontWeight: FontWeight.bold),
                      controller: emailContoller,
                      decoration: const InputDecoration(
                          labelText: "Email",
                          hintStyle: TextStyle(fontSize: 15),
                          hintText: "Enter Your Valid Email.",
                          labelStyle: TextStyle(
                              fontSize: 15,
                              fontWeight: FontWeight.w600,
                              color: Colors.pink)),
                      keyboardType: TextInputType.emailAddress,
                    ),
                    Focus(
                      onFocusChange: (hasFocus) {
                        setState(() {
                          passwordIsTapped = hasFocus;
                        });
                      },
                      child: TextFormField(
                        style: const TextStyle(fontWeight: FontWeight.bold),
                        obscureText: obscureTexthowPassword,
                        focusNode: focusNode,
                        controller: passwordController,
                        decoration: InputDecoration(
                          suffixIcon: IconButton(
                            icon: Icon(obscureTexthowPassword
                                ? Icons.remove_red_eye
                                : Icons.visibility_off),
                            onPressed: () {
                              setState(() {
                                obscureTexthowPassword =
                                    !obscureTexthowPassword;
                              });
                            },
                          ),
                          hintStyle: const TextStyle(fontSize: 15),
                          hintText: "Enter Your Password",
                          labelText: "Password",
                          labelStyle: const TextStyle(
                              fontSize: 15,
                              fontWeight: FontWeight.w600,
                              color: Colors.pink),
                        ),
                        keyboardType: TextInputType.emailAddress,
                      ),
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        TextButton(
                          onPressed: () {},
                          child: const Text(
                            "Forgot Password?",
                            style: TextStyle(fontSize: 14, color: Colors.red),
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    ElevatedButton(
                        style: ElevatedButton.styleFrom(
                            padding: const EdgeInsets.symmetric(
                                horizontal: 120, vertical: 15)),
                        onPressed: _handleSignin,
                        child: const Text(
                          "Sign in",
                          style: TextStyle(
                              fontWeight: FontWeight.bold,
                              fontSize: 15,
                              color: Colors.pink),
                        )),
                    const SizedBox(
                      height: 20,
                    ),
                    const Text(
                      "or use one of your social profiles",
                      style:
                          TextStyle(fontSize: 15, fontWeight: FontWeight.bold),
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    Row(
                      children: [
                        Expanded(
                          flex: 1,
                          child: ElevatedButton.icon(
                              style: ElevatedButton.styleFrom(
                                  backgroundColor:
                                      const Color.fromARGB(255, 29, 161, 242),
                                  padding:
                                      const EdgeInsets.symmetric(vertical: 15)),
                              onPressed: () {},
                              icon: const Icon(
                                Icons.email_outlined,
                                color: Colors.white,
                              ),
                              label: const Text(
                                "Google",
                                style: TextStyle(
                                    fontWeight: FontWeight.bold,
                                    fontSize: 15,
                                    color: Colors.white),
                              )),
                        ),
                        const SizedBox(
                          width: 15,
                        ),
                        Expanded(
                          flex: 1,
                          child: ElevatedButton.icon(
                              style: ElevatedButton.styleFrom(
                                  backgroundColor:
                                      const Color.fromARGB(255, 59, 89, 152),
                                  padding:
                                      const EdgeInsets.symmetric(vertical: 15)),
                              onPressed: () {},
                              icon: const Icon(
                                Icons.facebook,
                                color: Colors.white,
                              ),
                              label: const Text(
                                "Sign in",
                                style: TextStyle(
                                    fontWeight: FontWeight.bold,
                                    fontSize: 15,
                                    color: Colors.white),
                              )),
                        )
                      ],
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        const Text(
                          "Create your account!",
                          style: TextStyle(
                              fontWeight: FontWeight.w500, fontSize: 17),
                        ),
                        TextButton(
                            onPressed: () {
                              Navigator.push(
                                  context,
                                  PageRouteBuilder(
                                      transitionDuration:
                                          const Duration(milliseconds: 800),
                                      transitionsBuilder: (_, a, __, c) =>
                                          FadeTransition(opacity: a, child: c),
                                      pageBuilder: (_, __, ___) =>
                                          const Material(
                                              child: SignupScreen())));
                            },
                            child: const Text(
                              "Sign Up",
                              style: TextStyle(
                                fontSize: 17,
                                color: Colors.pink,
                              ),
                            )),
                      ],
                    )
                  ],
                ),
              ),
            ]),
          ),
        )));
  }

  void _handleSignin() async {
    try {
      await Auth().SignInWithEmailandpassword(
          emailContoller.text, passwordController.text);
      if (Auth().auth.currentUser != null) {
        Navigator.push(
            context, MaterialPageRoute(builder: (context) => Homescreen()));
      }
    } catch (e) {
      print(e.toString());
      SnackBarFunction();
    }
  }

  void SnackBarFunction() {
    String msg = "Please enter a valid Email or password";
    Color color = Colors.red;

    final snackBar = SnackBar(
      backgroundColor: Colors.transparent,
      elevation: 0,
      content: Container(
          padding: const EdgeInsets.all(8),
          decoration: BoxDecoration(
            color: color,
            border: Border.all(color: color, width: 3),
            boxShadow: const [
              BoxShadow(
                color: Color(0x19000000),
                spreadRadius: 2.0,
                blurRadius: 8.0,
                offset: Offset(2, 4),
              )
            ],
            borderRadius: BorderRadius.circular(4),
          ),
          child: Row(
            children: [
              Icon(Icons.error_outline, color: Colors.white),
              Padding(
                padding: EdgeInsets.only(left: 8.0),
                child: Text(msg, style: TextStyle(color: Colors.white)),
              ),
              const Spacer(),
              TextButton(
                  onPressed: () => debugPrint("Undid"),
                  child: Text(
                    "Undo",
                    style: TextStyle(color: Colors.white),
                  ))
            ],
          )),
    );
    ScaffoldMessenger.of(context).showSnackBar(snackBar);
  }
}
