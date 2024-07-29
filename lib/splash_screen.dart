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
    Timer(Duration(seconds: 15), () {
      Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => Homepage()));
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  'Etherplex',
                  style: TextStyle(
                    fontFamily: 'Etherplex',
                    color: Pallete.textcolor,
                    fontSize: 55,
                    shadows: [
                      Shadow(
                        offset: Offset(2.0, 2.0),
                        blurRadius: 3.0,
                        color: Color.fromARGB(128, 0, 0, 0),
                      ),
                    ],
                  ),
                ),
                SizedBox(height: 10),
                Text(
                  'Web3 based Chatbot',
                  style: TextStyle(
                    fontFamily: 'Etherplex',
                    color: Pallete.textcolor,
                    fontSize: 15,
                    shadows: [
                      Shadow(
                        offset: Offset(2.0, 2.0),
                        blurRadius: 3.0,
                        color: Color.fromARGB(128, 0, 0, 0),
                      ),
                    ],
                  ),
                ),
                SizedBox(height: 30),
                Wrap(
                  alignment: WrapAlignment.center,
                  spacing: 30.0,
                  runSpacing: 10.0,
                  children: [
                    Image.asset('assets/images/Cryptocurrency.png'),
                    Image.asset('assets/images/Cryptocurrency-1.png'),
                    Image.asset('assets/images/Cryptocurrency-2.png'),
                    Image.asset('assets/images/Cryptocurrency-3.png'),
                    Image.asset('assets/images/Cryptocurrency-4.png'),
                    Image.asset('assets/images/Cryptocurrency-5.png'),
                    Image.asset('assets/images/Cryptocurrency-6.png'),
                    Image.asset('assets/images/Cryptocurrency-7.png'),
                    Image.asset('assets/images/Cryptocurrency-8.png'),
                    Image.asset('assets/images/Cryptocurrency-9.png'),
                  ],
                ),
              ],
            ),
          ),
          Positioned(
            bottom: 50,
            left: 0,
            right: 0,
            child: Center(
              child: SpinKitFadingCube(color: Pallete.textcolor,size: 30,),
            ),
          ),
        ],
      ),
    );
  }
}
