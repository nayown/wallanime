import 'package:flutter/material.dart';
import 'package:flutter_file_downloader/flutter_file_downloader.dart';

class FavoriteList extends StatelessWidget {
  final List<String> favorites;

  const FavoriteList({Key? key, required this.favorites}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: favorites.isEmpty
          ? const Center(
              child: Text('No favorites yet.'),
            )
          : GridView.count(
              crossAxisCount: 2,
              crossAxisSpacing: 4.0,
              mainAxisSpacing: 4.0,
              children: favorites
                  .map((imageUrl) => GestureDetector(
                        onTap: () async {
                          final result = await FileDownloader.downloadFile(url: imageUrl);
                          if (result != null) {
                            ScaffoldMessenger.of(context).showSnackBar(
                              SnackBar(
                                content: Text('Image downloaded successfully!'),
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
