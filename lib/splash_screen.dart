import 'dart:async';
import 'package:ether_plex/home_page.dart';
import 'package:ether_plex/pallete.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';

class Splashscreen extends StatefulWidget {
  const Splashscreen({super.key});

  @override
  State<Splashscreen> createState() => _SplashscreenState();
}

class _SplashscreenState extends State<Splashscreen> {
  @override
  void initState() {
    super.initState();
    Timer(Duration(seconds: 7), () {
      Navigator.pushReplacement(
          context, MaterialPageRoute(builder: (context) => Homepage()));
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: BoxDecoration(
          image: DecorationImage(
            image: AssetImage('assets/images/backgroundfinalsplash.png'),
            fit:
                BoxFit.cover, // Adjust the image to cover the entire background
          ),
        ),
        child: Stack(
          children: [
            Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    'Etherplex',
                    style: TextStyle(
                      fontFamily: 'Etherplex',
                      color: Pallete.firstSuggestionBoxColor,
                      fontSize: 65,
                    ),
                  ),
                  SizedBox(height: 5),
                  Text(
                    'Web3 based Chatbot',
                    style: TextStyle(
                      fontFamily: 'OCRA',
                      color: Pallete.firstSuggestionBoxColor,
                      fontSize: 20,
                    ),
                  ),
                  SizedBox(height: 30),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Text(
                        'Powered by',
                        style: TextStyle(
                          fontFamily: 'OCRA',
                          color: Pallete.firstSuggestionBoxColor,
                          fontSize: 15,
                        ),
                      ),
                      SizedBox(
                          width:
                              8), // Adds space between the text and the image
                      Image.asset(
                        'assets/images/chatgpt.png',
                        scale: 30,
                      ),
                    ],
                  )
                ],
              ),
            ),
            Positioned(
              bottom: 50,
              left: 0,
              right: 0,
              child: Center(
                child: SpinKitFadingCube(
                  color: Pallete.firstSuggestionBoxColor,
                  size: 30,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
