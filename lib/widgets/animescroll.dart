import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

class AnimeScroll extends StatefulWidget {
  final Function(String) addToFavorites; // Add this parameter

  const AnimeScroll({Key? key, required this.addToFavorites}) : super(key: key);

  @override
  State<AnimeScroll> createState() => _AnimeScrollState();
}

class _AnimeScrollState extends State<AnimeScroll> {
  final PageController _controller = PageController();

  List<String> _favoriteList = [];

  Future<List<String>> fetchWallpapers() async {
    final response = await http.get(Uri.parse('https://wallhaven.cc/api/v1/search?q=lain'));
    if (response.statusCode == 200) {
      final data = json.decode(response.body);
      List<String> wallpaperUrls = [];
      for (var wallpaper in data['data']) {
        wallpaperUrls.add(wallpaper['path']);
      }
      return wallpaperUrls;
    } else {
      throw Exception('Failed to load wallpapers');
    }
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: FutureBuilder<List<String>>(
        future: fetchWallpapers(),
        builder: (context, snapshot) {
          if (snapshot.hasData) {
            return PageView.builder(
              controller: _controller,
              itemCount: snapshot.data!.length,
              scrollDirection: Axis.vertical,
              itemBuilder: (BuildContext context, int index) {
                bool isFavorite = _favoriteList.contains(snapshot.data![index]);
                return Stack(
                  children: [
                    Container(
                      decoration: BoxDecoration(
                        image: DecorationImage(
                          image: NetworkImage(snapshot.data![index]),
                          fit: BoxFit.cover,
                        ),
                      ),
                    ),
                    Positioned(
                      bottom: 16,
                      right: 16,
                      child: Theme(
                        data: ThemeData(
                          floatingActionButtonTheme: FloatingActionButtonThemeData(
                            backgroundColor: Colors.red,
                          ),
                          iconTheme: IconThemeData(
                            color: Colors.black,
                          ),
                        ),
                        child: FloatingActionButton(
                          onPressed: () {
                            String currentImageUrl = snapshot.data![index];
                            if (isFavorite) {
                              setState(() {
                                _favoriteList.remove(currentImageUrl);
                                isFavorite = false;
                              });
                            } else {
                              setState(() {
                                _favoriteList.add(currentImageUrl);
                                isFavorite = true;
                              });
                              widget.addToFavorites(currentImageUrl);
                              ScaffoldMessenger.of(context).showSnackBar(
                                SnackBar(
                                  content: Text('Added to favorites!'),
                                  duration: const Duration(seconds: 1),
                                  behavior: SnackBarBehavior.floating,
                                  margin: const EdgeInsets.all(10),
                                  elevation: 5,
                                  backgroundColor: Colors.red,
                                  action: SnackBarAction(
                                    label: 'Dismiss',
                                    textColor: Colors.white,
                                    onPressed: () {
                                      ScaffoldMessenger.of(context).hideCurrentSnackBar();
                                    },
                                  ),
                                ),
                              );
                            }
                          },
                          child: Icon(
                            isFavorite ? Icons.favorite : Icons.favorite_border,
                            color: isFavorite ? Colors.black : Colors.white,
                          ),
                        ),
                      ),
                    ),
                  ],
                );
              },
            );
          } else if (snapshot.hasError) {
            return Center(
              child: Text('Failed to load wallpapers'),
            );
          } else {
            return Center(
              child: CircularProgressIndicator(),
            );
          }
        },
      ),
    );
  }
}
