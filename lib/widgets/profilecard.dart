import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:google_sign_in/google_sign_in.dart';


class ProfileCard extends StatefulWidget {
  ProfileCard({Key? key}) : super(key: key);

  @override
  _ProfileCardState createState() => _ProfileCardState();
}

class _ProfileCardState extends State<ProfileCard> {
  final currentUser = FirebaseAuth.instance.currentUser;
  final TextEditingController emailController = TextEditingController();

  void _logout() async {
    await FirebaseAuth.instance.signOut();
  }

    @override
  void initState() {
    super.initState();
    if (FirebaseAuth.instance.currentUser != null) {
      emailController.text = FirebaseAuth.instance.currentUser!.email ?? '';
    } else if (GoogleSignIn().currentUser != null) {
      emailController.text = GoogleSignIn().currentUser!.email;
    }
  }


@override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          Align(
            alignment: Alignment.topCenter,
            child: Container(
              margin: EdgeInsets.only(top: 50.0),
              child: CircleAvatar(
                radius: 100.0,
                backgroundImage: NetworkImage(
                    'https://w.wallhaven.cc/full/8x/wallhaven-8xlpg2.jpg'),
              ),
            ),
          ),
          Container(
            padding: EdgeInsets.all(16.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(height: 260.0),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 20),
                  child: TextField(
                    controller: emailController,
                    style: const TextStyle(color: Colors.black),
                    decoration: InputDecoration(
                      enabledBorder: const OutlineInputBorder(
                        borderSide: BorderSide(color: Colors.grey),
                      ),
                      focusedBorder: const OutlineInputBorder(
                        borderSide: BorderSide(color: Colors.white),
                      ),
                      fillColor: Colors.white,
                      filled: true,
                      hintText: 'Email Address',
                      prefixIcon: const Icon(Icons.email),
                      prefixIconColor: Colors.red,
                      hintStyle: TextStyle(color: Colors.grey[500]),
                    ),
                  ),
                ),
                SizedBox(height: 16.0),
              ],
            ),
          ),
        ],
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: _logout,
        tooltip: 'Sign Out',
        backgroundColor: Colors.red,
        foregroundColor: Colors.white, // Set the background color to red
        child: Icon(Icons.logout),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.endFloat,
    );
  }
}