import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:tradewind/app/services/firebase_auth_service.dart';
import 'file:///D:/tradewind/lib/ui/views/navigation/sidemenu.dart';
import 'file:///D:/tradewind/lib/ui/views/team.dart';
import 'package:tradewind/ui/views/authentication/sign_in/sign_in_view.dart';
import 'package:tradewind/ui/views/authentication/sign_out/widgets/sign_out_button.dart';
import 'ui/views/homepage.dart';

void main() => runApp(
      /// Inject the [FirebaseAuthService]
      /// and provide a stream of [User]
      ///
      /// This needs to be above [MaterialApp]
      /// At the top of the widget tree, to
      /// accomodate for navigations in the app
      MultiProvider(
        providers: [
          Provider(
            create: (_) => FirebaseAuthService(),
          ),
          StreamProvider(
            create: (context) =>
                context.read<FirebaseAuthService>().onAuthStateChanged,
          ),
        ],
        child: MyApp(),
      ),
    );

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Tradewind',
      initialRoute: '/',
      routes: <String, WidgetBuilder>{
        '/': (context) {
          return MyHomePage(drawer: Sidemenu());
        },
        '/team': (context) {
          return Team(drawer: Sidemenu());
        },
        '/forecast': (context) {
          return Consumer<User>(
            builder: (context, user, child) {
              return user != null ? SignOutButton() : SignInView();
            },
          );
        }
      },
      theme: ThemeData(
        primaryColor: Color(0xff3F51B5),
        primaryColorDark: Color(0xff303F9F),
        primaryColorLight: Color(0xffC5CAE9),
        accentColor: Color(0xff03A9F4),
        primaryTextTheme: Typography.whiteMountainView,
        dividerColor: Color(0xffBDBDBD),
        secondaryHeaderColor: Color(0xff757575),
        // This is the theme of your application.
        //
        // Try running your application with "flutter run". You'll see the
        // application has a blue toolbar. Then, without quitting the app, try
        // changing the primarySwatch below to Colors.green and then invoke
        // "hot reload" (press "r" in the console where you ran "flutter run",
        // or simply save your changes to "hot reload" in a Flutter IDE).
        // Notice that the counter didn't reset back to zero; the application
        // is not restarted.
        primarySwatch: Colors.blue,
        // This makes the visual density adapt to the platform that you run
        // the app on. For desktop platforms, the controls will be smaller and
        // closer together (more dense) than on mobile platforms.
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      debugShowCheckedModeBanner: false,
    );
  }
}
