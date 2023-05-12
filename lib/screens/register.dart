import 'package:flutter/material.dart';
import 'package:hackanime/components/register_button.dart';
import 'package:hackanime/screens/login.dart';
import 'package:firebase_auth/firebase_auth.dart';

class Register extends StatefulWidget {
  const Register({super.key});

  @override
  State<Register> createState() => _RegisterState();
}

class _RegisterState extends State<Register> {
  final emailController = TextEditingController();
  final passwordController = TextEditingController();
  final confirmPasswordController = TextEditingController();

  void showError(String message) {
    showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          backgroundColor: Colors.black,
          title: Text(message),
        );
      },
    );
  }

  void showSuccess() {
    showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          backgroundColor: Colors.black,
          title: const Text('Registration Successful'),
          content: const Text('You have successfully registered.'),
          actions: [
            TextButton(
              onPressed: () {
                Navigator.pop(context);
              },
              child: const Text('OK'),
            ),
          ],
        );
      },
    );
  }

  Future<void> registerUser() async {
    showDialog(
      context: context,
      builder: (context) {
        return const Center(
          child: CircularProgressIndicator(),
        );
      },
    );

    try {
      if (passwordController.text == confirmPasswordController.text) {
        await FirebaseAuth.instance.createUserWithEmailAndPassword(
          email: emailController.text,
          password: passwordController.text,
        );
        Navigator.pop(context);
        showSuccess(); // show success dialog if user creation was successful
      } else {
        showError("Passwords don't match");
        Navigator.pop(context);
      }
    } on FirebaseAuthException catch (e) {
      showError(e.code);
      Navigator.pop(context);
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
              const SizedBox(
                height: 150,
              ),
              Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 20),
                  child: Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: const [
                        Text(
                          'Register Account',
                          style: TextStyle(color: Colors.red, fontSize: 20),
                        ),
                      ])),
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
                    hintText: "Email Address",
                    prefixIcon: const Icon(Icons.email),
                    prefixIconColor: Colors.red,
                    hintStyle: TextStyle(color: Colors.grey[500])
                  ),
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
                    hintStyle: TextStyle(color: Colors.grey[500])
                  ),
                ),
              ),
              const SizedBox(
                height: 20,
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20),
                child: TextField(
                  controller: confirmPasswordController,
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
                    hintText: 'Confirm Password',
                    prefixIcon: const Icon(Icons.password),
                    prefixIconColor: Colors.red,
                    hintStyle: TextStyle(color: Colors.grey[500])
                  ),
                ),
              ),
              const SizedBox(height: 30),
              RegisterButton(onTap: registerUser),
              const SizedBox(height: 25),
              Row( 
                mainAxisAlignment: MainAxisAlignment.center,
                  children: const [
                    Text("Or signup with", style: TextStyle(color: Colors.white),),
                  ],
              ),
              const SizedBox(height: 20),
              const Image(image: AssetImage('assets/images/google.png'),  height: 80,),
              const SizedBox(height: 20), 
              Row( 
                mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    const Text("Already have an account?", style: TextStyle(color: Colors.white),),
                   TextButton(
                    style: TextButton.styleFrom(
                      textStyle: const TextStyle(fontSize:16),
                      foregroundColor: Colors.red,
                          ),
                    onPressed: () {
                      {
                        {
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => const Login()),
                      );
                       }
                      }
                    },
                    child: const Text('Log In'),
                  ),
                  ]
              ), 
              const SizedBox(height: 60), 
              const Text("AnimeScroller", style: TextStyle(color: Colors.red, fontSize: 28))   
            ],
          ),
        ),
      ),
    );
  }
}
