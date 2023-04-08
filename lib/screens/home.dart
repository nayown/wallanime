import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

import 'package:hackanime/widgets/animescroll.dart';

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      appBar: AppBar(title: const Text("AnimeScroller", style: TextStyle(color: Colors.red),), automaticallyImplyLeading: false, backgroundColor: Colors.black,),
      //Insert Main Content Scroll Feature
      body: const AnimeScroll(), 
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