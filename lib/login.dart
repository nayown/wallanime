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
                  children: [
                    const Text(
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
                  style: TextStyle(color: Colors.black),
                  decoration: InputDecoration(
                    enabledBorder: OutlineInputBorder(
                      borderSide: BorderSide(color: Colors.grey),
                    ),
                    focusedBorder: OutlineInputBorder(
                      borderSide: BorderSide(color: Colors.white),
                    ),
                    fillColor: Colors.white,
                    filled: true,
                    hintText: 'Email Address',
                    prefixIcon: Icon(Icons.email),
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
                  style: TextStyle(color: Colors.black),
                  decoration: InputDecoration(
                    enabledBorder: OutlineInputBorder(
                      borderSide: BorderSide(color: Colors.white),
                    ),
                    focusedBorder: OutlineInputBorder(
                      borderSide: BorderSide(color: Colors.white),
                    ),
                    fillColor: Colors.white,
                    filled: true,
                    hintText: 'Password',
                    prefixIcon: Icon(Icons.password),
                    prefixIconColor: Colors.red,
                    hintStyle: TextStyle(color: Colors.grey[500])
                  ),
                ),
              ),
              SizedBox(height: 20),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    Text('Forgot password', style: TextStyle(color: Colors.white),),
                  ],
                ),
              ),
              SizedBox(height: 20),
              Container(
                padding: EdgeInsets.all(20),
                margin: EdgeInsets.symmetric(horizontal: 20),
                decoration: BoxDecoration(color: Colors.red, borderRadius: BorderRadius.circular(8)),
                child: Center(
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
              SizedBox(height: 25),
              Row( 
                mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text("Or login with", style: TextStyle(color: Colors.white),),
                  ],
              ),
              SizedBox(height: 20),
              Image.network(
                'http://pngimg.com/uploads/google/google_PNG19635.png',
                height: 80,
              ),         
              SizedBox(height: 20),  
              Row( 
                mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text("Dont have an account?", style: TextStyle(color: Colors.white),),
                    Text(" Sign up", style: TextStyle(color: Colors.red),),
                  ],
              ), 
              SizedBox(height: 60), 
              Text("AnimeScroller", style: TextStyle(color: Colors.red, fontSize: 30))  
            ],
            

          ),
        ),
      )
    );
  }
}