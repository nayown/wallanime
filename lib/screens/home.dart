import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:hackanime/widgets/animescroll.dart';

class Home extends StatelessWidget {
  const Home({super.key});

  @override
  
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      appBar: AppBar(title: const Text("AnimeScroller", style: TextStyle(color: Colors.red),), automaticallyImplyLeading: false, backgroundColor: Colors.black,),
      //Insert Main Content Scroll Feature
      body: AnimeScroll(),
      bottomNavigationBar: BottomNavigationBar(
        //showSelectedLabels: false,
        //showUnselectedLabels: false,
        unselectedItemColor: Colors.white,
        selectedItemColor: Colors.red,
        backgroundColor: Colors.black,
        items: const <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: 'Home',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.favorite),
            label: 'Favorites',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.account_circle_rounded),
            label: 'Profile',
          ),
        ],
      ),
    );
  }
}