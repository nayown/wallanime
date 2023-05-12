import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:hackanime/screens/welcome.dart';
import 'firebase_options.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );

  runApp(MaterialApp(
    title: "HackAnime",
    theme: ThemeData.dark(),
    darkTheme: ThemeData.dark(),
    home: const Welcome(),
    debugShowCheckedModeBanner: false, // Add this line to remove the debug banner
  ));
}