import 'package:flutter/material.dart';
import 'package:tradewind/app/services/firebase_auth_service.dart';
import 'package:tradewind/ui/views/navigation/appbar.dart';
import 'package:tradewind/ui/views/navigation/sidemenu.dart';

class LoginPage extends StatefulWidget {
  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  String email, password, error;

  final formKey = new GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: Sidemenu(),
      appBar: TradewindAppBar(),
      body: Builder(
        builder: (context) => Center(
          child: Container(
            height: 250.0,
            width: 300.0,
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
                          style: TextStyle(color: Colors.red),
                        ),
                      Padding(
                          padding: EdgeInsets.only(
                              left: 25.0, right: 25.0, top: 20.0, bottom: 5.0),
                          child: Container(
                            height: 50.0,
                            child: TextFormField(
                              decoration: InputDecoration(hintText: 'Email'),
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
                          height: 50.0,
                          child: TextFormField(
                            obscureText: true,
                            decoration: InputDecoration(hintText: 'Password'),
                            validator: (value) =>
                                value.isEmpty ? 'Password is required' : null,
                            onChanged: (value) {
                              this.password = value;
                            },
                          ),
                        ),
                      ),
                      SizedBox(height: 20),
                      RaisedButton(
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
                            Scaffold.of(context).showSnackBar(
                              SnackBar(
                                content: Text('Processing Login'),
                              ),
                            );

                            var status =
                                await AuthService().signIn(email, password);

                            if (AuthService().isSignedIn() == false) {
                              setState(() {
                                error = status;
                              });
                              Scaffold.of(context).showSnackBar(
                                SnackBar(
                                  content: Text(
                                    status,
                                    style: TextStyle(color: Colors.red),
                                  ),
                                ),
                              );
                            } else {
                              Scaffold.of(context).showSnackBar(
                                SnackBar(
                                  content: Text(
                                    'Logged in! Welcome.',
                                    style: TextStyle(color: Colors.green),
                                  ),
                                ),
                              );
                            }
                          } else {}
                        },
                        child: Text(
                          'Sign in',
                          style: Theme.of(context).textTheme.button.merge(
                                TextStyle(
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
      ),
    );
  }
}
