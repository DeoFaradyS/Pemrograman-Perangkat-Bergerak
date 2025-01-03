import 'package:flutter/material.dart';
import '../source/components.dart';

class SplashScreen1 extends StatelessWidget {
  const SplashScreen1({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: SafeArea(
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 24),
          child: Column(
            children: [
              // Image
              Image(
                image: AssetImage("assets/images/image_splash_1.png"),
                height: 500,
              ),

              SizedBox(height: 40),

              // Text Group
              Text("Welcome to Echo!",
                  style: TextStyle(
                    fontFamily: 'Poppins',
                    fontSize: 24,
                    fontWeight: FontWeight.bold,
                  )),
              Text("Your shopping journey begins here."),

              SizedBox(height: 40),

              // Button Group
              Column(
                children: [
                  PrimaryButton(text: "Continue"),
                  SizedBox(height: 8),
                  SecondaryButton(text: "Skip the Intro"),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
