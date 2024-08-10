import 'package:ether_plex/pallete.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class FeatureBox extends StatefulWidget {
  final Color color;
  final String headertext;
  final String descriptionText;
  const FeatureBox(
      {super.key,
      required this.color,
      required this.headertext,
      required this.descriptionText});

  @override
  State<FeatureBox> createState() => _FeatureBoxState();
}

class _FeatureBoxState extends State<FeatureBox> {
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(
        horizontal: 30,
        vertical: 10,
      ),
      decoration: BoxDecoration(
          color: widget.color,
          borderRadius: BorderRadius.all(Radius.circular(10))),
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 15).copyWith(
          left: 15,
        ),
        child: Column(
          children: [
            Align(
              alignment: Alignment.centerLeft,
              child: Text(
                widget.headertext,
                style: TextStyle(
                    fontFamily: 'OCRA',
                    color: Pallete.whiteColor,
                    fontSize: 18,fontWeight: FontWeight.bold),
              ),
            ),
            SizedBox(height: 10,),
            Text(
              widget.descriptionText,
              style: TextStyle(
                  fontFamily: 'OCRA',
                  color: Pallete.firstSuggestionBoxColor,
                  fontSize: 15),
            ),
          ],
        ),
      ),
    );
  }
}
