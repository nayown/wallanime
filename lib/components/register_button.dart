import 'package:flutter/material.dart';

class RegisterButton extends StatelessWidget {

  final Function()? onTap;
  const RegisterButton({super.key, required this.onTap});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        padding: const EdgeInsets.all(20),
        margin: const EdgeInsets.symmetric(horizontal: 20),
        decoration: BoxDecoration(
            color: Colors.red,
            borderRadius: BorderRadius.circular(8)),
        child: const Center(
            child: Text("Sign Up",
                style: TextStyle(
                  color: Colors.white,
                  fontWeight: FontWeight.w800,
                  fontSize: 16,
                ))),
      ),
    );
  }
}

