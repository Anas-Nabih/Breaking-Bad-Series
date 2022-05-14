import 'package:breaking_bad_series/res/colors.dart';
import 'package:flutter/material.dart';

class CharacterInfo extends StatelessWidget {
  final String title;
  final String info;

  const CharacterInfo({required this.title, required this.info});

  @override
  Widget build(BuildContext context) {
    return RichText(
      maxLines: 1,
      overflow: TextOverflow.ellipsis,
      text: TextSpan(
        children: [
          TextSpan(
            text:"$title :",
            style: TextStyle(fontSize: 18,fontWeight: FontWeight.bold)
          ),
          TextSpan(
            text:" $info",
            style: TextStyle(fontSize: 16)
          ),
        ]
      ),
    );
  }
}
