import 'package:flutter/material.dart';

class FavoriteList extends StatelessWidget {
  final List<String> favorites;

  const FavoriteList({Key? key, required this.favorites}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: favorites.isEmpty
          ? Center(
              child: Text('No favorites yet.'),
            )
          : GridView.count(
              crossAxisCount: 2,
              crossAxisSpacing: 4.0,
              mainAxisSpacing: 4.0,
              children: favorites
                  .map((imageUrl) => GestureDetector(
                        child: Image.network(
                          imageUrl,
                          fit: BoxFit.cover,
                        ),
                      ))
                  .toList(),
            ),
    );
  }
}
