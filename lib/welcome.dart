import 'package:flutter/material.dart';

class Welcome extends StatelessWidget {
  const Welcome({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text(
              'AnimeScroll',
              style: TextStyle(
                  color: Colors.red,
                  fontSize: 24,
                  fontWeight: FontWeight.bold),
            ),
            Image(image: AssetImage('assets/images/hellsing.jpg'),  width: 400,),
            SizedBox(
              height: 20,
            ),
            Padding(
              padding: EdgeInsets.only(),
              child: Text(
                'Never run out of new anime to watch because every time you scroll through the app, a brand new anime suggestion will appear.',
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 16,
                ),
                textAlign: TextAlign.center,
              ),
            ),
            const SizedBox(
              height: 30,
            ),
            ElevatedButton(onPressed: () {}, child: Text("Get Started"), style: ElevatedButton.styleFrom(backgroundColor: Colors.red, padding: EdgeInsets.only(left: 40, right: 40))),
          ],
        ),
      ),
    );
  }
}
