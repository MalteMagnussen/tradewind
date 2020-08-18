import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:tradewind/app/constants/strings.dart';
import 'package:tradewind/ui/views/authentication/sign_in/sign_in_vew_model.dart';
import 'package:tradewind/ui/views/authentication/sign_in/widgets/google_sign_in_button.dart';

class SignInView extends StatelessWidget {
  const SignInView({Key key, this.drawer}) : super(key: key);

  final Widget drawer;

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider<SignInViewModel>(
      create: (_) => SignInViewModel(context.read),
      builder: (_, child) {
        return Scaffold(
          body: SignInViewBody(drawer: drawer),
        );
      },
    );
  }
}

class SignInViewBody extends StatelessWidget {
  final Widget drawer;
  const SignInViewBody({this.drawer, Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final isLoading =
        context.select((SignInViewModel viewModel) => viewModel.isLoading);
    return Scaffold(
      drawer: drawer,
      appBar: AppBar(
        title: Text('Tradewind'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          mainAxisSize: MainAxisSize.max,
          children: <Widget>[
            Padding(
              padding: const EdgeInsets.all(16),
              child: Text(
                Strings.signInMessage,
                style: Theme.of(context).textTheme.headline4,
              ),
            ),
            Expanded(
              child: isLoading ? _loadingIndicator() : _signInButtons(context),
            ),
          ],
        ),
      ),
    );
  }

  Center _loadingIndicator() {
    return const Center(
      child: CircularProgressIndicator(),
    );
  }

  Widget _signInButtons(BuildContext context) {
    return Center(child: GoogleSignInButton());
  }
}
