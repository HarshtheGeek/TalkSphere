import 'dart:async';
import 'package:ether_plex/home_page.dart';
import 'package:ether_plex/pallete.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:lottie/lottie.dart';

class Splashscreen extends StatefulWidget {
  const Splashscreen({super.key});

  @override
  State<Splashscreen> createState() => _SplashscreenState();
}

class _SplashscreenState extends State<Splashscreen> {
  @override
  void initState() {
    super.initState();
    Timer(const Duration(seconds: 5), () {
      Navigator.pushReplacement(
          context, MaterialPageRoute(builder: (context) => const Homepage()));
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: const BoxDecoration(
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
                  const Text(
                    'TaLkSphere',
                    style: TextStyle(
                      fontFamily: 'Etherplex',
                      color: Pallete.firstSuggestionBoxColor,
                      fontSize: 60,
                    ),
                  ),
                  const SizedBox(height: 5),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      const Text(
                        'Powered by',
                        style: TextStyle(
                          fontFamily: 'OCRA',
                          color: Pallete.firstSuggestionBoxColor,
                          fontSize: 15,
                        ),
                      ),
                      const SizedBox(
                          width:
                              8),
                      Image.asset(
                        'assets/images/geminiimage.png',
                        height: 70,
                        width: 70,
                      ),
                    ],
                  )
                ],
              ),
            ),
            const Positioned(
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
