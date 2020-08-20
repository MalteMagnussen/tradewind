import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter/gestures.dart' show DragStartBehavior;
import 'package:tradewind/app/services/firebase_auth_service.dart';
import 'package:tradewind/components/pill_button.dart';
import 'package:tradewind/ui/views/navigation/appbar.dart';
import 'package:tradewind/ui/views/navigation/sidemenu.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({Key key}) : super(key: key);

  @override
  LoginPageState createState() => LoginPageState();
}

class PersonData {
  String email = '';
  String password = '';
}

class PasswordField extends StatefulWidget {
  const PasswordField({
    this.fieldKey,
    this.hintText,
    this.labelText,
    this.helperText,
    this.onSaved,
    this.validator,
    this.onFieldSubmitted,
  });

  final Key fieldKey;
  final String hintText;
  final String labelText;
  final String helperText;
  final FormFieldSetter<String> onSaved;
  final FormFieldValidator<String> validator;
  final ValueChanged<String> onFieldSubmitted;

  @override
  _PasswordFieldState createState() => _PasswordFieldState();
}

class _PasswordFieldState extends State<PasswordField> {
  bool _obscureText = true;

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      key: widget.fieldKey,
      obscureText: _obscureText,
      cursorColor: Theme.of(context).cursorColor,
      onSaved: widget.onSaved,
      validator: widget.validator,
      onFieldSubmitted: widget.onFieldSubmitted,
      decoration: InputDecoration(
        filled: true,
        hintText: widget.hintText,
        labelText: widget.labelText,
        helperText: widget.helperText,
        suffixIcon: GestureDetector(
          dragStartBehavior: DragStartBehavior.down,
          onTap: () {
            setState(() {
              _obscureText = !_obscureText;
            });
          },
          child: Icon(
            _obscureText ? Icons.visibility : Icons.visibility_off,
          ),
        ),
      ),
    );
  }
}

class LoginPageState extends State<LoginPage> {
  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();

  PersonData person = PersonData();

  void showInSnackBar(String value, {TextStyle style}) {
    _scaffoldKey.currentState.hideCurrentSnackBar();
    if (style != null) {
      _scaffoldKey.currentState.showSnackBar(
        SnackBar(
          content: Text(
            value,
            style: style,
          ),
        ),
      );
    } else {
      _scaffoldKey.currentState.showSnackBar(
        SnackBar(
          content: Text(value),
        ),
      );
    }
  }

  AutovalidateMode _autoValidateMode = AutovalidateMode.disabled;

  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  final GlobalKey<FormFieldState<String>> _passwordFieldKey =
      GlobalKey<FormFieldState<String>>();

  void _handleSubmitted() async {
    final form = _formKey.currentState;
    showInSnackBar('Processing Login.');
    if (!form.validate()) {
      _autoValidateMode =
          AutovalidateMode.always; // Start validating on every change.
    } else {
      form.save();
      var status = await AuthService().signIn(person.email, person.password);
      if (AuthService().isSignedIn() == false) {
        showInSnackBar('Error Logging in!: $status',
            style: TextStyle(color: Colors.red));
      } else {
        showInSnackBar('You\'re logged in!');
      }
    }
  }

  String _validatePassword(String value) {
    final passwordField = _passwordFieldKey.currentState;
    if (passwordField.value == null || passwordField.value.isEmpty) {
      return 'You have to enter your password.';
    }
    return null;
  }

  @override
  Widget build(BuildContext context) {
    final cursorColor = Theme.of(context).cursorColor;
    const sizedBoxSpace = SizedBox(height: 24);

    return Scaffold(
      drawer: Sidemenu(),
      appBar: TradewindAppBar(),
      key: _scaffoldKey,
      body: Center(
        child: Container(
          constraints: BoxConstraints(maxWidth: 600),
          child: Card(
            elevation: 8,
            child: Form(
              key: _formKey,
              autovalidateMode: _autoValidateMode,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  sizedBoxSpace,
                  TextFormField(
                    autofocus: true,
                    cursorColor: cursorColor,
                    decoration: InputDecoration(
                      filled: true,
                      icon: const Icon(Icons.email),
                      hintText: 'Your email address',
                      labelText: 'Email',
                    ),
                    keyboardType: TextInputType.emailAddress,
                    onSaved: (value) {
                      person.email = value;
                    },
                  ),
                  sizedBoxSpace,
                  PasswordField(
                    fieldKey: _passwordFieldKey,
                    labelText: 'Password',
                    validator: _validatePassword,
                    onFieldSubmitted: (value) {
                      setState(() {
                        person.password = value;
                      });
                      _handleSubmitted();
                    },
                  ),
                  sizedBoxSpace,
                  Center(
                    child: TradewindButton(
                      'Log in',
                      () => _handleSubmitted(),
                    ),
                  ),
                  sizedBoxSpace,
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
