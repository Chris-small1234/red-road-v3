import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:email_validator/email_validator.dart';
import 'package:fluttertoast/fluttertoast.dart';
import '../util/constants.dart';

class SignUpPage extends StatefulWidget {
  @override
  _SignUpPageState createState() => _SignUpPageState();
}

class _SignUpPageState extends State<SignUpPage> {
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
                      if (_formKey.currentState!.validate()) signup();
                    },
                    child: Container(
                      width: _size.width / 2,
                      padding: EdgeInsets.only(
                          left: 8, right: 8, top: 12, bottom: 12),
                      child: Center(
                        child: Text(
                          "Sign Up",
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
                  SizedBox(
                    height: _size.height / 55,
                  ),
                  Center(
                    child: RichText(
                      text: TextSpan(
                        style: TextStyle(color: Colors.grey),
                        children: <TextSpan>[
                          TextSpan(text: "Already have an account? "),
                          TextSpan(
                              text: "Login",
                              style: TextStyle(color: Colors.blue),
                              recognizer: TapGestureRecognizer()
                                ..onTap = () {
                                  Navigator.pushReplacementNamed(
                                      context, '/login');
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

  void signup() async {
    try {
      buildShowDialog(context);
      UserCredential userCredential = await FirebaseAuth.instance
          .createUserWithEmailAndPassword(
              email: _email.text.trim(), password: _password.text.trim());
      User? user = FirebaseAuth.instance.currentUser;
      if (user != null && !user.emailVerified) {
        await user.sendEmailVerification();
        Fluttertoast.showToast(
            msg: "Please Verify your email",
            toastLength: Toast.LENGTH_SHORT,
            gravity: ToastGravity.CENTER,
            timeInSecForIosWeb: 1,
            textColor: Colors.grey,
            fontSize: 16.0);
        Navigator.pop(context);
        Navigator.pushReplacementNamed(context, "/home");
      }
    } on FirebaseAuthException catch (e) {
      if (e.code == 'weak-password') {
        Fluttertoast.showToast(
            msg: "The password provided is too weak.",
            toastLength: Toast.LENGTH_SHORT,
            gravity: ToastGravity.CENTER,
            timeInSecForIosWeb: 1,
            textColor: Colors.grey,
            fontSize: 16.0);
        Navigator.pop(context);
      } else if (e.code == 'email-already-in-use') {
        Fluttertoast.showToast(
            msg: "This email is already associated with an account. Please sign in.",
            toastLength: Toast.LENGTH_SHORT,
            gravity: ToastGravity.CENTER,
            timeInSecForIosWeb: 1,
            textColor: Colors.grey,
            fontSize: 16.0);
        Navigator.pop(context);
      }
    } catch (e) {
      print(e);
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
