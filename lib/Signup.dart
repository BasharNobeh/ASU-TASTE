import 'package:flutter/material.dart';
import 'package:flutter_application_1/LoginScreen.dart';
import 'package:flutter_application_1/main.dart';
import 'package:google_fonts/google_fonts.dart';

class SignupScreen extends StatefulWidget {
  const SignupScreen({super.key});

  @override
  State<SignupScreen> createState() => _TasteSignUpPageState();
}

class _TasteSignUpPageState extends State<SignupScreen> {
  var obscureTexthowPassword = true;
  var passwordIsTapped = false;
  var passowrdIsValid = false;
  FocusNode focusNode = FocusNode();
  var checkBoxValue = false;

  var passwordController = TextEditingController();
  var emailContoller = TextEditingController();
  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
    passwordController.dispose();
    emailContoller.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: null,
      body: Container(
          margin: const EdgeInsets.only(top: 120, right: 30, left: 30),
          padding: const EdgeInsets.all(15),
          width: double.infinity,
          child: SingleChildScrollView(
            child: Column(children: [
              const ImageIcon(AssetImage("lib/images/LogoIconNbg.png"),
                  size: 120, color: Colors.pink),
              Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  const Text(
                    "Welcome to",
                    style: TextStyle(
                      fontSize: 18,
                    ),
                  ),
                  Text(
                    "Taste",
                    style: GoogleFonts.tangerine(
                      color: const Color.fromARGB(255, 248, 95, 106),
                      fontSize: 50,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ],
              ),
              const Align(
                alignment: Alignment.centerLeft,
                child: Text(
                  "Join Us Today for Exclusive Benefits!",
                  style: TextStyle(
                    fontSize: 18,
                  ),
                ),
              ),
              TextFormField(
                style: const TextStyle(fontWeight: FontWeight.bold),
                controller: emailContoller,
                decoration: const InputDecoration(
                    floatingLabelStyle: TextStyle(fontSize: 20),
                    labelText: "Email",
                    hintStyle: TextStyle(fontSize: 12),
                    hintText: "Please Enter A Valid Email.",
                    labelStyle: TextStyle(
                        fontSize: 15,
                        fontWeight: FontWeight.w600,
                        color: Colors.pink)),
                keyboardType: TextInputType.emailAddress,
              ),
              const SizedBox(
                height: 10,
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
                          obscureTexthowPassword = !obscureTexthowPassword;
                        });
                      },
                    ),
                    hintStyle: const TextStyle(fontSize: 15),
                    hintText: "Follow The rules down Below",
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
                height: 15,
              ),
              const SizedBox(
                height: 30,
              ),
              ListTile(
                leading: Checkbox(
                  activeColor: Colors.pink,
                  value: checkBoxValue,
                  onChanged: (value) => setState(() {
                    checkBoxValue = value!;
                  }),
                ),
                title: const Text(
                  "I agree to the Terms of Service and Privacy Policy",
                  style: TextStyle(fontSize: 15),
                  textAlign: TextAlign.left,
                ),
              ),
              const SizedBox(
                height: 20,
              ),
              ElevatedButton(
                  style: ElevatedButton.styleFrom(
                      padding: const EdgeInsets.symmetric(
                          horizontal: 120, vertical: 15)),
                  onPressed: _handleSignup,
                  child: const Text(
                    "Sign up",
                    style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 15,
                        color: Colors.pink),
                  )),
              const SizedBox(
                height: 20,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const Text(
                    "Have an account?",
                    style: TextStyle(fontWeight: FontWeight.w500, fontSize: 17),
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
                                    const Material(child: LoginScreen())));
                      },
                      child: const Text(
                        "Sign In",
                        style: TextStyle(
                          fontSize: 17,
                          color: Colors.pink,
                        ),
                      ))
                ],
              )
            ]),
          )),
    );
  }

  void _handleSignup() async {
    try {
      await Auth()
          .SignUpWithEmailandpassword(
              emailContoller.text, passwordController.text)
          .catchError((value) => SnackBarFunction(
                value.toString(),
              ));
    } catch (e) {
      print(e.toString());
    }
  }

  void SnackBarFunction(String text) {
    String msg = "";

    Color color = const Color.fromARGB(255, 232, 203, 14);

    if (!checkBoxValue) {
      msg = "Please Accept the Terms of Service and Privacy Policy ";
    }

    if (text ==
        "[firebase_auth/invalid-email] The email address is badly formatted.") {
      msg = "Please enter a valid email!";
      color = Colors.red;
    } else if (text ==
        "[firebase_auth/weak-password] Password should be at least 6 characters") {
      msg = "Please enter a valid Password!";
      color = Colors.red;
    } else if (text ==
        "[firebase_auth/email-already-in-use] The email address is already in use by another account.") {
      msg = "The email address is already in use by another account.";
      color = const Color.fromARGB(255, 232, 203, 14);
    }

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
              const Icon(Icons.error_outline, color: Colors.white),
              Padding(
                padding: const EdgeInsets.only(left: 8.0),
                child: Text(msg, style: const TextStyle(color: Colors.white)),
              ),
              const Spacer(),
              TextButton(
                  onPressed: () => debugPrint("Undid"),
                  child: const Text(
                    "Undo",
                    style: TextStyle(color: Colors.white),
                  ))
            ],
          )),
    );
    ScaffoldMessenger.of(context).showSnackBar(snackBar);
  }
}
