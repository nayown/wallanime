import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:hackanime/screens/home.dart';
import 'package:hackanime/screens/login.dart';


class AuthAccount extends StatelessWidget {
  const AuthAccount({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: StreamBuilder<User?>(
        stream: FirebaseAuth.instance.authStateChanges(),
        builder: (context, snapshot) {
          if(snapshot.hasData) {
            return const Home();
          } else {
            return Login();
          }
        },
      )
    );
  }
  }
