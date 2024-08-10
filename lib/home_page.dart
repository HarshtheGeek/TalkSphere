import 'package:ether_plex/container_box.dart';
import 'package:ether_plex/geminipage.dart';
import 'package:ether_plex/pallete.dart';
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
      appBar: AppBar(
        backgroundColor: const Color(0xFF181818),
        title: const Text(
          'Etherplex',
          style: TextStyle(fontFamily: 'Etherplex', color: Pallete.firstSuggestionBoxColor),
        ),
        centerTitle: true,
      ),
      body: Container(
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
                Center(
                  child: Padding(
                    padding: const EdgeInsets.all(10.0),
                      child: Lottie.asset('assets/animations/lottieanimation3.json',
                      width: 280,
                      height: 155),
                  ),
                ),
                Container(
                  padding: const EdgeInsets.symmetric(
                    horizontal: 20,
                    vertical: 10,
                  ),
                  margin: const EdgeInsets.symmetric(horizontal: 40).copyWith(
                    top: 30,
                  ),
                  decoration: BoxDecoration(
                    border: Border.all(color: Pallete.firstSuggestionBoxColor),
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
                          color: Pallete.firstSuggestionBoxColor,
                          fontSize: 20),
                    ),
                  ),
                ),
                Container(
                  padding: const EdgeInsets.all(10),
                  alignment: Alignment.centerLeft,
                  margin: const EdgeInsets.only(
                    top: 30,
                    left: 22,
                  ),
                  child: const Text(
                    'Here are few commands :',
                    style: TextStyle(
                        fontFamily: 'OCRA',
                        color: Pallete.firstSuggestionBoxColor,
                        fontSize: 25,
                        fontWeight: FontWeight.normal),
                  ),
                ),
                const SizedBox(
                  height: 10,
                ),
                const Column(
                  children: [
                    FeatureBox(
                      color: Pallete.mainFontColor,
                      headertext: 'ChatGPT',
                      descriptionText:
                          'A smarter way to stay organized and informed with Chat GPT',
                    ),
                  ],
                ),
                const Column(
                  children: [
                    FeatureBox(
                      color: Pallete.mainFontColor,
                      headertext: 'Dall-E',
                      descriptionText:
                          'Get creative with your personal assistant powered by Dall-E',
                    ),
                  ],
                ),
                const Column(
                  children: [
                    FeatureBox(
                      color: Pallete.mainFontColor,
                      headertext: 'Smart Voice Assistant',
                      descriptionText:
                          'Get the best of both with voice assistant powered by ChatGPT',
                    ),
                  ],
                ),
              ],
            ),
            Positioned(
              bottom: 20,
              right: 20,
              child: FloatingActionButton(
                onPressed: () async {
                  if (await speechToText.hasPermission &&
                      speechToText.isNotListening) {
                    await startListening();
                  } else if (speechToText.isListening) {
                    await stopListening();
                  } else {
                    initSpeechToText();
                  }
                },
                child: const Icon(Icons.mic),
                backgroundColor: Pallete.blackColor, // Change the color here
              ),
            ),
            Positioned(
              bottom: 100,
              right: 20,
              child: FloatingActionButton(
                onPressed: () {
                  // Navigate to the next page
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) =>const Geminipage()),
                  );
                },
                backgroundColor: Colors.black, // Make the FAB transparent
                elevation: 0, // Remove shadow
                child: SizedBox(
                  width: 35,
                  height: 35,
                  child: Lottie.asset(
                    'assets/animations/geminiiii.json', // Replace with your Lottie animation
                    fit: BoxFit.cover,
                  ),
                ),
              ),
            ),


          ],
        ),
      ),
    );
  }
}
