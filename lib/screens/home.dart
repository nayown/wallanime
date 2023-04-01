import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;


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
      //IInsert Main Content Scroll Feature
      body: PageView(
        scrollDirection: Axis.vertical,
        controller: PageController(),
        children: const <Widget>[
        Center(
          child: Text('First Page'),
        ),
        Center(
          child: Text('Second Page'),
        ),
        Center(
          child: Text('Third Page'),
        ),
      ],
        
      ),
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