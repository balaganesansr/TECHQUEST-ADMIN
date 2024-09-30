import 'package:flutter/material.dart';
import 'package:quiz_admin/drawer.dart';
import 'package:firebase_core/firebase_core.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
      options: const FirebaseOptions(
          apiKey: "AIzaSyDddq8H764OT6MxhKSG4I1BZdFQXfiBvNI",
          authDomain: "quiz-23-f8423.firebaseapp.com",
          projectId: "quiz-23-f8423",
          storageBucket: "quiz-23-f8423.appspot.com",
          messagingSenderId: "289637567822",
          appId: "1:289637567822:web:ec6c253a0343d9fd72221f"));
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      title: 'Flutter Demo',
      home: drawer(),
      debugShowCheckedModeBanner: false,
    );
  }
}
