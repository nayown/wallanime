import 'package:flutter/material.dart';
import 'package:hackanime/components/auth_account.dart';
import 'package:hackanime/screens/login.dart';

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
              'AnimeScroller',
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
            const Padding(
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
              height: 60,
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
