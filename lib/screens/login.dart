import 'package:flutter/material.dart';
import 'package:hackanime/components/login_button.dart';
import 'package:hackanime/screens/register.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:hackanime/screens/home.dart';


class Login extends StatefulWidget {
  const Login({super.key});

  @override
  State<Login> createState() => _LoginState();
}

class _LoginState extends State<Login> {
  final emailController = TextEditingController();
  final passwordController = TextEditingController();
  final GoogleSignIn _googleSignIn = GoogleSignIn();


  void showError(String message) {
    showDialog(
        context: context,
        builder: (context) {
          return AlertDialog(
            backgroundColor: Colors.black,
            title: Text(message));
        });
  }

  void loginUser() async {
  showDialog(
    context: context,
    builder: (context) {
      return const Center(
        child: CircularProgressIndicator(),
      );
    }
  );

  try {
    await FirebaseAuth.instance.signInWithEmailAndPassword(
      email: emailController.text, 
      password: passwordController.text
    ).timeout(const Duration(seconds: 10)); // add a timeout of 10 seconds
    Navigator.pop(context); // remove the progress indicator
  } on FirebaseAuthException catch (e) {
    Navigator.pop(context);
    showError(e.code);
  } catch (e) {
    Navigator.pop(context);
    showError("An error occurred while logging in. Please try again.");
  }
}

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.black,
        body: SafeArea(
          child: Center(
            child: Column(
              children: [
                //const Image(image: AssetImage('assets/images/alucard.gif'),  width: 600,),
                const SizedBox(
                  height: 200,
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 20),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: const [
                      Text(
                        'Login Account',
                        style: TextStyle(color: Colors.red, fontSize: 20),
                      ),
                    ],
                  ),
                ),
                const SizedBox(
                  height: 20,
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 20),
                  child: TextField(
                    controller: emailController,
                    style: const TextStyle(color: Colors.black),
                    decoration: InputDecoration(
                        enabledBorder: const OutlineInputBorder(
                          borderSide: BorderSide(color: Colors.grey),
                        ),
                        focusedBorder: const OutlineInputBorder(
                          borderSide: BorderSide(color: Colors.white),
                        ),
                        fillColor: Colors.white,
                        filled: true,
                        hintText: 'Email Address',
                        prefixIcon: const Icon(Icons.email),
                        prefixIconColor: Colors.red,
                        hintStyle: TextStyle(color: Colors.grey[500])),
                  ),
                ),
                const SizedBox(
                  height: 20,
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 20),
                  child: TextField(
                    controller: passwordController,
                    obscureText: true,
                    style: const TextStyle(color: Colors.black),
                    decoration: InputDecoration(
                        enabledBorder: const OutlineInputBorder(
                          borderSide: BorderSide(color: Colors.white),
                        ),
                        focusedBorder: const OutlineInputBorder(
                          borderSide: BorderSide(color: Colors.white),
                        ),
                        fillColor: Colors.white,
                        filled: true,
                        hintText: 'Password',
                        prefixIcon: const Icon(Icons.password),
                        prefixIconColor: Colors.red,
                        hintStyle: TextStyle(color: Colors.grey[500])),
                  ),
                ),
                const SizedBox(height: 20),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 20),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: const [
                      Text(
                        'Forgot password',
                        style: TextStyle(color: Colors.white),
                      ),
                    ],
                  ),
                ),
                const SizedBox(height: 20),
                // Login Button

                LoginButton(onTap: loginUser),

                const SizedBox(height: 25),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: const [
                    Text(
                      "Or login with",
                      style: TextStyle(color: Colors.white),
                    ),
                  ],
                ),
                const SizedBox(height: 20),
                GestureDetector(
                  onTap: () async {
                    final GoogleSignInAccount? account = await _googleSignIn.signIn();
                    if (account != null) {
                      // User signed in, handle the account object
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => Home()),
                      );
                    }
                  },
                  child: const Image(
                    image: AssetImage('assets/images/google.png'),
                    height: 80,
                  ),
                ),
                const SizedBox(height: 20),
                Row(mainAxisAlignment: MainAxisAlignment.center, children: [
                  const Text(
                    "Dont have an account?",
                    style: TextStyle(color: Colors.white),
                  ),
                  TextButton(
                    style: TextButton.styleFrom(
                      textStyle: const TextStyle(fontSize: 16),
                      foregroundColor: Colors.red,
                    ),
                    onPressed: () {
                      {
                        {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => const Register()),
                          );
                        }
                      }
                    },
                    child: const Text('Sign up'),
                  ),
                ]),
                const SizedBox(height: 60),
                const Text("WallAnime",
                    style: TextStyle(color: Colors.red, fontSize: 28))
              ],
            ),
          ),
        ));
  }
}
