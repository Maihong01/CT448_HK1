import 'package:appfood/page/home/home_page.dart';
import 'package:appfood/page/login/components/login_auth_provider.dart';
import 'package:appfood/page/signup/components/signup_auth_provider.dart';
import 'package:appfood/page/signup/signup_page.dart';
import 'package:appfood/page/welcome/welcome_page.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:firebase_core/firebase_core.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(
          create: (context) => SignupAuthProvider(),
        ),
        ChangeNotifierProvider(
          create: (context) => LoginAuthProvider(),
        ),
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Food App',
        theme: ThemeData(
          appBarTheme: AppBarTheme(
              iconTheme: IconThemeData(
            color: Colors.black,
          )),
          primarySwatch: Colors.blue,
        ),
        home: StreamBuilder(
          stream: FirebaseAuth.instance.authStateChanges(),
          builder: (context, userSnp) {
            if (userSnp.hasData) {
              return HomePage();
            }
            return WelcomePage();
          },
        ),
        // home: SignupPage(),
      ),
    );
  }
}
