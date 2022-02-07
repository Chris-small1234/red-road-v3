import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:email_validator/email_validator.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:fluttertoast/fluttertoast.dart';
import '../util/constants.dart';

class ResetPassword extends StatefulWidget {
  @override
  _ResetPasswordState createState() => _ResetPasswordState();
}

class _ResetPasswordState extends State<ResetPassword> {
  final TextEditingController _email = TextEditingController();
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
//                    style: TextStyle(color: Colors.white),
                      controller: _email,
                      validator: (v) {
                        if (v != null && v.length == 0) {
                          return "Please Enter Email";
                        }
                        if (!EmailValidator.validate(_email.text)) {
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
                    height: _size.height / 55,
                  ),
                  InkWell(
                    onTap: () {
                      if (_formKey.currentState!.validate()) resetPassword();
                    },
                    child: Container(
                      width: _size.width / 2,
                      padding: EdgeInsets.only(
                          left: 8, right: 8, top: 12, bottom: 12),
                      child: Center(
                        child: Text(
                          "Reset Password",
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
                          TextSpan(text: "Go back to "),
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

  Future<void> resetPassword() async {
    try {
      buildShowDialog(context);
      await FirebaseAuth.instance.sendPasswordResetEmail(email: _email.text);
      Fluttertoast.showToast(
          msg: "Please check your email",
          toastLength: Toast.LENGTH_SHORT,
          gravity: ToastGravity.CENTER,
          timeInSecForIosWeb: 1,
          textColor: Colors.grey,
          fontSize: 16.0);
      Navigator.pushReplacementNamed(context, '/login');
    } catch (e) {
      Fluttertoast.showToast(
          msg: "No user corresponding to the email address.",
          toastLength: Toast.LENGTH_SHORT,
          gravity: ToastGravity.CENTER,
          timeInSecForIosWeb: 1,
          textColor: Colors.grey,
          fontSize: 16.0);
      Navigator.pop(context);
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
    super.dispose();
  }
}
