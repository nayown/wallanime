import 'package:flutter/material.dart';

class Login extends StatefulWidget {
  const Login({super.key});

  @override
  State<Login> createState() => _LoginState();
}

class _LoginState extends State<Login> {
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
                child: Row( mainAxisAlignment: MainAxisAlignment.start,
                  children: const[
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
              const SizedBox(height: 20),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: const [
                    Text('Forgot password', style: TextStyle(color: Colors.white),),
                  ],
                ),
              ),
              const SizedBox(height: 20),
              Container(
                padding: const EdgeInsets.all(20),
                margin: const EdgeInsets.symmetric(horizontal: 20),
                decoration: BoxDecoration(color: Colors.red, borderRadius: BorderRadius.circular(8)),
                child: const Center(
                  child: Text(
                    "Log In",
                    style: TextStyle(
                      color: Colors.white,
                      fontWeight: FontWeight.w800,
                      fontSize: 16,
                    )
                  )
                ),
              ),
              const SizedBox(height: 25),
              Row( 
                mainAxisAlignment: MainAxisAlignment.center,
                  children: const [
                    Text("Or login with", style: TextStyle(color: Colors.white),),
                  ],
              ),
              const SizedBox(height: 20),
              const Image(image: AssetImage('assets/images/google.png'),  height: 80,),
              const SizedBox(height: 20),  
              Row( 
                mainAxisAlignment: MainAxisAlignment.center,
                  children: const [
                    Text("Dont have an account?", style: TextStyle(color: Colors.white),),
                    Text(" Sign up", style: TextStyle(color: Colors.red),),
                  ],
              ), 
              const SizedBox(height: 60), 
              const Text("AnimeScroller", style: TextStyle(color: Colors.red, fontSize: 28))  
            ],
            

          ),
        ),
      )
    );
  }
}