import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:hackanime/welcome.dart';
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
      ),
    );
}

class Homepage extends StatelessWidget {
  const Homepage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: TextButton(
          onPressed: () async {
            Future; {
              WidgetsFlutterBinding.ensureInitialized();
              await Firebase.initializeApp();
              await FirebaseAuth.instance.useAuthEmulator('localhost', 9099);
            }
          }, 
            child: const Text('Register')),
      ), 
    );
      
  }
}