import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_fbfirestore_crud/Home_MainPage.dart';
import 'package:firebase_core/firebase_core.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  final Future<FirebaseApp> _initialization = Firebase.initializeApp();

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
      future: _initialization,
      builder: (context, snapshot) {
        if (snapshot.hasError) {
          print("Something went wrong");
        }
        if (snapshot.connectionState == ConnectionState.done) {
          return MaterialApp(
            title: 'EZ NOTES',
            theme: ThemeData(
              primarySwatch: Colors.blue,
            ),
            debugShowCheckedModeBanner: false,
            home: SplashPage(),
          );
        }
        return CircularProgressIndicator();
      },
    );
  }
}

class SplashPage extends StatelessWidget {
  const SplashPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              "EZ NOTES",
              style: TextStyle(
                fontSize: 48.0,
                color: Colors.blue,
              ),
            ),
            SizedBox(height: 20.0),
            ElevatedButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => HomePage()),
                );
              },
              child: Text("Get Started"),
            ),
          ],
        ),
      ),
    );
  }
}
