import 'package:flutter/material.dart';

class AnimeScroll extends StatefulWidget {
  const AnimeScroll({super.key});

  @override
  State<AnimeScroll> createState() => _AnimeScrollState();
}

class _AnimeScrollState extends State<AnimeScroll> {
  @override
  Widget build(BuildContext context) {
    return PageView(
        scrollDirection: Axis.vertical,
        controller: PageController(),
        children: <Widget>[
            Column(
              children: [
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 20),
                  child: Row( mainAxisAlignment: MainAxisAlignment.center,
                    children: const [
                      Text("Anime Title", style: TextStyle(fontSize: 16, fontWeight: FontWeight.w500)),
                      
                    ],
                  ),
                ),
              ],
            ),
      ],
      );
  }
}


