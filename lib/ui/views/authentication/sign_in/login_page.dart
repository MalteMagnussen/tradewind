import 'package:flutter/material.dart';
import 'package:tradewind/app/constants/colors.dart';
import 'package:tradewind/app/constants/strings.dart';
import 'package:tradewind/app/services/firebase_auth_service.dart';
import 'package:tradewind/utility/loading.dart';

class LoginPage extends StatefulWidget {
  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  String email, password, error;
  bool loading = false;

  final formKey = new GlobalKey<FormState>();

  void snackBar(String text, TextStyle style) {
    Scaffold.of(context).hideCurrentSnackBar();
    Scaffold.of(context).showSnackBar(
      SnackBar(
        content: Text(
          text,
          style: style,
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: <Widget>[
        Image.network(
          "https://i.imgur.com/e230NDK.jpg",
          height: MediaQuery.of(context).size.height,
          width: MediaQuery.of(context).size.width,
          fit: BoxFit.cover,
        ),
        loading
            ? Loading()
            : Center(
                child: Container(
                  height: 300.0,
                  width: 400.0,
                  child: Column(
                    children: <Widget>[
                      Form(
                        key: formKey,
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: <Widget>[
                            if (error != null)
                              Text(
                                error,
                                style: TextStyle(
                                  color: Colors.red,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                            Padding(
                                padding: EdgeInsets.only(
                                    left: 25.0,
                                    right: 25.0,
                                    top: 20.0,
                                    bottom: 5.0),
                                child: Container(
                                  child: TextFormField(
                                    keyboardType: TextInputType.emailAddress,
                                    cursorColor: TradewindColors.primaryColor,
                                    autofocus: true,
                                    decoration: buildInputDecoration('Email'),
                                    validator: (value) {
                                      if (value.isEmpty) {
                                        return 'Email is required';
                                      } else {
                                        String validateEmail(String value) {
                                          Pattern pattern =
                                              r'^(([^<>()[\]\\.,;:\s@\"]+(\.[^<>()[\]\\.,;:\s@\"]+)*)|(\".+\"))@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\])|(([a-zA-Z\-0-9]+\.)+[a-zA-Z]{2,}))$';
                                          RegExp regex = new RegExp(pattern);
                                          if (!regex.hasMatch(value))
                                            return 'Enter Valid Email';
                                          else
                                            return null;
                                        }

                                        return validateEmail(value.trim());
                                      }
                                    },
                                    onChanged: (value) {
                                      this.email = value;
                                    },
                                  ),
                                )),
                            Padding(
                              padding: EdgeInsets.only(
                                left: 25.0,
                                right: 25.0,
                                top: 20.0,
                                bottom: 5.0,
                              ),
                              child: Container(
                                child: TextFormField(
                                  onEditingComplete: () async {
                                    checkFields() {
                                      final form = formKey.currentState;
                                      if (form.validate()) {
                                        return true;
                                      } else {
                                        return false;
                                      }
                                    }

                                    if (checkFields()) {
                                      snackBar(
                                        'Processing Login',
                                        TextStyle(color: Colors.white),
                                      );
                                      setState(() {
                                        loading = true;
                                      });

                                      var status = await AuthService()
                                          .signIn(email, password);

                                      if (AuthService().isSignedIn() == false) {
                                        setState(() {
                                          loading = false;
                                          error = status;
                                        });
                                        snackBar(
                                          status,
                                          TextStyle(color: Colors.red),
                                        );
                                      } else {
                                        setState(() {
                                          loading = false;
                                        });
                                        snackBar(
                                          'Logged in! Welcome.',
                                          TextStyle(color: Colors.green),
                                        );
                                      }
                                    } else {
                                      setState(() {
                                        loading = false;
                                      });
                                    }
                                  },
                                  obscureText: true,
                                  decoration: buildInputDecoration('Password'),
                                  validator: (value) => value.isEmpty
                                      ? TradewindStrings.passwordRequired
                                      : null,
                                  onChanged: (value) {
                                    this.password = value;
                                  },
                                ),
                              ),
                            ),
                            SizedBox(height: 20),
                            RaisedButton(
                              padding: EdgeInsets.all(10),
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(20.0),
                              ),
                              color: Theme.of(context).colorScheme.secondary,
                              onPressed: () async {
                                checkFields() {
                                  final form = formKey.currentState;
                                  if (form.validate()) {
                                    return true;
                                  } else {
                                    return false;
                                  }
                                }

                                if (checkFields()) {
                                  snackBar(
                                    'Processing Login',
                                    TextStyle(color: Colors.white),
                                  );

                                  var status = await AuthService()
                                      .signIn(email, password);

                                  if (AuthService().isSignedIn() == false) {
                                    setState(() {
                                      error = status;
                                    });
                                    snackBar(
                                      status,
                                      TextStyle(color: Colors.red),
                                    );
                                  } else {
                                    snackBar(
                                      'Logged in! Welcome.',
                                      TextStyle(color: Colors.green),
                                    );
                                  }
                                } else {}
                              },
                              child: Text(
                                'Sign in',
                                style: Theme.of(context).textTheme.button.merge(
                                      TextStyle(
                                        fontSize: 16,
                                        color: Colors.white,
                                      ),
                                    ),
                              ),
                            ),
                          ],
                        ),
                      )
                    ],
                  ),
                ),
              ),
      ],
    );
  }

  InputDecoration buildInputDecoration(String hintText) {
    return InputDecoration(
      contentPadding: EdgeInsets.symmetric(vertical: 15.0, horizontal: 15.0),
      hintText: hintText,
      fillColor: Colors.white,
      filled: true,
      enabledBorder: OutlineInputBorder(
        borderSide: BorderSide(
          color: Colors.white,
          width: 2.0,
        ),
      ),
      focusedBorder: OutlineInputBorder(
        borderSide: BorderSide(
          color: TradewindColors.primaryColor,
          width: 2.0,
        ),
      ),
    );
  }
}
