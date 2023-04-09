// Profile Widget
import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';

class ProfileCard extends StatefulWidget {
  ProfileCard({super.key});

  final userEmail = FirebaseAuth.instance.currentUser;

  void logout(){
    FirebaseAuth.instance.signOut();
  }

  @override
  State<ProfileCard> createState() => _ProfileCardState();
}

class _ProfileCardState extends State<ProfileCard> {
  @override
  Widget build(BuildContext context) {
    return const Placeholder();
  }
}


