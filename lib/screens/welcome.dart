import 'package:flutter/material.dart';
import 'package:hackanime/components/auth_account.dart';

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
            const Text(
              'WallAnime',
              style: TextStyle(
                  color: Colors.red, fontSize: 24, fontWeight: FontWeight.bold),
            ),
            const SizedBox(
              height: 10,
            ),
            const Image(
              image: AssetImage('assets/images/hellsing.jpg'),
              width: 400,
            ), // height 600
            const SizedBox(
              height: 40,
            ),
            Padding(
              padding: EdgeInsets.only(),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    'Introducing the WallAnime!',
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 18,
                    ),
                    textAlign: TextAlign.center,
                  ),
                  SizedBox(height: 8),
                  Text(
                    'Endless anime wallpaper suggestions at your fingertips!',
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 16,
                    ),
                    textAlign: TextAlign.center,
                  ),
                ],
              ),
            ),
            const SizedBox(
              height: 40,
            ),
            ElevatedButton(
                onPressed: () {
                  {
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => const AuthAccount()),
                    );
                  }
                },
                style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.red,
                    padding: const EdgeInsets.only(
                        left: 100, right: 100, top: 20, bottom: 20)),
                child: const Text("Get Started"),
              ),
          ],
        ),
      ),
    );
  }
}
