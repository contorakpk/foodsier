import 'package:flutter/material.dart';
import 'package:foodsier/pages/error_page.dart';
import 'package:foodsier/pages/loading_page.dart';
import 'package:foodsier/pages/welcome_page.dart';
import 'package:firebase_core/firebase_core.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  final Future<FirebaseApp> _initialization = Firebase.initializeApp();

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Foodsier',
      home: FutureBuilder(
        future: _initialization,
        builder: (context, snapshot) {
          if (snapshot.hasError) {
            return ErrorPage();
          }
          if (snapshot.connectionState == ConnectionState.done) {
            return WelcomePage();
          }
          return LoadingPage();
        },
      ),
    );
  }
}
