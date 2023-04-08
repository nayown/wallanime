import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:hackanime/screens/welcome.dart';
import 'firebase_options.dart';

// For Initializing Firebase
void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );

  runApp(MaterialApp(
      title: "HackAnime",
      theme: ThemeData.dark(),
      darkTheme: ThemeData.dark(),
      debugShowCheckedModeBanner: false,
      home: const Welcome(),
      ),
    );
}
