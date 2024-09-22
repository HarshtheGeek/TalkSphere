import 'dart:convert';

import 'package:ether_plex/pallete.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class AIgenerator extends StatefulWidget {
  const AIgenerator({super.key});

  @override
  State<AIgenerator> createState() => _AIgeneratorState();
}

class _AIgeneratorState extends State<AIgenerator> {

  var APIkey = "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";

  generateImage() async {
    print("Image is generating");
    final uri = Uri.parse('https://api.openai.com/v1/images/generations');
    final headers = {
      "Content-Type": "application/json",
      "Authorization": "Bearer $APIkey"
    };
    final body = jsonEncode(
        {
          "model": "dall-e-3",
          "prompt": "A cute baby sea otter",
          "n": 1,
          "size": "1024x1024"
        }
    );

    try {
      final response = await http.post(uri, headers: headers, body: body);
      if (response.statusCode == 200) {
        final responseData = jsonDecode(response.body);
        print("Response data: $responseData");
      } else {
        print("Error in generating image: ${response.statusCode} - ${response.body}");
      }
    } catch (e) {
      print("Error: $e");
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: const Text(
          'AI image generator',
          style: TextStyle(
              fontFamily: 'OCRA', color: Pallete.firstSuggestionBoxColor),
        ),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: TextField(
                decoration: InputDecoration(
                  labelText: 'Enter your Prompt comarade',
                  labelStyle: const TextStyle(
                      color: Pallete.firstSuggestionBoxColor,
                      fontFamily: 'OCRA'),
                  hintText: 'Type something...',
                  hintStyle: TextStyle(color: Colors.grey[400]),
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(12.0),
                    borderSide: const BorderSide(
                        color: Pallete.firstSuggestionBoxColor, width: 2.0),
                  ),
                  focusedBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(12.0),
                    borderSide: const BorderSide(
                        color: Pallete.firstSuggestionBoxColor, width: 2.0),
                  ),
                  enabledBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(12.0),
                    borderSide: const BorderSide(
                        color: Pallete.firstSuggestionBoxColor, width: 1.0),
                  ),
                  contentPadding: const EdgeInsets.symmetric(
                      vertical: 20.0, horizontal: 15.0),
                  filled: true,
                  fillColor: Colors.transparent,
                ),
                style: const TextStyle(
                    fontSize: 16.0, color: Pallete.firstSuggestionBoxColor, fontFamily: 'ocra'),
              ),
            ),
            const SizedBox(
              height: 15,
            ),
            SizedBox(
              width: 300,
              height: 50,
              child: ElevatedButton(
                onPressed: () {
                  generateImage();
                },
                child: const Text(
                  "Generate",
                  style: TextStyle(
                      fontFamily: "OCRA",
                      color: Pallete.firstSuggestionBoxColor,
                      fontSize: 20),
                ),
                style: ElevatedButton.styleFrom(
                  backgroundColor: Pallete.mainFontColor,
                  padding: EdgeInsets.symmetric(
                      vertical: 12.0, horizontal: 20.0), // Padding
                  shape: RoundedRectangleBorder(
                    borderRadius:
                        BorderRadius.circular(10.0), // Rounded corners
                  ),
                  elevation: 3,
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
