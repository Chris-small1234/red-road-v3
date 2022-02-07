import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:email_validator/email_validator.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:fluttertoast/fluttertoast.dart';
import '../util/constants.dart';

class LoginScreen extends StatefulWidget {
  @override
  _LoginScreenState createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final TextEditingController _email = TextEditingController();
  final TextEditingController _password = TextEditingController();
  bool _obscureText = true;
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    final _size = MediaQuery.of(context).size;
    return Scaffold(
      body: Stack(
        children: [
          Form(
            key: _formKey,
            child: Center(
              child: ListView(
                shrinkWrap: true,
                padding: EdgeInsets.symmetric(horizontal: _size.width / 10),
                children: [
                  Center(
                      child: Text(
                    APP_NAME,
                    style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
                  )),
                  SizedBox(
                    height: _size.height / 22,
                  ),
                  Container(
                    width: _size.width / 1.5,
                    child: TextFormField(
                      controller: _email,
                      validator: (v) {
                        if (v != null && v.length == 0) {
                          return "Please Enter Email";
                        }
                        if (!EmailValidator.validate(_email.text.trim())) {
                          return "Email isn't valid";
                        }
                        return null;
                      },
                      decoration: InputDecoration(
                        labelText: "Email",
                        focusedBorder: OutlineInputBorder(
                          borderSide:
                              const BorderSide(color: Colors.grey, width: 2.0),
                          borderRadius: BorderRadius.circular(5.0),
                        ),
                        enabledBorder: OutlineInputBorder(
                          borderSide:
                              const BorderSide(color: Colors.grey, width: 2.0),
                          borderRadius: BorderRadius.circular(5.0),
                        ),
                        labelStyle: TextStyle(color: Colors.black45),
                        hintStyle: TextStyle(color: Colors.black45),
                      ),
                    ),
                  ),
                  SizedBox(
                    height: _size.height / 33,
                  ),
                  Container(
                    width: _size.width / 1.5,
                    child: TextFormField(
                      controller: _password,
                      obscureText: _obscureText,
                      validator: (v) {
                        if (v != null && v.length == 0) {
                          return "Please Enter Password";
                        }

                        return null;
                      },
                      decoration: InputDecoration(
                        labelText: "Password",
                        focusedBorder: OutlineInputBorder(
                          borderSide:
                              const BorderSide(color: Colors.grey, width: 2.0),
                          borderRadius: BorderRadius.circular(5.0),
                        ),
                        enabledBorder: OutlineInputBorder(
                          borderSide:
                              const BorderSide(color: Colors.grey, width: 2.0),
                          borderRadius: BorderRadius.circular(5.0),
                        ),
                        suffixIcon: IconButton(
                          icon: Icon(
                            _obscureText
                                ? Icons.visibility
                                : Icons.visibility_off,
                          ),
                          onPressed: () {
                            setState(() {
                              _obscureText = !_obscureText;
                            });
                          },
                        ),
                        labelStyle: TextStyle(color: Colors.black45),
                        hintStyle: TextStyle(color: Colors.black45),
                      ),
                    ),
                  ),
                  SizedBox(
                    height: _size.height / 55,
                  ),
                  InkWell(
                    onTap: () {
                      if (_formKey.currentState!.validate()) login();
                    },
                    child: Container(
                      width: _size.width / 2,
                      padding: EdgeInsets.only(
                          left: 8, right: 8, top: 12, bottom: 12),
                      child: Center(
                        child: Text(
                          "Login",
                          style: TextStyle(
                              color: Colors.white, fontWeight: FontWeight.bold),
                        ),
                      ),
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(5),
                          color: Colors.blue,
                          border: Border.all(color: Colors.blue)),
                    ),
                  ),
                  SizedBox(
                    height: _size.height / 55,
                  ),
                  Center(
                    child: RichText(
                      text: TextSpan(
                        style: TextStyle(color: Colors.grey),
                        children: <TextSpan>[
                          TextSpan(text: "Forget password? "),
                          TextSpan(
                              text: "Reset your password",
                              style: TextStyle(color: Colors.blue),
                              recognizer: TapGestureRecognizer()
                                ..onTap = () {
                                  Navigator.pushNamed(
                                      context, '/resetPassword');
                                }),
                        ],
                      ),
                    ),
                  ),
                  SizedBox(
                    height: _size.height / 55,
                  ),
                  Center(
                    child: RichText(
                      text: TextSpan(
                        style: TextStyle(color: Colors.grey),
                        children: <TextSpan>[
                          TextSpan(text: "You don't have an account? "),
                          TextSpan(
                              text: "Sign up",
                              style: TextStyle(color: Colors.blue),
                              recognizer: TapGestureRecognizer()
                                ..onTap = () {
                                  Navigator.pushReplacementNamed(
                                      context, '/SignUp');
                                }),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }

  void login() async {
    try {
      buildShowDialog(context);

      UserCredential userCredential = await FirebaseAuth.instance
          .signInWithEmailAndPassword(
              email: _email.text.trim(), password: _password.text.trim());
      Navigator.pop(context);
      Navigator.pushReplacementNamed(context, "/home");
    } on FirebaseAuthException catch (e) {
      if (e.code == 'user-not-found') {
        Fluttertoast.showToast(
            msg: "No user found for that email.",
            toastLength: Toast.LENGTH_SHORT,
            gravity: ToastGravity.CENTER,
            timeInSecForIosWeb: 1,
            textColor: Colors.grey,
            fontSize: 16.0);
        Navigator.pop(context);
      } else if (e.code == 'wrong-password') {
        Fluttertoast.showToast(
            msg: "Wrong password provided for that user.",
            toastLength: Toast.LENGTH_SHORT,
            gravity: ToastGravity.CENTER,
            timeInSecForIosWeb: 1,
            textColor: Colors.grey,
            fontSize: 16.0);
        Navigator.pop(context);
      }
    }
  }

  buildShowDialog(BuildContext context) {
    return showDialog(
        context: context,
        barrierDismissible: false,
        builder: (BuildContext context) {
          return Center(
            child: CircularProgressIndicator(),
          );
        });
  }

  @override
  void dispose() {
    _email.dispose();
    _password.dispose();
    super.dispose();
  }
}
