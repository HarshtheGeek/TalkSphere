import 'package:flutter/material.dart';
import 'package:ether_plex/pallete.dart'; // Ensure this path is correct

class FeatureBox extends StatefulWidget {
  final Color color;
  final String headertext;
  final String descriptionText;

  const FeatureBox({
    Key? key,
    required this.color,
    required this.headertext,
    required this.descriptionText,
  }) : super(key: key);

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
        boxShadow: [
          BoxShadow(
            color: Colors.black,
            spreadRadius: 1,
            blurRadius: 1,
          )
        ],
        color: widget.color,
        borderRadius: const BorderRadius.all(Radius.circular(10)),
      ),
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 15).copyWith(
          left: 15,
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              widget.headertext,
              style: const TextStyle(
                fontFamily: 'OCRA',
                color: Pallete.whiteColor,
                fontSize: 18,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(height: 10),
            Text(
              widget.descriptionText,
              style: const TextStyle(
                fontFamily: 'OCRA',
                color: Pallete.firstSuggestionBoxColor,
                fontSize: 15,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
