import 'package:breaking_bad_series/res/colors.dart';
import 'package:flutter/material.dart';

class CharacterInfo extends StatelessWidget {
  final String title;
  final String info;

  const CharacterInfo({required this.title, required this.info});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(bottom: 10),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              Text(
                "$title : ",
                style: TextStyle(
                    color: Colors.white,
                    fontSize: 18,
                    fontWeight: FontWeight.w700),
              ),
              Text(
                info,
                style: TextStyle(
                    color: Colors.white,
                    fontSize: 16,
                    fontWeight: FontWeight.w600),
              ),
            ],
          ),
          SizedBox(
            width: 40,
            height: 10,
            child: Divider(color: MColors.yellow, thickness: 2),
          )
        ],
      ),
    );
  }
}
