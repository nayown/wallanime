import 'package:flutter/material.dart';
import 'package:hackanime/widgets/animescroll.dart';
import 'package:hackanime/widgets/favoritelist.dart';
import 'package:hackanime/widgets/profilecard.dart';

class Home extends StatefulWidget {
  Home({Key? key}) : super(key: key);

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  int _currentIndex = 0;
  List<String> _favoriteList = [];

  void addToFavorites(String imageData) {
    setState(() {
      _favoriteList.add(imageData);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      appBar: AppBar(
        title: const Text(
          "WallAnime",
          style: TextStyle(color: Colors.red),
        ),
        automaticallyImplyLeading: false,
        backgroundColor: Colors.black,
      ),
      body: IndexedStack(
        index: _currentIndex,
        children: [
          AnimeScroll(addToFavorites: addToFavorites),
          FavoriteList(favorites: _favoriteList),
          ProfileCard(),
        ],
      ),
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _currentIndex,
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
        onTap: (index) {
          setState(() {
            _currentIndex = index;
          });
        },
      ),
    );
  }
}
