import 'package:ether_plex/container_box.dart';
import 'package:ether_plex/pallete.dart';
import 'package:flutter/material.dart';

class Homepage extends StatefulWidget {
  const Homepage({super.key});

  @override
  State<Homepage> createState() => _HomepageState();
}

class _HomepageState extends State<Homepage> with TickerProviderStateMixin {
  late AnimationController _controller;
  late Animation<double> _rotationAnimation;
  late Animation<double> _radiusanimation;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.black,
        title: Text(
          'Etherplex',
          style: TextStyle(fontFamily: 'Etherplex', color: Pallete.textcolor),
        ),
        centerTitle: true,
        leading: Icon(
          Icons.menu,
          color: Pallete.textcolor,
        ),
      ),
      body: Container(
        decoration: BoxDecoration(
          image: DecorationImage(
            image: AssetImage('assets/images/backgroundtwofade.png'),
            fit:
                BoxFit.cover, // Adjust the image to cover the entire background
          ),
        ),
        child: Column(
          children: [
            Center(
                child: Padding(
              padding: const EdgeInsets.all(10.0),
              child: Container(
                  height: 150,
                  width: 150,
                  child: Image.asset(
                    'assets/images/Homepagebot.png',
                  )),
            )),

            //CHAT BUBBLE//

            Container(
              padding: const EdgeInsets.symmetric(
                horizontal: 20,
                vertical: 10,
              ),
              margin: const EdgeInsets.symmetric(horizontal: 40).copyWith(
                top: 30,
              ),
              decoration: BoxDecoration(
                border: Border.all(color: Pallete.textcolor),
                borderRadius: BorderRadius.circular(20).copyWith(
                  topLeft: Radius.zero,
                ),
              ),
              child: const Padding(
                padding: EdgeInsets.symmetric(vertical: 10),
                child: Text(
                  'Hey User, What task can I do for you today?',
                  style: TextStyle(
                      fontFamily: 'OCRA',
                      color: Pallete.textcolor,
                      fontSize: 20),
                ),
              ),
            ),
            Container(
              padding: EdgeInsets.all(10),
              alignment: Alignment.centerLeft,
              margin: EdgeInsets.only(
                top: 30,
                left: 22,
              ),
              child: const Text(
                'Here are few commands :',
                style: TextStyle(
                    fontFamily: 'OCRA', color: Pallete.textcolor, fontSize: 25,fontWeight: FontWeight.bold),
              ),
            ),
            SizedBox(height: 10,),
            //FEATURES LIST//
            Column(
              children: [
                FeatureBox(
                    color: Pallete.mainFontColor,
                    headertext: 'ChatGPT',
                    descriptionText:
                        'A smarter way to stay organized and informed with Chat GPT'),
              ],
            ),
            Column(
              children: [
                FeatureBox(
                    color: Pallete.mainFontColor,
                    headertext: 'Dall-E',
                    descriptionText:
                    'Get creative with your personal assistant powered by Dall-E'),
              ],
            ),
            Column(
              children: [
                FeatureBox(
                    color: Pallete.mainFontColor,
                    headertext: 'ChatGPT',
                    descriptionText:
                    'A smarter way to stay organized and informed with Chat GPT'),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
