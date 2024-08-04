import 'package:ether_plex/container_box.dart';
import 'package:ether_plex/pallete.dart';
import 'package:flutter/material.dart';
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
            image: AssetImage('assets/images/plainbackground.png'),
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
                    child: Container(
                      height: 150,
                      width: 150,
                      child: Image.asset('assets/images/Etherplexlogo.png'),
                    ),
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
                        fontFamily: 'OCRA',
                        color: Pallete.textcolor,
                        fontSize: 25,
                        fontWeight: FontWeight.w200),
                  ),
                ),
                SizedBox(
                  height: 10,
                ),
                Column(
                  children: [
                    FeatureBox(
                      color: Pallete.mainFontColor,
                      headertext: 'ChatGPT',
                      descriptionText:
                          'A smarter way to stay organized and informed with Chat GPT',
                    ),
                  ],
                ),
                Column(
                  children: [
                    FeatureBox(
                      color: Pallete.mainFontColor,
                      headertext: 'Dall-E',
                      descriptionText:
                          'Get creative with your personal assistant powered by Dall-E',
                    ),
                  ],
                ),
                Column(
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
                  if(await speechToText.hasPermission && speechToText.isNotListening){
                    await startListening();
                  } else if(speechToText.isListening){
                    await stopListening();
                  } else{
                    initSpeechToText();
                  }
                },
                child: Icon(Icons.mic),
                backgroundColor: Pallete.textcolor, // Change the color here
              ),
            ),
          ],
        ),
      ),
    );
  }
}
