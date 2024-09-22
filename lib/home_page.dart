import 'package:ether_plex/Description_page.dart';
import 'package:ether_plex/Image_generator.dart';
import 'package:ether_plex/container_box.dart';
import 'package:ether_plex/geminipage.dart';
import 'package:ether_plex/pallete.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';
import 'package:speech_to_text/speech_recognition_result.dart';
import 'package:speech_to_text/speech_to_text.dart';

class Homepage extends StatefulWidget {
  const Homepage({super.key});

  @override
  State<Homepage> createState() => _HomepageState();
}

class _HomepageState extends State<Homepage> {
  final speechToText = SpeechToText();
  String lastWords = '';

  @override
  void initState() {
    super.initState();
    initSpeechToText();
  }

  Future<void> initSpeechToText() async {
    await speechToText.initialize();
    setState(() {});
  }

  Future<void> startListening() async {
    await speechToText.listen(onResult: onSpeechResult);
    setState(() {});
  }

  Future<void> stopListening() async {
    await speechToText.stop();
    setState(() {});
  }

  void onSpeechResult(SpeechRecognitionResult result) {
    setState(() {
      lastWords = result.recognizedWords;
    });
  }

  @override
  void dispose() {
    super.dispose();
    speechToText.stop();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: buildAppBar(),
      body: buildBody(context),
      floatingActionButton: buildFAB(),
    );
  }

  AppBar buildAppBar() {
    return AppBar(
      backgroundColor: const Color(0xFF181818),
      title: const Text(
        'TalkSphere',
        style: TextStyle(fontFamily: 'Etherplex', color: Pallete.firstSuggestionBoxColor),
      ),
      centerTitle: true,
    );
  }

  Widget buildBody(BuildContext context) {
    return Container(
      decoration: const BoxDecoration(
        image: DecorationImage(
          image: AssetImage('assets/images/geminibackground.png'),
          fit: BoxFit.cover,
        ),
      ),
      child: Stack(
        children: [
          Column(
            children: [
              buildLottieAnimation(),
              buildGreetingBox(),
              buildCommandsText(),
              buildFeatureBox(
                context,
                title: 'Gemini',
                description: 'A smarter way to stay organized and informed with Gemini',
                destination: const Geminipage(),
              ),
              buildFeatureBox(
                context,
                title: 'AI Image generator',
                description: 'Get creative with your personal assistant powered by Gemini',
                destination: const AIgenerator(),
              ),
              buildFeatureBox(
                context,
                title: 'Gen Explains',
                description: 'Powerful Image description generator at your fingertips',
                destination: const ImageChat(),
              ),
            ],
          ),
        ],
      ),
    );
  }

  Widget buildLottieAnimation() {
    return Center(
      child: Padding(
        padding: const EdgeInsets.all(10.0),
        child: Lottie.asset(
          'assets/animations/lottieanimation3.json', // Ensure the file path is correct
          width: 280,
          height: 155,
        ),
      ),
    );
  }

  Widget buildGreetingBox() {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
      margin: const EdgeInsets.symmetric(horizontal: 40).copyWith(top: 30),
      decoration: BoxDecoration(
        border: Border.all(color: Pallete.firstSuggestionBoxColor),
        borderRadius: BorderRadius.circular(20).copyWith(topLeft: Radius.zero),
      ),
      child: const Padding(
        padding: EdgeInsets.symmetric(vertical: 10),
        child: Text(
          'Hey User, What task can I do for you today?',
          style: TextStyle(
              fontFamily: 'OCRA',
              color: Pallete.firstSuggestionBoxColor,
              fontSize: 20),
        ),
      ),
    );
  }

  Widget buildCommandsText() {
    return Container(
      padding: const EdgeInsets.all(10),
      alignment: Alignment.centerLeft,
      margin: const EdgeInsets.only(top: 30, left: 22),
      child: const Text(
        'Here are few commands :',
        style: TextStyle(
            fontFamily: 'OCRA',
            color: Pallete.firstSuggestionBoxColor,
            fontSize: 25,
            fontWeight: FontWeight.normal),
      ),
    );
  }

  Widget buildFeatureBox(BuildContext context, {required String title, required String description, required Widget destination}) {
    return GestureDetector(
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => destination),
        );
      },
      child: Column(
        children: [
          FeatureBox(
            color: Pallete.mainFontColor,
            headertext: title,
            descriptionText: description,
          ),
        ],
      ),
    );
  }

  Widget buildFAB() {
    return Positioned(
      bottom: 20,
      right: 20,
      child: FloatingActionButton(
        onPressed: () async {
          if (await speechToText.hasPermission && speechToText.isNotListening) {
            await startListening();
          } else if (speechToText.isListening) {
            await stopListening();
          } else {
            initSpeechToText();
          }
        },
        child: const Icon(Icons.mic,color: Colors.white,),
        backgroundColor: Pallete.blackColor,
      ),
    );
  }
}
