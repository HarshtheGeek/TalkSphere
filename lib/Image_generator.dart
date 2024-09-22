import 'package:ether_plex/pallete.dart';
import 'package:flutter/material.dart';

class AIgenerator extends StatefulWidget {
  const AIgenerator({super.key});

  @override
  State<AIgenerator> createState() => _AIgeneratorState();
}

class _AIgeneratorState extends State<AIgenerator> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text('AI image generator',style: TextStyle(fontFamily: 'OCRA',color: Pallete.firstSuggestionBoxColor),),
      )
    );
  }
}
